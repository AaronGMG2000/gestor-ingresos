import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestor_ingresos/services/extensions.dart';
import 'package:gestor_ingresos/utils/app_color.dart';
import 'package:get/get.dart';

class DragContainer extends StatefulWidget {
  final double minHeigth;
  final double initialHeight;
  final double maxHeigth;
  final List<Widget> children;
  final Color? backgroundColor;
  const DragContainer({
    Key? key,
    this.initialHeight = 0.45,
    this.maxHeigth = 0.55,
    this.minHeigth = 0.3,
    this.children = const [],
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<DragContainer> createState() => _DragContainerState();
}

class _DragContainerState extends State<DragContainer> {
  late double _x = widget.initialHeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        _x += -details.delta.dy / MediaQuery.of(context).size.height;
        if (_x > widget.maxHeigth) {
          _x = widget.maxHeigth;
        } else if (_x < widget.minHeigth) {
          _x = widget.minHeigth;
        }
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * _x,
        decoration: BoxDecoration(
          color:
              widget.backgroundColor ?? (Get.isDarkMode ? AppColor.shared.backgroundDark : AppColor.shared.background),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const Icon(Icons.drag_handle),
            const Gutter(),
            Expanded(child: Column(children: widget.children).inScroll),
          ],
        ),
      ),
    );
  }
}
