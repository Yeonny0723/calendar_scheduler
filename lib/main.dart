import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // -- runApp이 실행되기 전 다음 코드 실행 강제
  await initializeDateFormatting(); // -- intl 패키지 초기화

  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'NotoSans'
    ),
    home: HomeScreen(),
  ));
}
