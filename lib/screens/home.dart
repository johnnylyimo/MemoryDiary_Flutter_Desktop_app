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
              const PopupMenuDivider(height: 10),
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
                case 1:
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.4,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Scrollbar(
                                thumbVisibility: true,
                                thickness: 10.0,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      text: 'Welcome to MemoryDiary Help\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "MemoryDiary is the Desktop app developed by Flutter Framework. It is good work done by senior developer John L. Lyimo from MolysTechie.\n\n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "How to use MemoryDiary App\n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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
