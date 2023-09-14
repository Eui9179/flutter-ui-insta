import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_stock_item.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_long_button.dart';
import '../stocks_dummy.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyAccount(context),
        height20,
        getMyStocks(context),
        const Height(80)
      ],
    );
  }

  Widget getMyAccount(BuildContext context) => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height20,
                '계좌'.text.make(),
                Row(
                  children: [
                    '433원'.text.size(24).bold.make(),
                    Arrow(),
                    emptyExpanded,
                    RoundedContainer(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      radius: 8,
                      backgroundColor: context.appColors.buttonBackground,
                      child: '채우기'.text.size(12).make(),
                    ),
                  ],
                ),
                height20,
              ],
            ).pSymmetric(h: 20),
            Line(
              color: context.appColors.divider,
            ),
            Column(
              children: [
                LongButton(
                  title: '주문내역',
                  onTap: () {},
                ),
                LongButton(
                  title: '판매수익',
                  onTap: () {},
                ),
              ],
            ).pSymmetric(h: 20),
          ],
        ),
      );

  Widget getMyStocks(BuildContext context) => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '관심주식'.text.bold.make(),
                    '편집하기'.text.color(context.appColors.lessImportant).make(),
                  ],
                ).pSymmetric(h: 20, v: 0),
                height20,
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: '기본'.text.size(14).make(),
                    tilePadding: const EdgeInsets.symmetric(horizontal: 20),
                    iconColor: Colors.white,
                    children: [
                      ...myInterestStocks.map((element) => StockItem(element))
                    ],
                  ),
                ),
              ],
            ).pOnly(top: 20),
          ],
        ),
      );
}
