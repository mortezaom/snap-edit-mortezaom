import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snap Edit"),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.webp",
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 16),
          const Text(
            "Select an Image or open camera",
          ),
          const SizedBox(height: 24),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: TextButton(
                  child: const Text(
                    "Open Camera",
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: TextButton(
                  child: const Text(
                    "Open Gallery",
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  openGallery() async {
    final XFile? galleryImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (galleryImage != null) {
      getimageditor(File(galleryImage.path));
    }
  }

  Future<void> getimageditor(File image) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ImageEditorPro(
          appBarColor: Colors.black87,
          bottomBarColor: Colors.black87,
          pathSave: null,
          defaultImage: image,
        );
      })).then((geteditimage) {}).catchError((er) {
        print(er);
      });
}
