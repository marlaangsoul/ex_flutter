import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
  // 모든 화면과 버튼 등의 모든 것들이 APP Widget으로 부터 생성 된다.
  // 우리앱의 root widget이 App이 되는 것이다.
  // root는 어떤 결정을 해야한다.
  // Meterial 디자인과 Ios의 Cupertino 디자인.
}

class App extends StatelessWidget {
  @override // 상속 받는 것, StatelessWidget의 build 속 성관련 상속
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 10,
          title: Text('Hello flutter'),
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
    // 구글 바탕 : flutter가 구글 것이기 때문에 더 다양한 위젯과 조합이 있다.
    //return CupertinoApp(); // 애플 바탕
    // 둘 중 하나를 반드시 선택해줘야 한다.

    // MaterialApp 은 클래스 형태.
    // 여기서 클래스에 많은 멤버가 있는데 여기서 우선 봐야 할것은 homm이다.

    // (Hello world!)가 안보일때. 화면은 scaffold 라는 것을 반드시 가져야한다.
    // 스카폴드는 하나의 구조. 상단, 중앙, 하단버튼 등등
  }
}
