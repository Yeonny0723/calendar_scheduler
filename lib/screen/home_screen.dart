import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/constant/colors.dart';
import 'package:calendar_scheduler/today_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(),
        body: SafeArea(
      child: Column(
        children: [
          Calendar(
            selectedDay: selectedDay,
            focusedDay: focusedDay,
            onDaySelected: onDaySelected,
          ),
          SizedBox(height: 8.0), // -- margin 역할
          TodayBanner(selectedDay: DateTime.now(), scheduleCount: 3),
          SizedBox(height: 8.0),
          _ScheduleList()
        ],
      ),
    ));
  }

  FloatingActionButton renderFloatingActionButton(){ // -- 플로팅 버튼을 반환하는 함수
    return FloatingActionButton(onPressed: (){ // -- 클릭 시 bottom sheet 반환
      showModalBottomSheet(context: context, isScrollControlled: true, builder: (_){
        return ScheduleBottomSheet(); // -- isScrollControlled로 최대 bottomsheet 높이 리셋
      });
    },backgroundColor: PRIMARY_COLOR,
    child: Icon(Icons.add));
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // -- 특정 날짜 누를 떄 실행
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          // -- 리스트를 보여줄 수 있는 위젯 ListView
          // -- safearea를 벗어나지 않고도 5개 넘치면 scroll 할 수 있음
          // -- 자동 Infinite scroll 구현하여 리소스 상 유리함!
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              // -- 아이템 5개 반복문
              return ScheduleCard(
                startTime: 8,
                endTime: 11,
                content: '밥먹기 ${index}',
                color: Colors.red,
              );
            },
          )),
    );
  }
}
