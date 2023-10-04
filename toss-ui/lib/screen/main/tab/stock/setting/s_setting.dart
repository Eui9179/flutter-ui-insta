import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_bid_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: EdgeInsets.only(top: 150),
            children: [
              Obx(() =>
                  SwitchMenu('푸시 설정', Prefs.isPushOnRx.get(), onChanged: (isOn) {
                    Prefs.isPushOnRx.set(isOn);
                  })),
              Obx(() => Slider(
                  value: Prefs.sliderPositionRx.get(),
                  onChanged: (value) {
                    Prefs.sliderPositionRx.set(value);
                  })),
              Obx(() => BigButton(
                      '날짜  ${Prefs.birthDay.get() == null ? "" : DateFormat('yyyy년 MM월 dd일').format(Prefs.birthDay.get()!)}',
                      onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(90.days),
                        lastDate: DateTime.now().add(90.days));
                    if (date != null) {
                      Prefs.birthDay.set(date);
                    }
                  })),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
              Container(
                height: 40,
                color: context.appColors.roundedLayoutBackground,
              ).pSymmetric(v: 20),
            ],
          ),
          AnimatedAppBar('설정', controller: scrollController),
        ],
      ),
    );
  }
}
