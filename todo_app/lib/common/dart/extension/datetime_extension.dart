import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('yyyy년 MM월 dd일').format(this);

  String get relativeDays {
    final int diffDays = difference(DateTime.now().onlyDate).inDays;
    final bool isNegative = diffDays.isNegative;

    return switch ((diffDays, isNegative)) {
      (0, _) => _today,
      (1, _) => _tomorrow,
      (_, true) => _passed,
      _ => _left
    };
  }

  DateTime get onlyDate {
    return DateTime(year, month, day);
  }

  String get _today => "오늘까지";

  String get _tomorrow => "내일까지";

  String get _passed => "${difference(DateTime.now().onlyDate).inDays.abs()}일 지남";

  String get _left => "${difference(DateTime.now().onlyDate).inDays}일 남음";
}
