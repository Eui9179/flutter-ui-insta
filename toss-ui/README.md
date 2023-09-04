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
- Timeago 라이브러리 사용
- Sliver 사용
  ```dart
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("알림"),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => NotificationItemWidget(
            notification: notificationDummies[index],
            onTap: () {
              NotificationDialog([notificationDummies[0], notificationDummies[1]]).show();
            },
          ),
          childCount: notificationDummies.length,
        ))
      ],
    ),
  );
  ```
- TabBar
  ```dart
  TabBar(
    onTap: (index) => setState(() => currentIndex = index),
    labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    labelColor: Colors.white,
    labelPadding: const EdgeInsets.symmetric(vertical: 20),
    indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
    indicatorColor: Colors.white,
    indicatorSize: TabBarIndicatorSize.tab,
    controller: tabController,
    tabs: [
      "내 주식".text.make(),
      "오늘의 발견".text.make(),
    ],
  ),
  
  //onTap: (index) => setState (() => currentIndex)
  if(currentIndex == 0)
    const MyStockFragment()
  else
    const TodaysDiscoveryFragment()
  ```