import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors_picker.dart';

class TextEditorImage extends StatefulWidget {
  const TextEditorImage({super.key});

  @override
  _TextEditorImageState createState() => _TextEditorImageState();
}

class _TextEditorImageState extends State<TextEditorImage> {
  TextEditingController name = TextEditingController();
  Color currentColor = Colors.black;
  double slider = 12.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.2,
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Insert Your Message',
                  hintStyle: TextStyle(color: Colors.white),
                  alignLabelWithHint: true,
                ),
                scrollPadding: const EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: 99999,
                style: const TextStyle(
                  color: Colors.white,
                ),
                autofocus: true,
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Slider Color'),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BarColorPicker(
                              width: 300,
                              thumbColor: Colors.white,
                              cornerRadius: 10,
                              pickMode: PickMode.Color,
                              colorListener: (int value) {
                                setState(() {
                                  currentColor = Color(value);
                                });
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                currentColor = Colors.black;
                              });
                            },
                            child: const Text('Reset'),
                          )
                        ]),
                    const Text('Slider White Black Color'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BarColorPicker(
                            width: 300,
                            thumbColor: Colors.white,
                            cornerRadius: 10,
                            pickMode: PickMode.Grey,
                            colorListener: (int value) {
                              setState(() {
                                currentColor = Color(value);
                              });
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              currentColor = Colors.black;
                            });
                          },
                          child: const Text('Reset'),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Size Adjust'.toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                              value: slider,
                              min: 0.0,
                              max: 100.0,
                              onChangeEnd: (v) {
                                setState(() {
                                  slider = v;
                                });
                              },
                              onChanged: (v) {
                                setState(() {
                                  slider = v;
                                });
                              }),
                        ],
                      ),
                    )
                  ]),
            ),
          ]),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          align == TextAlign.left
              ? ListTile(
                  title: const Icon(
                    FontAwesomeIcons.alignLeft,
                    color: Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      align = null;
                    });
                  })
              : IconButton(
                  onPressed: () {
                    setState(() {
                      align = TextAlign.left;
                    });
                  },
                  icon: const Icon(FontAwesomeIcons.alignLeft),
                  color: Colors.white,
                ),
          align == TextAlign.center
              ? ListTile(
                  title: const Icon(
                    FontAwesomeIcons.alignCenter,
                    color: Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      align = null;
                    });
                  })
              : IconButton(
                  onPressed: () {
                    setState(() {
                      align = TextAlign.center;
                    });
                  },
                  icon: const Icon(FontAwesomeIcons.alignCenter),
                  color: Colors.white,
                ),
          align == TextAlign.right
              ? ListTile(
                  title: const Icon(
                    FontAwesomeIcons.alignRight,
                    color: Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      align = null;
                    });
                  })
              : IconButton(
                  onPressed: () {
                    setState(() {
                      align = TextAlign.right;
                    });
                  },
                  icon: const Icon(FontAwesomeIcons.alignRight),
                  color: Colors.white,
                )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TextButton(
          onPressed: () {
            Navigator.pop(context, {
              'name': name.text,
              'color': currentColor,
              'size': slider.toDouble(),
              'align': align
            });
          },
          child: const Text(
            'Add Text',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }

  TextAlign? align;
}
