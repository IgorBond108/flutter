import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInsert extends StatefulWidget {
  const ImageInsert({super.key});

  @override
  State<ImageInsert> createState() => _ImageInsertState();
}

class _ImageInsertState extends State<ImageInsert> {
  @override
  File? _selectedImage;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.add_a_photo),
              onPressed: () {
                _pickImageFromGallery();
              },
            ),
            _selectedImage != null ? Image.file(_selectedImage!) : const Text('Пожалуйста выберите изображение '),
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
