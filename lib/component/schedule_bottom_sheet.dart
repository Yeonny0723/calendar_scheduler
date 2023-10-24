import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom; // -- viewInsets: 키보드로 인해 가려진 높이 가져오기
    return Container(
      height: MediaQuery.of(context).size.height / 2 + bottomInset, // -- 전체 화면 높이 + 키보드 높이
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Column(
          children: [
            TextField()
          ],
        ),
      ),
    );
  }
}
