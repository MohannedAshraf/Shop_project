import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.bottommargin,
    required this.labeltext,
    required this.icon,
    this.endicon,
    this.controller,
    this.validator,
  });
  final double bottommargin;
  final String labeltext;
  final String icon;
  final Widget? endicon;
  final TextEditingController? controller;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 30, right: 30, bottom: bottommargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyAppColors.textformbordercolor),

        color: MyAppColors.textformcolor,
      ),
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labeltext,
          icon: SvgPicture.asset(icon),
          suffixIcon: endicon,
        ),
      ),
    );
  }
}
