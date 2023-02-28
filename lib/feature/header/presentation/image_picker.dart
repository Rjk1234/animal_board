import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  static void displayPicker(
    BuildContext context, {
    required Function(File) onCompletion,
    required Function() onCancel,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImagePickerWidget(
          onCompletion: onCompletion,
          onCancel: onCancel,
        );
      },
    );
  }

  final Function(File) onCompletion;
  final Function() onCancel;
  const ImagePickerWidget({
    super.key,
    required this.onCompletion,
    required this.onCancel,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? image;
  bool hasImage = false;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Select Image from'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            // getImage(ImageSource.camera);
            Navigator.of(context).pop();
          },
          child: const Text('Camera'),
        ),
        SimpleDialogOption(
          onPressed: () {
            getImageFromDevice(ImageSource.gallery);
            Navigator.of(context).pop();
          },
          child: const Text('Gallery'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Future getImageFromDevice(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      widget.onCompletion(imageTemp);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}
