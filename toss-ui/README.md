## 구현한 기능

- Splash 화면
- Home 화면 (`velocity_x`, `Stack 위젯을 사용한 알림 아이콘 표시`)
  ```dart
  Stack(
    children: [
      Image.asset(
        "$basePath/icon/notification.png",
        height: 30,
      ),
      if (_showRedDot)
        Positioned.fill(
            child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ))
      ],
    ),
  ```

- BottomNavigation
- Pull to refresh
    ```dart
    RefreshIndicator(
      edgeOffset: TossAppBar.appBarHeight,
      onRefresh: () async {
        await sleepAsync(1000.ms);
      },
      child: SingleChildScrollView()
    )
    ```