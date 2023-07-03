import 'package:flutter/material.dart';
import 'package:make_a_choice/widgets/down_button.dart';
import 'package:make_a_choice/widgets/left_box.dart';
import 'package:make_a_choice/widgets/parse_remote_datasourse.dart';
import 'package:make_a_choice/widgets/right_box.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'widgets/text_up.dart';
import 'widgets/up_row_three_widgets.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = '5uFjH3WOFMWNxDqjMuBq7vZArsfOQsoxxhGMpTYL';
  const keyClientKey = 'aGWlndUmFRjfy716EPmCXGmikfYG5I2lrPOUglvd';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const squareSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: ''),
      home: FutureBuilder<List<String>>(
          future: _getListPrises(),
          initialData: const [],
          builder: (context, snapshot) {
            return snapshot.data!.isNotEmpty
                ? HomeScreen(
                    listPrises: snapshot.data!,
                  )
                : const SizedBox.shrink();
          }),
    );
  }

  Future<List<String>> _getListPrises() async {
    return await ParseRemoteDatasource().getAllPrises();
  }
}

class HomeScreen extends StatefulWidget {
  final List<String> listPrises;

  const HomeScreen({required this.listPrises, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isOpenedLeft;
  late bool isOpenedRight;

  @override
  void initState() {
    super.initState();
    isOpenedLeft = false;
    isOpenedRight = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment : CrossAxisAlignment.center,
          //   mainAxisSize : MainAxisSize.min,
          children: [
            const UpRowThreeWidgets(),
            const SizedBox(
              height: 60,
            ),
            const TextUp(),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 350,
                  height: 350,
                  child: LeftBoxAnimation(
                    onClicked: () {
                      isOpenedLeft = !isOpenedLeft;
                      setState(() {});
                    },
                    isOpened: isOpenedLeft,
                    listPrises: widget.listPrises,
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 350,
                  child: RightBoxAnimation(
                    onClicked: () {
                      isOpenedRight = !isOpenedRight;
                      setState(() {});
                    },
                    isOpened: isOpenedRight,
                    listPrises: widget.listPrises,
                  ),
                ),
              ],
            ),
            DownButton(
              onClicked: () {
                if (isOpenedLeft || isOpenedRight) {
                  isOpenedLeft = false;
                  isOpenedRight = false;
                  setState(() {});
                  widget.listPrises.shuffle();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
