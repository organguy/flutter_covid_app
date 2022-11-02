import 'package:covid_info/src/canvas/arrow_clip_path.dart';
import 'package:covid_info/src/components/bar_chart.dart';
import 'package:covid_info/src/components/statistics_view.dart';
import 'package:covid_info/src/controllers/covid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<CovidController> {
  App({Key? key}) : super(key: key);

  var headerTopZone;

  List<Widget> _background() {
    return [
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff3c727c),
                Color(0xff33656e),
              ]
          ),
        ),
      ),
      Positioned(
        left: -110,
        top: headerTopZone + 40,
        child: Image.asset(
          'assets/covid_img.png',
          width: Get.size.width * 0.7,
        ),
      ),
      Positioned(
        top: headerTopZone + 10,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff195f68)
            ),
            child: Obx(() {
              return Text(
                controller.todayData.standardDate,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              );
            }),
          ),
        ),
      ),
      Positioned(
        top: headerTopZone + 60,
        right: 30,
        child: Obx(() {
          return StatisticsView(
            title: '확진자',
            addedCount: controller.todayData.calcDecideCnt.abs(),
            totalCount: controller.todayData.decideCnt!,
            upDown: controller.calcUpDown(controller.todayData.calcDecideCnt),
            titleColor: Colors.white,
            subValueColor: Colors.white,
          );
        }),
      )
    ];
  }

  Widget _todayStatistics() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StatisticsView(
              title: '격리해제',
              addedCount: controller.todayData.calcClearCnt.abs(),
              totalCount: controller.todayData.clearCnt!,
              upDown: controller.calcUpDown(controller.todayData.calcClearCnt),
              dense: true,
            ),
          ),
          const SizedBox(
            height: 60,
            child: VerticalDivider(
              color: Color(0xffc7c7c7),
            ),
          ),
          Expanded(
            child: StatisticsView(
              title: '검사중',
              addedCount: controller.todayData.calcExamCnt.abs(),
              totalCount: controller.todayData.examCnt!,
              upDown: controller.calcUpDown(controller.todayData.calcExamCnt),
              dense: true,
            ),
          ),
          const SizedBox(
            height: 60,
            child: VerticalDivider(
              color: Color(0xffc7c7c7),
            ),
          ),
          Expanded(
            child: StatisticsView(
              title: '사망자',
              addedCount: controller.todayData.calcDeathCnt,
              totalCount: controller.todayData.deathCnt!,
              upDown: controller.calcUpDown(controller.todayData.calcDeathCnt),
              dense: true,
            ),
          ),
        ],
      );
    });
  }

  Widget _trendsChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '확진자 추이',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
        AspectRatio(
          aspectRatio: 1.2,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)),
            child: Obx(() {
              return controller.weekDatas.isEmpty
                  ? Container()
                  : CovidBarChart(
                      covidDatas: controller.weekDatas,
                      maxY: controller.maxDecideValue,
                      minY: controller.minDecideValue,
                  );
            }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    headerTopZone = Get.mediaQuery.padding.top + AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Icon(
                Icons.notifications
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ..._background(),
          Positioned(
            top: headerTopZone + 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      _todayStatistics(),
                      const SizedBox(height: 40,),
                      _trendsChart(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}