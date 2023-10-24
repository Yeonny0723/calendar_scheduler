import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/constant/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // -- viewInsets: 키보드로 인해 가려진 높이 가져오기
    return GestureDetector(
      // -- bottomsheet 어디를 눌러도 닫히도록
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        // -- FocusNode(포커스할 대상): null 값이기에 키보드가 닫힘
      },
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 +
              bottomInset, // -- 전체 화면 높이 + 키보드 높이
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // -- column 디폴트 crossaxisalignment: center
                children: [
                  _Time(),
                  SizedBox(
                    height: 16.0,
                  ),
                  _Content(),
                  SizedBox(
                    height: 16.0,
                  ),
                  _ColorPicker(),
                  SizedBox(
                    height: 8.0,
                  ),
                  _SaveButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: CustomTextField(label: "내용", isTime: true));
  }
}

class _Time extends StatelessWidget {
  const _Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextField(label: "시작 시간", isTime: true)),
        SizedBox(
          width: 16.0,
        ),
        Expanded(child: CustomTextField(label: "마감 시간", isTime: false)),
      ],
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // -- Wrap: 자동 줄바꿈 위젯
      spacing: 8.0,
      runSpacing: 10.0,
      children: [
        renderColor(Colors.red),
        renderColor(Colors.orange),
        renderColor(Colors.yellow),
        renderColor(Colors.green),
        renderColor(Colors.blue),
        renderColor(Colors.indigo),
        renderColor(Colors.purple),
      ],
    );
  }

  Widget renderColor(Color color) {
    // -- 위젯 반환 함수 (함수형 컴포넌트 느낌)
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: 32.0,
      height: 32.0,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
                onPressed: () {},
                child: Text('저장'))),
      ],
    );
  }
}
