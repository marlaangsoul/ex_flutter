import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
        // Navigator.push(context, route);
        // route 를 푸쉬할수 있다.
        // route는 DetailScreen 과 같은 StatelessWidget을 애니메이션 효과로 감싸서 스크린 처럼 보이도록 한다.
      },
      // onTapDown 은 손가락을 내린것, onTapUp은 손가락을 올린것. onTAP은 두가지가동시에 일어난 클릭.
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              //꾸미고 싶을때는 Container
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ]),
              // 여기에 Radius가 바로 적용 되지 않는다.
              clipBehavior: Clip.hardEdge,
              // 이때 clipBehavior를 사용해야한다.
              // clipBehavior으로 자식의 부모 영역 침범을 제어하는 방법이다.
              width: 300,
              child: Image.network(thumb),
            ),
          ),
          const SizedBox(
            // 단순히 간격 넓힐 때는 SizedBox
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
