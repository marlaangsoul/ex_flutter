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
  bool showTitle = true;
  // This widget is the root of your application.

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  void initState() {
    // 자주 사용하지는 않지만, 종종 부모요소에 의존하는 데이터를 초기화 할때 사용
    super.initState();
    print('initState!');
  }

  @override
  void dispose() {
    // API업데이트나 이벤트 리스너로부터 구독을 취소하거나
    // form의 리스너로부터 벗어나고 싶을때 사용할수 있음. 무언가를 취소하는 곳.
    // ㅊ
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print('build!!');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 40,
        color: Theme.of(context).textTheme.titleLarge!.color,
        //context에 있는 테마의 색을 가져옴.
        // !는 반드시 존재한다는 것을 의미.
        // ?는 아마도 존재할거야 라고 말하는 것.
      ),
    );
  }
}
