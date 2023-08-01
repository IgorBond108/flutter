import 'dart:io';
// import 'dart:typed_data';

import 'package:app_to_company_uk/Screens/ThirdScreenInfoCompany.dart';
// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:share_plus/share_plus.dart';

class InfoAboutZakaz extends StatefulWidget {
  const InfoAboutZakaz({super.key, required this.title});
  final String title;
  @override
  State<InfoAboutZakaz> createState() => _InfoAboutZakazState();
}

shareButton(String title, Function()? onPressed) {
  return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ));
}

class _InfoAboutZakazState extends State<InfoAboutZakaz> {
  File? _selectedImage1;
  File? _selectedImage2;
  File? _selectedImage3;
  File? _selectedImage4;
  File? _selectedImage5;
  File? _selectedImage6;
  File? _selectedImage7;

  File? _selectedImagereturnedImageFromCamera1;
  File? _selectedImagereturnedImageFromCamera2;
  File? _selectedImagereturnedImageFromCamera3;
  File? _selectedImagereturnedImageFromCamera4;
  File? _selectedImagereturnedImageFromCamera5;
  File? _selectedImagereturnedImageFromCamera6;
  File? _selectedImagereturnedImageFromCamera7;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uk', 'UK'),
      ],
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdScreen()));
                },
                icon: const Icon(Icons.home_outlined))
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('CUSTOMS LOGISTICS'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              S.load(const Locale('ru', 'RU'));
                            });
                          },
                          child: const Text('RU'),
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              S.load(const Locale('uk', 'UK'));
                            });
                          },
                          child: const Text('UA'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(child: Text(S.of(context).indata)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: (S.of(context).tamozhnya),
                      hintText: "",
                      filled: true,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: (S.of(context).marshrut),
                      hintText: "",
                      filled: true,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: (S.of(context).tel_fio),
                      hintText: S.of(context).ivan_primer,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: (S.of(context).photo_text),
                      hintText: S.of(context).no_data,
                      filled: true,
                    ),
                  ),
                  Text(
                    S.of(context).declaration,
                    style: const TextStyle(fontSize: 13),
                  ),
                  _selectedImage1 != null
                      ? Image.file(_selectedImage1!)
                      : Text(S.of(context).pvi),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareButton(S.of(context).zagsgal, () async {
                        _pickImageFromGallery1();
                      }),
                      shareButton(S.of(context).zagscam, () async {
                        _pickImageFromCamera1();
                      }),
                    ],
                  ),

                  // final imagePicker = await ImagePicker()
                  //     .pickImage(source: ImageSource.gallery);
                  // if (imagePicker != null) {
                  //   Uint8List unit8List = await imagePicker.readAsBytes();
                  //   Share.shareXFiles([
                  //     XFile.fromData(
                  //       unit8List,
                  //       name: 'Image Gallery',
                  //       mimeType: 'image/png',
                  //     ),
                  //   ], subject: 'Image Gallery');
                  // }

                  const SizedBox(
                    height: 20,
                  ),
                  // button 2
                  _selectedImage2 != null
                      ? Image.file(_selectedImage2!)
                      : Text(S.of(context).pvi),
                  Text(S.of(context).cmr),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareButton(S.of(context).zagsgal, () async {
                        _pickImageFromGallery2();
                      }),
                      shareButton(S.of(context).zagscam, () async {
                        _pickImageFromCamera2();
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectedImage3 != null
                      ? Image.file(_selectedImage3!)
                      : Text(S.of(context).pvi),
                  Text(S.of(context).invois),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareButton(S.of(context).zagsgal, () async {
                        _pickImageFromGallery3();
                      }),
                      shareButton(S.of(context).zagscam, () async {
                        _pickImageFromCamera3();
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectedImage4 != null
                      ? Image.file(_selectedImage4!)
                      : Text(S.of(context).pvi),
                  Text(S.of(context).pas_vod),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareButton(S.of(context).zagsgal, () async {
                        _pickImageFromGallery4();
                      }),
                      shareButton(S.of(context).zagscam, () async {
                        _pickImageFromCamera4();
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectedImage5 != null
                      ? Image.file(_selectedImage5!)
                      : Text(S.of(context).pvi),
                  Text(S.of(context).tehpasport),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareButton(S.of(context).zagsgal, () async {
                        _pickImageFromGallery5();
                      }),
                      shareButton(S.of(context).zagscam, () async {
                        _pickImageFromCamera5();
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectedImage6 != null
                      ? Image.file(_selectedImage6!)
                      : Text(S.of(context).pvi),
                  Text(S.of(context).pas_pric),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareButton(S.of(context).zagsgal, () async {
                        _pickImageFromGallery6();
                      }),
                      shareButton(S.of(context).zagscam, () async {
                        _pickImageFromCamera6();
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectedImage7 != null
                      ? Image.file(_selectedImage7!)
                      : Text(S.of(context).pvi),
                  Text(
                    S.of(context).dopolnitelno,
                    style: const TextStyle(fontSize: 13),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareButton(S.of(context).zagsgal, () async {
                        _pickImageFromGallery7();
                      }),
                      shareButton(S.of(context).zagscam, () async {
                        _pickImageFromCamera7();
                      }),
                    ],
                  ),
                   TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: (S.of(context).kommentariy),
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: Text(S.of(context).otpravitButton),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery1() async {
    final returnedImage1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage1 == null) return;
    setState(() {
      _selectedImage1 = File(returnedImage1.path);
    });
  }

  Future _pickImageFromGallery2() async {
    final returnedImage2 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage2 == null) return;
    setState(() {
      _selectedImage2 = File(returnedImage2.path);
    });
  }

  Future _pickImageFromGallery3() async {
    final returnedImage3 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage3 == null) return;
    setState(() {
      _selectedImage3 = File(returnedImage3.path);
    });
  }

  Future _pickImageFromGallery4() async {
    final returnedImage4 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage4 == null) return;
    setState(() {
      _selectedImage4 = File(returnedImage4.path);
    });
  }

  Future _pickImageFromGallery5() async {
    final returnedImage5 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage5 == null) return;
    setState(() {
      _selectedImage5 = File(returnedImage5.path);
    });
  }

  Future _pickImageFromGallery6() async {
    final returnedImage6 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage6 == null) return;
    setState(() {
      _selectedImage6 = File(returnedImage6.path);
    });
  }

  Future _pickImageFromGallery7() async {
    final returnedImage7 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage7 == null) return;
    setState(() {
      _selectedImage7 = File(returnedImage7.path);
    });
  }

  Future _pickImageFromCamera1() async {
    final returnedImageFromCamera1 =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImageFromCamera1 == null) return;
    setState(() {
      _selectedImagereturnedImageFromCamera1 =
          File(returnedImageFromCamera1.path);
    });
  }

  Future _pickImageFromCamera2() async {
    final returnedImageFromCamera2 =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImageFromCamera2 == null) return;
    setState(() {
      _selectedImagereturnedImageFromCamera2 =
          File(returnedImageFromCamera2.path);
    });
  }

  Future _pickImageFromCamera3() async {
    final returnedImageFromCamera3 =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImageFromCamera3 == null) return;
    setState(() {
      _selectedImagereturnedImageFromCamera3 =
          File(returnedImageFromCamera3.path);
    });
  }

  Future _pickImageFromCamera4() async {
    final returnedImageFromCamera4 =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImageFromCamera4 == null) return;
    setState(() {
      _selectedImagereturnedImageFromCamera4 =
          File(returnedImageFromCamera4.path);
    });
  }

  Future _pickImageFromCamera5() async {
    final returnedImageFromCamera5 =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImageFromCamera5 == null) return;
    setState(() {
      _selectedImagereturnedImageFromCamera5 =
          File(returnedImageFromCamera5.path);
    });
  }

  Future _pickImageFromCamera6() async {
    final returnedImageFromCamera6 =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImageFromCamera6 == null) return;
    setState(() {
      _selectedImagereturnedImageFromCamera6 =
          File(returnedImageFromCamera6.path);
    });
  }

  Future _pickImageFromCamera7() async {
    final returnedImageFromCamera7 =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImageFromCamera7 == null) return;
    setState(() {
      _selectedImagereturnedImageFromCamera7 =
          File(returnedImageFromCamera7.path);
    });
  }

  shareButton(String title, Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
