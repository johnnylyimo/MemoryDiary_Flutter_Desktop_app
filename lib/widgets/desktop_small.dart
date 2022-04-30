import 'package:flutter/material.dart';

class DesktopSmallView extends StatefulWidget {
  const DesktopSmallView({Key? key}) : super(key: key);

  @override
  State<DesktopSmallView> createState() => _DesktopSmallViewState();
}

class _DesktopSmallViewState extends State<DesktopSmallView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
