import 'package:flutter/material.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/resources_manager/special_button.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_images.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';
import 'package:ntigradproject/feature/cart/views/widget/order_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appbartitle: Text(
          AppStrings.cart,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                AppStrings.shoppinglist,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            OrderCard(
              image: MyAppImage.ladyorder,
              ordername: AppStrings.product1name,
              orderrate: AppStrings.product1rate,
              orderprice: AppStrings.finalprice1,
              orderoldprice: AppStrings.oldprice1,
            ),
            OrderCard(
              image: MyAppImage.manorder,
              ordername: AppStrings.product2name,
              orderrate: AppStrings.product2rate,
              orderprice: AppStrings.finalprice2,
              orderoldprice: AppStrings.oldprice2,
            ),
            Text(
              style: TextStyle(color: MyAppColors.gray),
              "_______________________________________________________",
            ),
            Row(
              children: [
                Text(AppStrings.subtotal),
                Spacer(),
                Text(AppStrings.subprice),
              ],
            ),
            Row(
              children: [
                Text(AppStrings.taxfees),
                Spacer(),
                Text(AppStrings.taxprice),
              ],
            ),
            Row(
              children: [
                Text(AppStrings.delivery),
                Spacer(),
                Text(AppStrings.deliveryprice),
              ],
            ),
            Text(
              style: TextStyle(color: MyAppColors.gray),
              "_______________________________________________________",
            ),
            Row(
              children: [
                Text(AppStrings.totalorder),
                Spacer(),
                Text(AppStrings.totalordersprice),
              ],
            ),
            SizedBox(height: 25),
            SpecialButton(text: AppStrings.checkout),
          ],
        ),
      ),
    );
  }
}
