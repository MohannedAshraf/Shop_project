import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_icons.dart';
import 'package:ntigradproject/core/utils/app_images.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leadingicon: Icon(Icons.arrow_back_ios),
        appbartitle: Text(
          AppStrings.product,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, right: 12),
              margin: EdgeInsets.only(left: 10, top: 30, bottom: 30, right: 30),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 16, right: 12),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.379,
                    //  margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: MyAppColors.background,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(MyAppImage.shirt),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SvgPicture.asset(MyAppIcons.redheart),
                  ),
                ],
              ),
            ),
            Text(
              AppStrings.mensstarry,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            Text(
              AppStrings.productdetails,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    AppStrings.productprice,
                    style: TextStyle(
                      fontSize: 15,
                      color: MyAppColors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  ItemCount(
                    color: MyAppColors.red,
                    initialValue: 1,
                    step: 1,

                    minValue: 1,
                    maxValue: 10,
                    decimalPlaces: 0,
                    onChanged: (value) {
                      //using cubit to change the  value
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.064,
              margin: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyAppColors.red,
              ),
              child: TextButton(
                onPressed: () {},
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: MyAppColors.background,
                      ),
                      Text(
                        AppStrings.addtocart,
                        style: TextStyle(
                          color: MyAppColors.background,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
