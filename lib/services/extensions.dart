import 'package:flutter/material.dart';
import 'package:gestor_ingresos/utils/index.dart';

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

extension WidgetsExtensions on Widget {
  Widget zoom({double scale = 0.6}) => ZoomAnimation(this, scale: scale);

  Widget get inScroll => SingleChildScrollView(physics: const AlwaysScrollableScrollPhysics(), child: this);

  Widget get inScrollH => SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(), scrollDirection: Axis.horizontal, child: this);

  Widget get inCustomScroll => CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [SliverFillRemaining(hasScrollBody: false, child: this)]);

  Widget get inCustomScrollH => CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [SliverFillRemaining(hasScrollBody: false, child: this)],
        scrollDirection: Axis.horizontal,
      );

  Widget onHero(String tag) => Hero(tag: tag, child: Material(color: Colors.transparent, child: this));

  Widget withSymetricPadding({double horizontal = 0, double vertical = 0}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);

  Widget withRefreshIndicator(Future Function() function) => RefreshIndicator(
        onRefresh: function,
        child: Stack(children: [ListView(), this]),
      );

  Widget onPressed(VoidCallback onPressed, {BorderRadius? border, double circularRadius = 15}) => Material(
        color: Colors.transparent,
        borderRadius: border ?? BorderRadius.all(Radius.circular(circularRadius)),
        child: InkWell(
          borderRadius: border ?? BorderRadius.all(Radius.circular(circularRadius)),
          onTap: onPressed,
          child: this,
        ),
      );

  Widget get allSpace => SizedBox(height: double.infinity, width: double.infinity, child: this);

  Widget get fiteBox => FittedBox(child: this);

  Widget withUnfocus(BuildContext context) => GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: this,
      );

  Widget widthPercentage(BuildContext context, double percentaje) =>
      SizedBox(width: MediaQuery.of(context).size.width * percentaje, child: this);
}

extension ValidatorString on String {
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}

extension ValidatorStringNull on String? {
  String? get validateEmail {
    if (this == null) return 'Campo requerido';
    if (!this!.isValidEmail) return 'Correo inválido';
    return null;
  }

  String? get validatePassword {
    if (this == null || this!.isEmpty) return 'Campo requerido';
    return null;
  }
}
