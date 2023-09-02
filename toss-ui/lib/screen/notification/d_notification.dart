import 'package:fast_app_base/screen/notification/vo/vo_toss_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class NotificationDialog extends DialogWidget {
  final List<TossNotification> notification;

  NotificationDialog(this.notification, {super.key});

  @override
  DialogState<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widget.notification
              .map((element) => NotificationItemWidget(
                  notification: element,
                  onTap: () {
                    widget.hide();
                  }))
              .toList()
        ],
      ),
    );
  }
}
