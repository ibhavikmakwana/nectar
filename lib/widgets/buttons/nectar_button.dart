import 'package:flutter/material.dart';
import 'package:nectar/values/base_colors.dart';

class NectarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double minWidth;
  final Color color;
  final Widget leadingWidget;

  const NectarButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.minWidth,
    this.color = BaseColors.accentColor,
    this.leadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingWidget != null) ...{
            leadingWidget,
            const SizedBox(width: 16),
          },
          Text(
            text,
            style: TextStyle(color: BaseColors.white),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      minWidth: minWidth,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      color: color,
    );
  }
}
