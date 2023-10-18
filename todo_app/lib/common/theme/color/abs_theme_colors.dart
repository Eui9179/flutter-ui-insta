import 'package:fast_app_base/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

export 'package:fast_app_base/common/constant/app_colors.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  Color get veryBrightGrey => AppColors.brightGrey;

  Color get drawerBg => const Color.fromARGB(255, 255, 255, 255);

  Color get iconButton => const Color.fromARGB(255, 0, 0, 0);

  Color get iconButtonInactivate => const Color.fromARGB(255, 162, 162, 162);

  Color get inActivate => const Color.fromARGB(255, 200, 207, 220);

  Color get activate => const Color.fromARGB(255, 63, 72, 95);

  Color get badgeBg => AppColors.blueGreen;

  Color get textBadgeText => Colors.white;

  Color get badgeBorder => Colors.transparent;

  Color get divider => const Color.fromARGB(255, 228, 228, 228);

  Color get text => AppColors.darkGrey;

  Color get hintText => AppColors.middleGrey;

  Color get focusedBorder => AppColors.darkGrey;

  Color get confirmText => AppColors.blue;

  Color get drawerText => text;

  Color get snackbarBgColor => AppColors.mediumBlue;

  Color get blueButtonBackground => AppColors.darkBlue;

  Color get bottomSheetBackground => drawerBg;

  Color get checkBoxColor => const Color(0xff108243);

  Color get itemBackground => const Color.fromARGB(255, 241, 241, 241);

  Color get checkBoxOngoingColor => const Color.fromARGB(255, 58, 98, 255);

  Color get checkColor => const Color.fromARGB(255, 255, 255, 255);

  Color get todoItemDelete => const Color.fromARGB(255, 248, 82, 82);

  Color get dismissibleIcon => const Color.fromARGB(255, 255, 255, 255);
}
