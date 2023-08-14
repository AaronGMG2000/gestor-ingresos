import 'package:flutter/material.dart';

class ZoomAnimation extends StatefulWidget {
  final Widget child;
  final double scale;
  const ZoomAnimation(this.child, {Key? key, this.scale = 0.6}) : super(key: key);

  @override
  State<ZoomAnimation> createState() => _ZoomAnimationState();
}

class _ZoomAnimationState extends State<ZoomAnimation> with SingleTickerProviderStateMixin {
  late Animation<double> scale;
  late Animation<double> opacity;
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    scale = Tween(begin: 1.0, end: widget.scale).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: scale.value,
          child: Opacity(opacity: opacity.value, child: widget.child),
        );
      },
    );
  }
}
