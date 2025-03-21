import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_icons.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';

class FinalHomeView extends StatelessWidget {
  const FinalHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.specialbackground,
      appBar: MyAppBar(appbartitle: SvgPicture.asset(MyAppIcons.homelogo)),

      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MyAppColors.background,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextFormField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset(MyAppIcons.search),
                  hintText: 'Search any Product',
                  hintStyle: TextStyle(
                    color: MyAppColors.gray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textDirection: TextDirection.ltr,
              ),
            ),
            Text(
              AppStrings.allfeatured,
              style: TextStyle(color: MyAppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
