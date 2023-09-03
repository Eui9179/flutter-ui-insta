import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_toss_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_bid_button.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          RefreshIndicator(
            edgeOffset: TossAppBar.appBarHeight,
            onRefresh: () async {
              await sleepAsync(1000.ms);
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: TossAppBar.appBarHeight,
                bottom: MainScreenState.bottomNavigatorHeight,
              ),
              child: Column(
                children: [
                  BigButton(
                    "토스뱅크",
                    onTap: () => context.showSnackbar('tap Bid button'),
                  ),
                  height10,
                  RoundedContainer(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "자산".text.bold.white.make(),
                      height5,
                      ...bankAccounts
                          .map((account) => BankAccountWidget(account))
                          .toList()
                    ],
                  ))
                ],
              ).pSymmetric(h: 16),
            ),
          ),
          TossAppBar(),
        ],
      ),
    );
  }
}
