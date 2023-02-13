import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // const는 컴파일 전 데이터 값을 알고 있는 것.
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        //Future를 만들고 그걸 FutureBuilder에 집어 넣기만 하면 된다.
        //FutureBuilder는 자기가 기다릴 Future와 Builder를 전달 받는다.
        //그리고 builder 함수는 context와 snapshot을 전달 받는다.
        // snapshot은 바로 Future의 상태이다.
        // 로딩 중인지, 데이터가 있는지, 에러가 났는지 등을 알 수 있다.
        future: webtoons,
        builder: (context, snapshot) {
          // builder가 context를 저 snapshot은
          if (snapshot.hasData) {
            // 첫번째 방법. 기본적인 방법.
            // return ListView(
            //   //자동적인 scrollView도 가지고 있다.
            //   // 단점으로는 모든 데이터를 한꺼번에 불러온다는 것.
            //   children: [
            //     for (var webtoon in snapshot.data!) Text(webtoon.title)
            //   ],
            // );
            // 두번째 방법. 더 최적화 된 방법.
            // return ListView.builder(
            //   scrollDirection: Axis.horizontal, // 스크롤 방향 반대.
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     //ListView빌더가 아이템을 빌드할때 호출하는 함수
            //     //index 순서로만 호출하고 호출 상태가 아닌 컨텐스트는 메모리에서 삭제한다.
            //     print(index);
            //     var webtoon = snapshot.data![index];
            //     return Text(webtoon.title);
            //   }, // 한번에 노출 되는 아이템의 갯수.
            // );
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
                // 화면에 남는 공간을 차지하는 위젯.
                // ListView는 공간을 무한히 차지하기 때문에 이렇게 공간을 설정해주는 것.
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    // 세번째 방법, 리스트 사이에 간격을 조정할수 있다.
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      // 박스에 위쪽과 왼쪽에 잘라진 부자연스러운 모양잉 있어서 패딩 설정.
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      // 수직 수평 둘다 넣을때는 symmetric
      itemBuilder: (context, index) {
        print(index);
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  } // screen을 위한 기본적인 레이아웃과 설정을 제공해준다.
}
