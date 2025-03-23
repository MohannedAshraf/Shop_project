import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_icons.dart';
import 'package:ntigradproject/core/utils/app_images.dart';
import 'package:ntigradproject/feature/home/view/final_home_view.dart';
import 'package:ntigradproject/feature/items/view/item_view.dart';
import 'package:ntigradproject/feature/profile/view/main_profile.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  int navBarCurrentIndex = 0;
  List<Widget> screens = [FinalHomeView(), ItemsView(), MainProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 25,
        child: Container(
          decoration: BoxDecoration(
            color: MyAppColors.red,
            shape: BoxShape.circle,
            border: Border.all(color: MyAppColors.red),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(MyAppIcons.bag, fit: BoxFit.cover),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            navBarCurrentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: navBarCurrentIndex == 0 ? Colors.red : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_checkout,
              color: navBarCurrentIndex == 1 ? Colors.red : Colors.black,
            ),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2,
              color: navBarCurrentIndex == 2 ? Colors.red : Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[navBarCurrentIndex],
    );
  }
}
