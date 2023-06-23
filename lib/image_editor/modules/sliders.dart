import 'package:flutter/material.dart';

import '../image_editor_pro.dart';
import 'colors_picker.dart';

class Sliders extends StatefulWidget {
  final int index;
  final Map mapValue;

  const Sliders({super.key, required this.mapValue, required this.index});

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  @override
  void initState() {
    //  slider = widget.sizevalue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Size Adjust'.toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Divider(),
          Slider(
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            value: widgetJson[widget.index]['size'],
            min: 0.0,
            max: 100.0,
            onChangeEnd: (v) {
              setState(() {
                widgetJson[widget.index]['size'] = v.toDouble();
              });
            },
            onChanged: (v) {
              setState(() {
                slider = v;
                // print(v.toDouble());
                widgetJson[widget.index]['size'] = v.toDouble();
              });
            },
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
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
                              widgetJson[widget.index]['color'] = Color(value);
                            });
                          },
                        ),
                      ),
                      TextButton(onPressed: () {}, child: const Text('Reset')),
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
                            widgetJson[widget.index]['color'] = Color(value);
                          });
                        },
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('Reset')),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(
                child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                widgetJson.removeAt(widget.index);
                Navigator.pop(context);
              },
              child: const Text('Remove'),
            ))
          ]),
        ],
      ),
    );
  }
}
