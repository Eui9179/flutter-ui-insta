import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
import 'package:fast_app_base/screen/notification/vo/vo_toss_notification.dart';

final List<TossNotification> notificationDummies = [
  TossNotification(
    NotificationType.tossPay,
    '이번주에 영화 한 편 어때요? CGV 할인 쿠폰이 도착했어요',
    DateTime.now().subtract(27.minutes),
  ),
  TossNotification(
    NotificationType.stock,
    '인적분할에 대해 알려드릴게요.',
    DateTime.now().subtract(27.minutes),
    isRead: true,
  ),
  TossNotification(
    NotificationType.walk,
    '1,000걸음 이상 걸었다면 포인트 받으세요.',
    DateTime.now().subtract(27.minutes),
  ),
  TossNotification(
    NotificationType.moneyTip,
    '유럽 시품 물가가 치솟고 있어요\n이의찬님, 유럽 여행에 관심이 있다면 확인해보세요.',
    DateTime.now().subtract(27.minutes),
  ),
  TossNotification(
    NotificationType.walk,
    '오늘 1,000걸음 걸었어요. 포인트 받아보세요.',
    DateTime.now().subtract(27.minutes),
  ),
  TossNotification(
    NotificationType.luck,
    '6월 5일, 행운 복권이 도착했어요.',
    DateTime.now().subtract(27.minutes),
  ),
  TossNotification(
    NotificationType.people,
    '띵동! 월요일 공동구매 보러가기',
    DateTime.now().subtract(27.minutes),
  ),
];
