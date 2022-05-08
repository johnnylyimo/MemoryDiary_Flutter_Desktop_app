import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DesktopSmallView extends StatefulWidget {
  const DesktopSmallView({Key? key}) : super(key: key);

  @override
  State<DesktopSmallView> createState() => _DesktopSmallViewState();
}

class _DesktopSmallViewState extends State<DesktopSmallView> {
  var memoryController = TextEditingController();
  var editMemoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
  Box? box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('memoryBox');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.purple.shade200,
        ),
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
                children: [
                  TextSpan(text: 'Today will be better than yesterday'),
                ],
              ),
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
            const SizedBox(
              height: 20.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: memoryController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    validator: (String? val) =>
                        val!.isEmpty ? 'Enter memory' : null,
                    decoration: const InputDecoration(
                      labelText: 'Write new memory here',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                      prefixIcon: Icon(
                        Icons.notes,
                        color: Colors.purple,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.purple,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Save',
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
