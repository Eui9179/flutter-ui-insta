import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/stocks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_stock_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../common/widget/w_height_and_width.dart';

class InterestStockList extends StatelessWidget {
  const InterestStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appBarBackground,
      child: Column(
        children: [
          height5,
          ...myInterestStocks.map((element) => StockItem(element)).toList(),
        ],
      ),
    );
  }
}