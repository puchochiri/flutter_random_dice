import 'package:flutter/material.dart';

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
  // 사용할 TabController 선언
  TabController? tabcontroller;
  
  //초기화 객체 선언
  //_RootScreenState 실행시 initState 실행으로 초기화 먼저 진행
  @override
  void initState() {
     super.initState();

     tabcontroller = TabController(length: 2, vsync: this); //컨트롤러 초기화하기
    
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
  


}

  // widget script함수
  List<Widget> renderChildren(){
    return [
      Container(
        child: Center(
          child: Text(
            'Tab 1',
            style: TextStyle(
              color:  Colors.white,
            ),
          ),
        ),
      ),
      Container(
        child: Center(
          child: Text(
            'Tab 2',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),

      )

    ];
  }

  BottomNavigationBar renderBottomNavigation(){

    //탭 내비게이션을 구현하는 script 함수 위젯
    return BottomNavigationBar(
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


