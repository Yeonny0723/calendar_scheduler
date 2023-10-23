import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay; // -- 선택 날짜 상태 관리

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle( // -- 헤더 스타일링
        formatButtonVisible: false, // -- 디폴트 버튼 숨기기
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0
        )
      ),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay){ // -- 특정 날짜 누를 떄 실행
        setState(() {
          this.selectedDay = selectedDay;
        });
      },
      selectedDayPredicate: (DateTime date){ // -- 화면 내 모든 날짜에 실행하는 함수
        if (selectedDay == null){
          return false;
        }
        return date.year == selectedDay!.year && date.month == selectedDay!.month && date.day == selectedDay!.day;
      },
    );
  }
}
