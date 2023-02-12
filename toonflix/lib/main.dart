import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

// 파란 줄이 생기는 이유.
// const testAmount = 15;
// const priceAmount = 30;
// var finalPrice = testAmount + priceAmount;
// 다트 프로그램은 컴파일 전 미리 알고 있는 변수는 처음부터 최적화 시켜서 계산한다.
// 예를 들면 위의 마지막 fincalPrice의 식을 15 + 30 으로 생각하고 시작한다.
// 그래서 openUserSetting.json에서 한가지를 수정해준다.
// const를 일괄 설정 하는 방법.
// vsCode settings.json 에서
// "editor.codeActionsOnSave": {
//         "source.fixAll": true
//     }
// }, 이거를 붙이면 된다.

class Player {
  String name; // = 'bh'; 기본값 형태는 자주 사용 되지 않는다.
  //String? name;
  //Player(this.name);

  Player(
      {required this.name}); // this 는 Player라는 클래스가 파라메터를 받을 때 this에 넣는 다는 의미.
}

void main() {
  var bh = Player(name: "bh");

  runApp(const App()); // 다트는 클래스를 만들때마다 new를 써줄 필요가 없다. (new를 쓰나 안쓰나 똑같다. )
  // 모든 화면과 버튼 등의 모든 것들이 APP Widget으로 부터 생성 된다.
  // 우리앱의 root widget이 App이 되는 것이다.
  // root는 어떤 결정을 해야한다.
  // Meterial 디자인과 Ios의 Cupertino 디자인.
}

class App extends StatelessWidget {
  const App({super.key});

  // StatelessWidget 화면에 위젯을 띄우는 것  말고는 큰 의미는 없음.
  @override // 상속 받는 것, StatelessWidget의 build 속 성관련 상속
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          // 앱을 스크롤 할수 있게 해준다.
          child: Padding(
            // padding: EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  // 간격을 주기 위해서 사용. (Size가 있는 박스를 만들어 줄뿐. )
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // 우측 정렬
                  // Column의 MainAxis는 가로 방향이고, Row의 MainAxis는 세로 방향이다.
                  // Row의 CrossAxis는 세로 방향이고, Column의 CrossAxis는 가로 방향.
                  children: [
                    Column(
                      // 서로 위 아래로 배치하려면 Column, 서로 좌우로 배치하려면 Row
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Bo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$5 194 482', // $는 변수 표현. 이럴때는 \를 앞에 붙이면 된다.
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 44,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Requst',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end, // View를 하단에 위치
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  order: 0,
                ),
                const CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '2 238',
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  order: 1,
                ),
                const CurrencyCard(
                  name: 'Won',
                  code: 'won',
                  amount: '40 334',
                  icon: Icons.work_rounded,
                  isInverted: false,
                  order: 2,
                ),
                const CurrencyCard(
                  name: 'owi',
                  code: 'sod',
                  amount: '3 121',
                  icon: Icons.keyboard_hide_sharp,
                  isInverted: true,
                  order: 4,
                ),
                const CurrencyCard(
                  name: 'aas',
                  code: 'aos',
                  amount: '32 11',
                  icon: Icons.zoom_in_map_outlined,
                  isInverted: false,
                  order: 5,
                ),
              ],
            ),
          ),
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
