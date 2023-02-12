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
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
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
              for (var n in numbers) Text('$n'),
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
