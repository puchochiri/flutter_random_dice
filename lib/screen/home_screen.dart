import 'package:flutter_random_dice/const/colors.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  final int number; //변수 선언
  const HomeScreen({
    Key? key,
    required this.number
  }) : super(key:key);
  // 홈스크린 parameter는 위와 같다


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 주샤위 이미지
        Center(
          child: Image.asset('asset/img/$number.png'),
        ),
        SizedBox(height: 32.0),
        Text(
          '행운의 숫자',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          number.toString(),
          style: TextStyle(
            color: primaryColor,
            fontSize: 60.0,
            fontWeight: FontWeight.w200,
          ),
        )
      ],
    );
  }
}