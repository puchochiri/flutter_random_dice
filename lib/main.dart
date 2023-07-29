import 'package:flutter_random_dice/const/colors.dart';
import 'package:flutter_random_dice/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_random_dice/screen/root_screen.dart';


void main() {
  runApp(
    MaterialApp(
      //상세 css 할당 부분
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData( // Slider 위젯 관련 테마
          thumbColor: primaryColor,         // 노브 색상
          activeTrackColor: primaryColor,   // 노브가 이동한 트랙 색상
          
          // 노브가 아직 이동하지 않은 트랙 색상
          inactiveTrackColor:  primaryColor.withOpacity(0.3),
          
      ),
        // BottomNavigationBarTheme: 위젯 관련 테마
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,  //선택 상태 색
          unselectedItemColor: secondaryColor, // ,비선택 상태 색
          backgroundColor:  backgroundColor,    // 배경색
        ),
      
    ),
      home: RootScreen(), // 최상위 부모 div
    ),
  );
}
