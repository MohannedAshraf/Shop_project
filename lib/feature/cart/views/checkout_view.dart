import 'package:flutter/material.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/resources_manager/special_button.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_images.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';
import 'package:ntigradproject/feature/cart/views/widget/order_card.dart';
import 'package:ntigradproject/feature/cart/views/widget/order_card2.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbartitle: Text(AppStrings.checkout),
        leadingicon: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Icon(Icons.map), Text(AppStrings.delevadd)]),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.64,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: MyAppColors.background,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.add),
                        Text(AppStrings.addtitle),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: MyAppColors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.map, color: MyAppColors.background),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                AppStrings.shoppinglist,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),

            OrderCard2(
              image: MyAppImage.ladyorder,
              ordername: AppStrings.product1name,
              orderrate: AppStrings.product1rate,
              orderprice: AppStrings.finalprice1,
              orderoldprice: AppStrings.oldprice1,
            ),
            OrderCard2(
              image: MyAppImage.manorder,
              ordername: AppStrings.product2name,
              orderrate: AppStrings.product2rate,
              orderprice: AppStrings.finalprice2,
              orderoldprice: AppStrings.oldprice2,
            ),
            SizedBox(height: 25),
            SpecialButton(text: AppStrings.placeorder),
          ],
        ),
      ),
    );
  }
}
