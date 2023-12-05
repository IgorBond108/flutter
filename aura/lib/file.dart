import 'dart:io';
import 'dart:collection';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(primaryColor: Colors.amber),
      home: AuraDiagnosisApp(),
    );
  }
}

class AuraDiagnosisApp extends StatefulWidget {
  @override
  _AuraDiagnosisAppState createState() => _AuraDiagnosisAppState();
}

class _AuraDiagnosisAppState extends State<AuraDiagnosisApp> {
  File? _image;
  Set<String> _fileLines = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('АУРА - программа диагноз болезней'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('imeg'),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    readOnly: true,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    imagepicker();

                    // ImagePicker? result = await ImagePicker(
                    //   type: FileType.image,
                    // );

                    // if (result != null) {
                    //   File imageFile = File(result.files.single.path!);
                    //   setState(() {
                    //     _image = imageFile;
                    //   });
                    // }
                  },
                  child: Text('Browse'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: _image != null
                    ? FutureBuilder(
                        future: _processImage(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Text(snapshot.data.toString());
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _processImage() async {
    img.Image image = img.decodeImage(await _image!.readAsBytes())!;

    Map<int, int> colorCount = SplayTreeMap<int, int>();
    for (int pixel in image.getBytes()) {
      colorCount[pixel] = (colorCount[pixel] ?? 0) + 1;
    }

    Set<String> fileLines = Set<String>();
    File file2 = File('C:\\Users\\User\\Desktop\\aura.txt');
    List<String> lines2 = await file2.readAsLines();

    // for (int line in colorCount.keys.toSet().intersection(lines2.map((line) => int.parse(line)))) {
    //   fileLines.add('$line: ${colorCount[line]} occurrences');
    // }

    setState(() {
      _fileLines = fileLines;
    });

    return fileLines.join('\n');
  }
}

void imagepicker() async {
  // Получаем изображение с помощью image_picker
  final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (image == null) {
    print('Изображение не выбрано');
    return;
  }

  // Читаем изображение и преобразуем его в формат Image
  final img.Image? decodedImage = img.decodeImage(await image.readAsBytes());

  if (decodedImage == null) {
    print('Не удалось декодировать изображение');
    return;
  }

  // Здесь вы можете выполнять операции с изображением, используя библиотеку image

  // Например, изменение размера изображения
  final img.Image resizedImage = img.copyResize(decodedImage, width: 100, height: 100);

  // Вывод информации о новом изображении
  print('Ширина нового изображения: ${resizedImage.width}');
  print('Высота нового изображения: ${resizedImage.height}');
}
