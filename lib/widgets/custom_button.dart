import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestor_ingresos/utils/index.dart';

class CustomButton extends StatelessWidget {
  final Color? background;
  final Color? textColor;
  final double textSize;
  final String text;
  final VoidCallback? onTap;
  final String? url;
  const CustomButton(
    this.text, {
    Key? key,
    this.url,
    this.background,
    this.textColor,
    this.textSize = 18,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (url != null) Image.asset(url!, height: textSize * 1.5, width: textSize * 1.5),
          if (url != null) const Gutter(),
          AutoSizeText(text, style: AppFonts.shared.buttonFont(textColor, textSize), maxLines: 1),
        ],
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final Color? background;
  final Color? textColor;
  final double size;
  final VoidCallback? onTap;
  final String url;
  const ImageButton({
    Key? key,
    required this.url,
    this.background,
    this.textColor,
    this.size = 18,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onTap,
      child: Image.asset(url, height: size * 1.5, width: size * 1.5),
    );
  }
}
