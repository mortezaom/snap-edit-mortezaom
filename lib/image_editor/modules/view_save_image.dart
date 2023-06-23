import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final File file;

  const ImageView({super.key, required this.file});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(widget.file),
      ),
    );
  }
}
