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
      body: Container(
        margin: const EdgeInsets.all(20),
      ),
    );
  }
}
