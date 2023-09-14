import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../vo_stock.dart';

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem(this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appBarBackground,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset(
          stock.stockImagePath,
          width: 36,
        ),
        width10,
        stock.name.text.bold.size(15).make(),
        emptyExpanded,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            stock.todayPercentageString.text.size(16).color(stock.getPriceColor(context)).make(),
            '${stock.currentPrice.toComma()}원'.text.color(context.appColors.lessImportant).make(),
          ],
        )
      ]).pSymmetric(v: 5, h: 20),
    );
  }
}
