import 'package:flutter/material.dart';
import 'package:ntigradproject/core/resources_manager/default-appbar.dart';
import 'package:ntigradproject/core/resources_manager/special_button.dart';
import 'package:ntigradproject/core/utils/app-colors.dart';
import 'package:ntigradproject/core/utils/app_images.dart';
import 'package:ntigradproject/core/utils/app_strings.dart';
import 'package:ntigradproject/feature/cart/views/widget/order_card.dart';
import 'package:ntigradproject/feature/cart/views/widget/order_card2.dart';
import 'package:ntigradproject/feature/order/view/widget/order_status.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leadingicon: Icon(Icons.arrow_back_ios),
        appbartitle: Text(
          AppStrings.orderdetails,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppStrings.ordernum,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 170),
                Text(
                  AppStrings.active,
                  style: TextStyle(
                    color: MyAppColors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(
              AppStrings.orderdate2,
              style: TextStyle(
                color: MyAppColors.datecolor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
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
            SizedBox(height: 20),
            Row(
              children: [
                Text(AppStrings.subtotal),
                Spacer(),
                Text(
                  AppStrings.subprice,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(AppStrings.taxfees),
                Spacer(),
                Text(
                  AppStrings.taxprice,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(AppStrings.delivery),
                Spacer(),
                Text(
                  AppStrings.deliveryprice,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Text(
              style: TextStyle(color: MyAppColors.gray),
              "_______________________________________________________",
            ),
            SizedBox(height: 15),

            Row(
              children: [
                Text(
                  AppStrings.totalorders,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  AppStrings.totalordersprice,
                  style: TextStyle(
                    color: MyAppColors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrderStatus(
                    color: MyAppColors.red,
                    text: Text(
                      "Cancel Order",
                      style: TextStyle(
                        color: MyAppColors.background,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  OrderStatus(
                    color: MyAppColors.red,
                    text: Text(
                      AppStrings.trackdriver,
                      style: TextStyle(
                        color: MyAppColors.background,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
