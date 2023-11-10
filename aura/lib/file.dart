// import 'package:buffer_image/buffer_image.dart';
// import 'dart:io';
// import 'package:image/image.dart' as img;

//  void main() async{
//     try {
//       final img.Image image =
//       img.decodeImage(await File('/Users/admin/Documents/GitHub/flutter-app/aura/assets/fone.jpg').readAsBytes())!;

//   // Получите пиксели изображения
//   final List<int> pixels = image.getBytes();


//       // File imageFile = File('/Users/admin/Documents/GitHub/flutter-app/aura/assets/1.jpg');
//       BufferImage image2 = BufferImage.fromGray(pixels as GrayImage);

//       int width = image.width;
//       int height = image.height;
//       int eps = 10;

//       String fileData = '';

//       for (int i = 0; i < width; i++) {
//         for (int j = 0; j < height; j++) {
//           int pixel = image2.pixels as int;
//           int red = (pixel >> 16) & 0xff;
//           int green = (pixel >> 8) & 0xff;
//           int blue = pixel & 0xff;

//           int violet = (red - green);
//           int blueValue = blue;
//           int cyan = (blue - green);
//           int greenValue = green;
//           int yellow = (red - green - blue);
//           int orange = (red - green);
//           int redValue = red;

//           fileData.compareTo(String.fromEnvironment(
//               "(%d, %d, %d, %d, %d, %d, %d)%n", violetStr, blueValue, cyan, greenValue, yellow, orange, redValue));
//         }
//       }

//       // File fileOut = File("C:\\Users\\User\\Desktop\\file.txt");
//       // fileOut(fileData.toString());
//       // fileOut.close();

//       int sum1 = violet;
//       String violetStr =
//           "SAHASRARA.Headaches. Diseases of the nervous system and mental state disorders.САХАСРАРА.Головные боли. Заболевания нервной системы и нарушения психического состояния.";
//       print(sum1 + " " + violetStr);

//       int sum2 = Math.abs(blue);
//       String blueStr =
//           "Ajna.Headache, fainting, dizziness, Sinusitis. eyes.Аджна.Головная боль, обмороки, головокружения. Синуситы. Глаза.";
//       print(sum2 + " " + blueStr);

//       int sum3 = Math.abs(cyan);
//       String cyanStr =
//           "VISHUDHA.Thyroid gland, ears, larynx, trachea, esophagus, lungs, stuttering.ВИШУДХА.Щитовидная железа, уши, гортань, трахея, пищевод. Легкие, заикание.";
//       print(sum3 + " " + cyanStr);

//       int sum4 = Math.abs(green);
//       String greenStr =
//           "ANAHATA. Heart. Asthma. Osteochondrosis. Pneumonia. Tuberculosis. Mastopathy. Hypertension.АНАХАТА.Сердце. Астма. Остеохондроз. Пневмония. Туберкулез. Мастопатия. Гипертония.";
//       print(sum4 + " " + greenStr);

//       int sum5 = Math.abs(yellow);
//       String yellowStr =
//           "MANIPURA.Pancreas. Stomach. Kidneys. Spleen. Liver. Gallbladder. Diabetes.МАНИПУРА.Поджелудочная железа. Желудок. Почки. Селезенка. Печень. Желчный пузырь. Диабет.";
//       print(sum5 + " " + yellowStr);

//       int sum6 = Math.abs(orange);
//       String orangeStr =
//           "SVADHISTHANA.Ovaries. Testes. Impotence. Prostate. Fibroids. Cysts. Sexually transmitted diseases.СВАДХИСТАНА.Яичники. Семенники. Импотенция. Простата. Фибромы. Кисты. Венерические болезни.";
//       print(sum6 + " " + orangeStr);

//       int sum7 = Math.abs(red);
//       String redStr =
//           "MULADHARA.Adrenal glands. Obesity. Hemorrhoids, Intestines. Thrombophlebitis.МУЛАДХАРА.Надпочечники. Ожирение. Геморрой. Кишечник. Тромбофлебит.";
//       print(sum7 + " " + redStr);
//     } catch (IOException) {
//       e.toString();
//     }
//   }
