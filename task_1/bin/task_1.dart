// // import 'dart:html';

// import 'package:task_1/task_1.dart' as task_1;

// extension DateTimeExtensions on DateTime {
//   String formattedString() {
// String year = this.year.toString().padLeft(4, '0');
//     String month = this.month.toString().padLeft(2, '0');
//     String day = this.day.toString().padLeft(2, '0');
//     String hour = this.hour.toString().padLeft(2, '0');
//     String minute = this.minute.toString().padLeft(2, '0');
//     String second = this.second.toString().padLeft(2, '0');

//     return '$year.$month.$day $hour:$minute:$second';
//   }
// }

// void main() {
//   DateTime now = DateTime.now();
//   String formatted = now.formattedString();
//   print(formatted); // Output: 2023.10.02 13:45:30 (current date and time)
// }

// import 'package:intl/intl.dart';

// void main() {
//   DateTime now = DateTime.now();

//   String formatted = DateFormat('yyyy.MM.dd HH:mm:ss').format(now);
//   print(formatted);
// }

// extension StringExtensions on String {
//   List<dynamic> parseLinks() {
//     List<dynamic> result = [];
//     int currentIndex = 0;

//     while (currentIndex < this.length) {
//       // Find the next occurrence of "http://" or "https://" or "www."
//       int linkStart = this.lastIndexOf('http://', currentIndex);
//       if (linkStart == -1) linkStart = this.indexOf('https://', currentIndex);
//       if (linkStart == -1) linkStart = this.indexOf('www.', currentIndex);
//       if (linkStart == -1) linkStart = this.indexOf('.com', currentIndex);

//       // int linkFinish = this.indexOf('.com', currentIndex);
//       // if (linkFinish == -1) linkFinish = this.indexOf('.com', currentIndex);

//       if (linkStart == -1) {
//         // No more links found, add the remaining text as plain text
//         result.add(this.substring(currentIndex));
//         break;
//       }

//       // Add the preceding text as plain text
//       if (linkStart > currentIndex) {
//         result.add(this.substring(currentIndex, linkStart));
//       }

//       // Find the end of the link (space or end of string)
//       int linkEnd = this.indexOf(' ', linkStart);
//       if (linkEnd == -1) linkEnd = this.length;

//       // Add the link as a string
//       result.add(Link(this.substring(linkStart, linkEnd)));

//       currentIndex = linkEnd;
//     }

//     return result;
//   }
// }

// class Link {
//   final String url;

//   Link(this.url);

//   @override
//   String toString() {
//     return 'Link("$url")';
//   }
// }

// void main() {
//   String text = 'Hello, https://www.google.com, yay';
//   List<dynamic> parsed = text.parseLinks();

//   for (var item in parsed) {
//     if (item is String) {
//       print('Text("$item")');
//     } else if (item is Link) {
//       print(item);
//     }
//   }
// }
