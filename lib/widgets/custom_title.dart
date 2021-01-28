import 'package:flutter/material.dart';
import 'package:nectar/values/base_colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: BaseColors.gray1,
            ),
          ),
          const SizedBox(height: 24),
          Divider(),
        ],
      ),
    );
  }
}
