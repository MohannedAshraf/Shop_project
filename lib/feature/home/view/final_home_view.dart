import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_icons.dart';
import 'package:ntigradproject/core/utils/app_images.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';
import 'package:ntigradproject/feature/home/view/widget/category_view.dart';
import 'package:ntigradproject/feature/home/view/widget/item_card.dart';

class FinalHomeView extends StatelessWidget {
  const FinalHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.specialbackground,
      appBar: MyAppBar(appbartitle: SvgPicture.asset(MyAppIcons.homelogo)),

      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  AppStrings.allfeatured,
                  style: TextStyle(
                    color: MyAppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 25),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CategoryView(
                          categorytext: AppStrings.beauty,
                          image: MyAppImage.makeup,
                        ),
                        CategoryView(
                          categorytext: AppStrings.fashion,
                          image: MyAppImage.women,
                        ),
                        CategoryView(
                          categorytext: AppStrings.kids,
                          image: MyAppImage.clothes,
                        ),
                        CategoryView(
                          categorytext: AppStrings.mens,
                          image: MyAppImage.room,
                        ),
                        CategoryView(
                          categorytext: AppStrings.womens,
                          image: MyAppImage.teshirt,
                        ),
                        CategoryView(
                          categorytext: AppStrings.gifts,
                          image: MyAppImage.gift,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              CarouselSlider(
                items:
                    [1, 2, 3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber,
                            ),
                            child: SvgPicture.asset(MyAppIcons.slider),
                          );
                        },
                      );
                    }).toList(),
                options: CarouselOptions(viewportFraction: 1, autoPlay: true),
              ),
              Center(child: DotsIndicator(dotsCount: 3)),
              Text(
                AppStrings.recommended,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              SizedBox(child: Row(children: [ItemCard(), ItemCard()])),
            ],
          ),
        ),
      ),
    );
  }
}
