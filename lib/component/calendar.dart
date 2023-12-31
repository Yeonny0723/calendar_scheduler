import 'package:calendar_scheduler/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget{
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const Calendar({required this.selectedDay, required this.focusedDay, required this.onDaySelected, super.key});

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco =  BoxDecoration( // -- 반복해서 사용하는 캘린더 날짜 박스 스타일
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.grey[200],
        );
    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700
    );

    return TableCalendar(
      locale: 'ko_KR', // -- 한국어 번역
      focusedDay: focusedDay, // -- 외부 statefulwidget에서 값 받아오기
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
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: defaultBoxDeco, // -- 디폴트 날짜
        weekendDecoration: defaultBoxDeco, // -- 주말 날짜
        selectedDecoration: BoxDecoration( // -- 선택 날짜
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0,
          )
        ),
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: PRIMARY_COLOR,
        ), // -- destructuring
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date){ // -- 화면 내 모든 날짜에 실행하는 함수
        if (selectedDay == null){
          return false;
        }
        return date.year == selectedDay!.year && date.month == selectedDay!.month && date.day == selectedDay!.day;
      },
    );
  }
}
