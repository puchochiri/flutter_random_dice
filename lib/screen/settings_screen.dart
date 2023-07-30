import 'package:flutter/material.dart';
import 'package:flutter_random_dice/const/colors.dart';

class SettingsScreen extends StatelessWidget {
  // 현재 슬라이드 값
  final double threshold;
  // Slider가 변경될때마다 실행되는 함수
  final ValueChanged<double> onThresholdChange;

  const SettingsScreen({
    Key?key,
    required this.threshold,
    required this.onThresholdChange,
  }) : super(key: key);



  // 상속받은 div
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
                Text(
                  '민감도',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ),
        // div onchanged, options 준것
        Slider(
          min: 0.1,     //최솟값
          max: 10,      //최댓값
          divisions: 101, //최솟값과 최댓값 사이 구간 개수
          value: threshold, //  값 변경 시 실행되는 함수
          onChanged: onThresholdChange,   // 값 변경 시 실행되는 함수
          label: threshold.toStringAsFixed(1), // 표싯값
        ),
      ],
    );
  }
}

