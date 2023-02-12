import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// 위젯 그체. 매우 적은양의 코드. state를 가지고 있을 뿐.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// State 그 자체. 우리가 작업하는 공간.
// State는 위젯의 데이터와 UI를 저장하고
class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    setState(() {
      // 변경된 데이터가 있다고 State 한테 알리는 함.
      counter += 1; // 데이터를 굳이 이 안에 넣지 않아도 된다. 하지만 setState(())는 반드시 필요하다.
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              IconButton(
                iconSize: 60,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
