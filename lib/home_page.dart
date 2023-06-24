import 'dart:io';

import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_edit/stylish_button.dart';

import 'image_editor/image_editor_pro.dart';

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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/main.png",
                  width: double.infinity,
                  opacity: const AlwaysStoppedAnimation(.55),
                ),
              ),
              const Spacer(),
              Text(
                "Create your moments with",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Text(
                "beauty",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF2E71FE),
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const SizedBox(height: 24),
              StylishButton(
                onPressed: () {
                  takePhoto();
                },
                text: "Take a Photo",
                icon: IconsaxOutline.camera,
              ),
              const SizedBox(height: 6),
              StylishButton(
                onPressed: () {
                  openGallery();
                },
                text: "Add from Gallery",
                icon: IconsaxOutline.gallery,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
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

  Future<void> getimageditor(File image) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ImageEditorPro(
              appBarColor: Colors.black87,
              bottomBarColor: Colors.black87,
              pathSave: null,
              defaultImage: image,
            );
          },
        ),
      ).then((geteditimage) {
        // save file to gallery
        if (geteditimage != null) {
          saveToGallery(geteditimage as File);
        }
      }).catchError(
        (er) {
          print(er);
        },
      );

  void saveToGallery(File file) async {
    await ImageGallerySaver.saveImage(
      file.readAsBytesSync(),
      quality: 100,
    );
  }

  void takePhoto() async {
    final XFile? cameraImage =
        await picker.pickImage(source: ImageSource.camera);

    if (cameraImage != null) {
      getimageditor(File(cameraImage.path));
    }
  }
}
