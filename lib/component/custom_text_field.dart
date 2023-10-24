import 'package:calendar_scheduler/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;

  const CustomTextField({required this.label, required this.isTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (isTime) renderTextField(),
        if (!isTime)
          Expanded(
              child:
                  renderTextField()) // -- isTime (시간관련) 필드가 아닌 경우 (content)에만 전체 높이 expanded
      ],
    );
  }

  Widget renderTextField() {
    return TextField(
      cursorColor: Colors.grey, // -- 커서 색상 변경
      expands: !isTime,
      maxLines: isTime ? 1 : null, // -- null인 경우 자동 무한 줄바꿈
      keyboardType: isTime
          ? TextInputType.number
          : TextInputType.multiline, // -- 개행 문자 입력 가능
      inputFormatters: isTime
          ? [
              // -- 입력 텍스트 숫자로 제한
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true, // -- 색깔 넣어주기
          fillColor: Colors.grey[300]),
    );
  }
}
