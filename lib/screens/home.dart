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
                                            text:
                                                "How to use MemoryDiary App\n",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    "Memory diary let user save his/her memorable events that happen everyday, by writing and save them in app and then later come back to view all his/her memories. \n\nFirst time when you open the app on left side you will see the rectangular box. The rectangular box is place you write you memorable event that you don't want to forget.\n\nAfter write your memorable event is time to save it, so later you can come back and view it. To save it at bottom of rectangular box there is button named Save, by click that button your memorable event is saved within the app. By saving it later you can come back and view it or edit it or delete if you want.\n\nEdit or Delete your Memorable event\nAfter saving your memorable event, soon when done it will be shown on right side panel under Highlights. From there by click that event or clicking edit icon on right side, your memorable event will open. \n\nWhen open it you will see Rectangular box and below it there two are buttons: Save and Delete button. There within rectangular box you can edit your memorable event then click Save button or you can delete it by clicking Delete button.\nDo you see?, it very easy to use MemoryDiary. Enjoy now!\n\n",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ]),
                                        TextSpan(
                                            text: 'Features\n',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    'This new version of MemoryDiary brings many new and exciting features. It greatly enhances the core values which made MemoryDiary so popular. Features like Less complexity, that is easy to use and got beautiful user interface(GUI).',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ])
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
