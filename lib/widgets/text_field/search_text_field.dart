import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/values/assets.dart';
import 'package:nectar/values/base_colors.dart';

class SearchTextField extends StatelessWidget {
  final VoidCallback onSuffixPressed;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String hintText;
  const SearchTextField({
    Key key,
    this.onSuffixPressed,
    this.onChanged,
    this.controller,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: BaseColors.grayishLimeGreen,
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: BaseColors.gray1,
        ),
        suffixIcon: Material(
          shape: CircleBorder(),
          color: Colors.transparent,
          child: IconButton(
            splashRadius: 24,
            icon: SvgPicture.asset(SVGs.icCircleClear),
            onPressed: onSuffixPressed,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
