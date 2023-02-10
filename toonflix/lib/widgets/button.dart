import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

// 변수를 생성하거나 우리 버튼이 이러한 프로퍼티들을 가지고 설정하기 전에
// 우리는 생성자 함수를 만들어야 한다.

// 이렇게 생성자 함수를 만들어줘야한다.
//   const Button({
//     super.key,
//     required this.text,
//     required this.bgColor,
//     required this.textColor,
//   });
// 여기서 느껴지는 것은, 대부분의 과정이 반복적이라는 것이다.

// 전구 버튼으로도 할수 있다.
  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text, // 처음에 text가 에러가 떳던 이유는,
          //Padding이 const로 되어 있기 때문
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
