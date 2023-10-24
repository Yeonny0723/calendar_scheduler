import 'package:calendar_scheduler/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(
          color: PRIMARY_COLOR,
          fontWeight: FontWeight.w600,
        ),),
        TextField(
          cursorColor: Colors.grey, // -- 커서 색상 변경
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true, // -- 색깔 넣어주기
            fillColor: Colors.grey[300]
          ),
        ),
      ],
    );
  }
}
