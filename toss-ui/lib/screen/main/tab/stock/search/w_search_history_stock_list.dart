import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SearchHistoryStockList extends StatefulWidget {
  const SearchHistoryStockList({super.key});

  @override
  State<SearchHistoryStockList> createState() => _SearchHistoryStockListState();
}

class _SearchHistoryStockListState extends State<SearchHistoryStockList>
    with SearchStockDataProvider {
  @override
  Widget build(BuildContext context) {
    final List<String> searchHistoryList = searchData.searchHistoryList;
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: searchHistoryList.length,
            itemBuilder: (context, index) => getHistoryBox(index),
          )),
    ).pSymmetric(v: SearchStockScreen.padding);
  }

  Widget getHistoryBox(int index) {
    String stockName = searchData.searchHistoryList[index];
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tap(
                onTap: () {
                  Nav.push(StockDetailScreen(stockName));
                  searchData.moveFirst(index);
                },
                child: stockName.text.make(),
              ),
              width5,
              Tap(
                onTap: () {
                  searchData.removeHistory(index);
                },
                child: const Icon(
                  Icons.close,
                  size: 16,
                ),
              ),
            ],
          )
              .box
              .withRounded(value: 6)
              .p8
              .color(context.appColors.searchHistory)
              .make(),
        ),
      ],
    );
  }
}
