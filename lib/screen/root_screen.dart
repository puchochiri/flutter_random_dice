import 'package:flutter/material.dart';
import 'package:flutter_random_dice/screen/home_screen.dart';
import 'package:flutter_random_dice/screen/settings_screen.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  // 생성자
  const RootScreen({Key? key}) : super(key: key);

  // statefulwidget 함수를 오버라이드 받음
  // createState라는 statefulwidget 객체를 생성
  // RootScreen 실행시, _RootScreenSate()를 실행
  @override
  State<RootScreen> createState() => _RootScreenState();


}

//객체 _RootScreenState 정의
class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin{
  // 사용할 controller 선언
  TabController? tabcontroller;
  double threshold = 2.7;
  int number = 1; //주사위 숫자
  ShakeDetector? shakeDetector;
  
  //초기화 객체 선언
  //_RootScreenState 실행시 initState 실행으로 초기화 먼저 진행
  @override
  void initState() {
     super.initState();

     tabcontroller = TabController(length: 2, vsync: this); //컨트롤러 초기화하기

     // 컨트롤러 속성이 변경될 때마다 실행할 함수 등록 action listen
     tabcontroller!.addListener(tabListener);
     shakeDetector = ShakeDetector.autoStart( //흔들기 감지 즉시 시작
        shakeSlopTimeMS: 100, //감지 주기
        shakeThresholdGravity: threshold, // 감지 민감도
        onPhoneShake: onPhoneShake, // 감지 후 실행할 함수
     );
    
  }
  void onPhoneShake() { // 감지 후 실행할 함수
    final rand = new Random();

    setState(() {
      number = rand.nextInt(5) + 1;
    });

  }

  tabListener() {
    setState(() {

    });
  }

  @override
  void dispose() { // 리스너에 들록한(set) 함수 등록 취소
    tabcontroller!.removeListener(tabListener);
    shakeDetector!.stopListening(); //흔들기 감지 중지
    super.dispose();
  }

  BottomNavigationBar renderBottomNavigation(){

    //탭 내비게이션을 구현하는 script 함수 위젯
    return BottomNavigationBar(
      // 현재 화면에 렌더링되는 탭의 인덱스
      currentIndex: tabcontroller!.index,
      onTap: (int index) {
        print( index);
        setState((){
          tabcontroller!.animateTo(index);
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.edgesensor_high_outlined,
            ),
            label: '주사위'
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: '설정',
        ),
      ],
    );
  }

  // statefulwidget의 객체 실행
  // text가 있는 or value가 있는 <div> 느낌 --> 화면에서 말단손자부분
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabcontroller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );

  } // TickerProviderStateMixin 사용

  // widget script함수
  List<Widget> renderChildren(){
    return [
      HomeScreen(number: number),
      SettingsScreen(
          threshold: threshold,
          onThresholdChange: onThresholdChange
      ),
    ];
  }

  // onThresholdChange callback
  void onThresholdChange(double val){
    setState((){
      threshold = val;
    });
  }
  


}









