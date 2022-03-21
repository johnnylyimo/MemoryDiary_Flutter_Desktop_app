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
              borderRadius: BorderRadius.circular(30),
              color: Colors.purple.shade200,
            ),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: 'WORD OF THE DAY\n',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: 'Today will be better than yesterday'),
                      ]),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Anytime something positive happens, make a note of it and come back to it later.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
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
