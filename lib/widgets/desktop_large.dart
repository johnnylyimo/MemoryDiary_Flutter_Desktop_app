import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DesktopLargeView extends StatefulWidget {
  const DesktopLargeView({Key? key}) : super(key: key);

  @override
  State<DesktopLargeView> createState() => _DesktopLargeViewState();
}

class _DesktopLargeViewState extends State<DesktopLargeView> {
  var memoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Box? box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('memoryBox');
  }

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
                        child: const Text('Save'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            box!.add(memoryController.text);
                            debugPrint('DEBUG > ${box!.toMap()}');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'New memory " ${memoryController.text.substring(0, memoryController.text.length)} " Saved!',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                            memoryController.clear();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Remember the good times',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
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
                  Text(
                    'Highlights',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
