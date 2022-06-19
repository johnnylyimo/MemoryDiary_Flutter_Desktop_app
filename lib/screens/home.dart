import 'package:flutter/material.dart';
import 'package:memory_diary/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// color: Color(0xffF4BEEE),
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffECA3F5),
        centerTitle: true,
        title: const Text('Memory Diary'),
        actions: [
          PopupMenuButton<int>(
            offset: const Offset(0, 60),
            icon: const Icon(
              Icons.question_mark,
              color: Colors.white,
            ),
            color: Colors.purple.shade100,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Help',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'About MemoryDiary',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
              }
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            return const DesktopLargeView();
          } else {
            return const DesktopSmallView();
          }
        },
      ),
    );
  }
}
