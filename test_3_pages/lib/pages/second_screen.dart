import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../calculate/controller/calculate_controller.dart';
import '../calculate/controller/theme_controller.dart';
import '../calculate/utils/colors.dart';
import '../calculate/widget/button.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: LightColors.scaffoldBgColor,
        body: Column(
          children: [
            GetBuilder<CalculateController>(builder: (context) {
              return outPutSection(themeController, controller);
            }),
            inPutSection(themeController, controller),
          ],
        ),
      );
    });
  }

  /// In put Section - Enter Numbers
  Widget inPutSection(ThemeController themeController, CalculateController controller) {
    return Expanded(
        flex: 4,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: themeController.isDark ? DarkColors.sheetBgColor : LightColors.sheetBgColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                switch (index) {
                  /// CLEAR BTN
                  case 0:
                    return CustomAppButton(
                      buttonTapped: () {
                        controller.clearInputAndOutput();
                      },
                      color: themeController.isDark ? DarkColors.leftOperatorColor : LightColors.leftOperatorColor,
                      textColor: themeController.isDark ? DarkColors.btnBgColor : LightColors.btnBgColor,
                      text: buttons[index],
                    );

                  /// DELETE BTN
                  case 1:
                    return CustomAppButton(
                        buttonTapped: () {
                          controller.deleteBtnAction();
                        },
                        color: LightColors.leftOperatorColor,
                        textColor: LightColors.btnBgColor,
                        text: buttons[index]);

                  /// EQUAL BTN
                  case 19:
                    return CustomAppButton(
                        buttonTapped: () {
                          controller.equalPressed();
                        },
                        color: LightColors.leftOperatorColor,
                        textColor: LightColors.btnBgColor,
                        text: buttons[index]);

                  default:
                    return CustomAppButton(
                      buttonTapped: () {
                        controller.onBtnTapped(buttons, index);
                      },
                      color: isOperator(buttons[index])
                          ? LightColors.operatorColor
                          : themeController.isDark
                              ? DarkColors.btnBgColor
                              : LightColors.btnBgColor,
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : themeController.isDark
                              ? Colors.white
                              : Colors.black,
                      text: buttons[index],
                    );
                }
              }),
        ));
  }

  /// Out put Section - Show Result
  Widget outPutSection(ThemeController themeController, CalculateController controller) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// theme switcher

        /// Main Result - user input and output
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 70),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  controller.userInput,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  controller.userOutput,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  /// is Operator Check
  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }
}
