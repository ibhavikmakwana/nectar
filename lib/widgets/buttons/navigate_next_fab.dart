import 'package:flutter/material.dart';
import 'package:nectar/values/base_colors.dart';

class NavigateNextFab extends StatelessWidget {
  final VoidCallback onPressed;

  const NavigateNextFab({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        Icons.navigate_next,
        color: BaseColors.white,
        size: 32,
      ),
    );
  }
}
