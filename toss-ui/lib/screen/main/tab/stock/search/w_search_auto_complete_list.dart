import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:flutter/material.dart';

class SearchAutoCompleteList extends StatelessWidget
    with SearchStockDataProvider {
  final TextEditingController controller;

  SearchAutoCompleteList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: searchData.autoCompleteList.length,
        itemBuilder: (context, index) {
          final SimpleStock stock = searchData.autoCompleteList[index];
          final String stockName = stock.name;
          return Tap(
            onTap: () {
              Nav.push(StockDetailScreen(stockName));
              searchData.addHistory(stockName);
              controller.clear();
            },
            child: stockName.text.make(),
          ).p(SearchStockScreen.padding);
        });
  }
}
