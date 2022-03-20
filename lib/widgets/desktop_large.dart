import 'package:flutter/material.dart';

class DesktopLargeView extends StatefulWidget {
  const DesktopLargeView({Key? key}) : super(key: key);

  @override
  State<DesktopLargeView> createState() => _DesktopLargeViewState();
}

class _DesktopLargeViewState extends State<DesktopLargeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.purple.shade200,
            ),
            child: Column(
              children: [
                RichText(
                  text: const TextSpan(text: 'WORD OF THE DAY\n'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [Text()],
            ),
          )
        ],
      ),
    );
  }
}
