import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;

  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(
        () {
          totalPomodoros += 1;
          isRunning = false;
          totalSeconds = twentyFiveMinutes;
        },
      );
      timer.cancel();
    } else {
      setState(
        () {
          totalSeconds -= 1;
        },
      );
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
      // totalSeconds = twentyFiveMinutes;
    }); // onTick 옆에 괄호를 넣지 않는다.
    // 괄호를 넣으면 바로 실행 되는 것을 의미하기 때문.
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var resault = duration.toString().split('.').first.substring(2, 7);
    return resault;
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStop() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    color: Theme.of(context).cardColor,
                    iconSize: 150,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                ),
                isRunning
                    ? Center(
                        child: IconButton(
                          color: Theme.of(context).cardColor,
                          iconSize: 150,
                          onPressed: onStop,
                          icon: const Icon(Icons.stop),
                        ),
                      )
                    : const Center(),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
