// import 'package:flutter/material.dart';
// import 'package:toonflix/models/webtoon_model.dart';
// import 'package:toonflix/services/api_service.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<WebtoonModel> webtoons = [];
//   bool isLoading = true;

//   void waitForWebToons() async {
//     webtoons = await ApiService.getTodaysToons();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     waitForWebToons();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(webtoons);
//     print(isLoading);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 4,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.green,
//         title: const Text(
//           "오늘의 웹툰",
//           style: TextStyle(
//             fontSize: 26,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     ); // screen을 위한 기본적인 레이아웃과 설정을 제공해준다.
//   }
// }
