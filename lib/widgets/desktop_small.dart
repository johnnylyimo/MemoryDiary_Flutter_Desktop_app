import 'package:flutter/material.dart';

class DesktopSmallView extends StatefulWidget {
  const DesktopSmallView({Key? key}) : super(key: key);

  @override
  State<DesktopSmallView> createState() => _DesktopSmallViewState();
}

class _DesktopSmallViewState extends State<DesktopSmallView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'WORD OF THE DAY\n',
            ),
          ),
        ],
      ),
    );
  }
}
