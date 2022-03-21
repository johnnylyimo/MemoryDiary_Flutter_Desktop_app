import 'package:flutter/material.dart';

class DesktopLargeView extends StatefulWidget {
  const DesktopLargeView({Key? key}) : super(key: key);

  @override
  State<DesktopLargeView> createState() => _DesktopLargeViewState();
}

class _DesktopLargeViewState extends State<DesktopLargeView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: screenWidth * 0.4,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.purple.shade200,
            ),
            child: Column(
              children: [
                RichText(
                  text: const TextSpan(
                      text: 'WORD OF THE DAY\n',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              width: screenWidth * 0.6,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Text('Highlights'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
