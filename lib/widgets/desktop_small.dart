import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  editDialog(String memory, int memoryKey) {
    editMemoryController.text = memory;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.purple.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(20.0),
            height: 220.0,
            child: Form(
              key: _editFormKey,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: editMemoryController,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.center,
                    validator: (String? val) =>
                        val!.isNotEmpty ? null : 'Enter Memory',
                    decoration: const InputDecoration(
                      labelText: 'Edit your Memory below',
                      prefixIcon: Icon(
                        Icons.notes,
                        color: Colors.purple,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text('Delete'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red,
                          ),
                        ),
                        onPressed: () {
                          box!.delete(memoryKey);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'The memory " ${editMemoryController.text.substring(0, editMemoryController.text.length)} " have already been deleted!',
                              textAlign: TextAlign.center,
                            ),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      ElevatedButton(
                        child: const Text('Save'),
                        onPressed: () {
                          if (_editFormKey.currentState!.validate()) {
                            box!.put(memoryKey, editMemoryController.text);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'The memory " ${editMemoryController.text.substring(0, editMemoryController.text.length)} " Edited Successfully!',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    box = Hive.box('memoryBox');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(screenWidth * .01),
                          primary: Colors.purple.shade500,
                          shape: const StadiumBorder(),
                          textStyle: TextStyle(
                            fontSize: max(16, screenWidth / 20),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            box!.add(memoryController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'New memory " ${memoryController.text.substring(0, memoryController.text.length)} " Saved!',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
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
                        textAlign: TextAlign.center,
                      ),
                      // Second  section
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 40.0,
            ),
          ),
          const Flexible(
            child: Text(
              'Highlights',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 4,
            child: ValueListenableBuilder(
                valueListenable: box!.listenable(),
                builder: (context, Box _box, _) {
                  return _box.length != 0
                      ? ListView.builder(
                          itemCount: _box.length,
                          itemBuilder: (context, index) {
                            var memories = _box.toMap();
                            return Card(
                              child: ListTile(
                                leading: const Icon(Icons.notes),
                                title: Text(
                                  memories.values.elementAt(index),
                                  maxLines: 2,
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => editDialog(
                                    memories.values.elementAt(index),
                                    memories.keys.elementAt(index),
                                  ),
                                ),
                                onTap: () => editDialog(
                                    memories.values.elementAt(index),
                                    memories.keys.elementAt(index)),
                              ),
                            );
                          })
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'No Memory\nAdd your memory above',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Flexible(
                              flex: 2,
                              child: Image(
                                width: screenWidth * 2 / 3,
                                height: screenHeight * 5,
                                fit: BoxFit.contain,
                                image: const AssetImage('images/cartoon.png'),
                              ),
                            ),
                          ],
                        );
                }),
          )
        ],
      ),
    );
  }
}
