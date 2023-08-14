import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageProvider {
  static FirebaseStorageProvider shared = FirebaseStorageProvider._();
  FirebaseStorageProvider._();

  FirebaseStorage get instance => FirebaseStorage.instance;
}
