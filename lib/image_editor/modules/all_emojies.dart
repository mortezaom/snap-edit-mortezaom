import 'package:flutter/material.dart';

import '../data/data.dart';

class Emojies extends StatefulWidget {
  const Emojies({super.key});

  @override
  _EmojiesState createState() => _EmojiesState();
}

class _EmojiesState extends State<Emojies> {
  List emojes = <dynamic>[];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey[400],
      child: Container(
        padding: const EdgeInsets.all(0.0),
        height: 400,
        color: Colors.white,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Select Emoji'),
              ],
            ),
            const Divider(
              height: 1,
            ),
            const SizedBox(height: 10),
            Container(
              height: 315,
              padding: const EdgeInsets.all(0.0),
              child: GridView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 0.0, maxCrossAxisExtent: 60.0),
                  children: emojis.map(
                    (String emoji) {
                      return GridTile(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                              {
                                'name': emoji,
                                'color': Colors.white,
                                'size': 12.0,
                                'align': TextAlign.center
                              },
                            );
                          },
                          child: Text(
                            emoji,
                            style: const TextStyle(fontSize: 35),
                          ),
                        ),
                      );
                    },
                  ).toList()),
            )
          ],
        ),
      ),
    );
  }

  List<String> emojis = [];
  @override
  void initState() {
    super.initState();
    emojis = getSmileys();
  }
}
