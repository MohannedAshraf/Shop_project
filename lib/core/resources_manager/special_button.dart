import 'package:flutter/material.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';

class SpecialButton extends StatelessWidget {
  const SpecialButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 29),
      decoration: BoxDecoration(
        color: MyAppColors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: MyAppColors.background,
          ),
        ),
      ),
    );
  }
}
