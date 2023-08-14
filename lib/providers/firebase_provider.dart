import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:gestor_ingresos/providers/index.dart';

class FirebaseProvider {
  static FirebaseProvider shared = FirebaseProvider._();
  FirebaseProvider._();

  Future<void> init() async {
    await Firebase.initializeApp();
    await _initializeC();
    await _initializeCM();
    await _initializeFA();
  }

  Future<void> _initializeC() async {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
    Function onOriginError = FlutterError.onError as Function;
    FlutterError.onError = (FlutterErrorDetails details) async {
      await FirebaseCrashlytics.instance.recordFlutterError(details);
      onOriginError(details);
    };
  }

  Future<void> _initializeCM() async {
    FirebaseMessaging cloudMessaging = FirebaseMessaging.instance;
    await cloudMessaging.requestPermission();
    await cloudMessaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    debugPrint('FCM-token: ${await cloudMessaging.getToken() ?? ''}');

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      debugPrint('FCM-onMessage: ${remoteMessage.notification!.title ?? ''}');
      NotificationProvider.shared.showNotification(
        title: remoteMessage.notification!.title ?? '',
        body: remoteMessage.notification!.body ?? '',
        payload: remoteMessage.data.toString(),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint('FCM-onMessageOpenedApp: ${event.notification!.title ?? ''}');
    });
  }

  Future<void> _initializeFA() async {
    final analytics = FirebaseAnalytics.instance;
    analytics.logAppOpen();
  }
}
