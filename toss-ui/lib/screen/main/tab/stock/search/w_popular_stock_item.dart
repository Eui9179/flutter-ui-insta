import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../common/widget/w_height_and_width.dart';

class PopularStockItem extends StatelessWidget {
  final PopularStock stock;
  final int number;

  const PopularStockItem({
    super.key,
    required this.stock,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 30, child: number.text.make()),
        width20,
        stock.name.text.make(),
        emptyExpanded,
        stock.todayPercentageString.text
            .color(stock.getPriceColor(context))
            .make(),
      ],
    ).pSymmetric(v: 25);
  }
}
