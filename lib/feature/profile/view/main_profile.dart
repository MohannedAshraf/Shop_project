import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/utils/app_icons.dart';
import 'package:ntigradproject/core/utils/app_images.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';
import 'package:ntigradproject/feature/profile/view/widget/profile_card.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbartitle: Text(
          AppStrings.profile,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Center(
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.256,
              backgroundImage: AssetImage(MyAppImage.profile),
            ),
          ),
          SizedBox(height: 20),
          Center(child: Text(AppStrings.userfullname)),
          SizedBox(height: 30),
          ProfileCard(icon: MyAppIcons.logout, text: AppStrings.myprofile),
          ProfileCard(icon: MyAppIcons.profilebag, text: AppStrings.myorder),
          ProfileCard(icon: MyAppIcons.fav, text: AppStrings.favorite),
          ProfileCard(icon: MyAppIcons.setting, text: AppStrings.setting),
          SizedBox(height: 20),
          Center(child: SvgPicture.asset(MyAppIcons.line)),
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.only(left: 26, right: 26, bottom: 36),
            width: double.infinity,
            height: 26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(MyAppIcons.logout),
                SizedBox(width: 10),
                Text(AppStrings.logout),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
