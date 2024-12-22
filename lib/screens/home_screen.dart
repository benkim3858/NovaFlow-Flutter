import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/global_bottom_navigation.dart';
import '../widgets/categories.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // foregroundColor: Colors.white,
        title: Text('Nova Flow'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
              ))
        ],
        centerTitle: true,
        // bottom: SearchBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventCarousel(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Categories'),
                  ),
                  Container(
                    child: Text('전체 보기'),
                  )
                ],
              ),
              SizedBox(height: 16),
              Categories(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Newly added products'),
                  ),
                  Container(
                    child: Text('전체 보기'),
                  )
                ],
              ),
              SizedBox(height: 16),
              ProductCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GlobalBottomNavigation(
        selectedIndex: _selectedIndex,
        onIndexChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

/// 이벤트 영역 - Event Carousel
class EventCarousel extends StatefulWidget {
  const EventCarousel({super.key});

  @override
  State<EventCarousel> createState() => _EventCarouselState();
}

class _EventCarouselState extends State<EventCarousel> {
  Timer? timer;
  PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      child: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Image.asset(
                'asset/img/image_$e.jpeg',
                fit: BoxFit.cover,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // 페이지 변경 감지를 위한 리스너 추가
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });

    timer = Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        int currentPage = controller.page!.toInt();
        int nextPage = currentPage + 1;

        if (nextPage > 4) {
          nextPage = 0;
        }

        controller.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      },
    );
  }

  /// dispose 생명주기
  /// 생성된 timer 와 controller 를 종료시켜 주지않으면 메모리 릭 발생
  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    controller.dispose();
    super.dispose();
  }
}
