import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  static const _squareSize = 50.0;

  // creating 2 variables with delayed initialization that enable - disable the button
  late bool _isLeftButtonDisabled;
  late bool _isRightButtonDisabled;

  // we save the variable with the value in the center so that it will be easier further -> errors in the check will come out
  AlignmentGeometry _alignmentCenter = Alignment.center;

  // changing the state of the buttons
  @override
  void initState() {
    _isLeftButtonDisabled = false;
    _isRightButtonDisabled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedAlign(
          //wrapping in motion animation
          alignment: _alignmentCenter,
          onEnd: () {
            setState(() {
              if (_alignmentCenter == Alignment.centerLeft) {
                // by pressing the left buttons become inactive and reaching the edge the right one becomes active
                _isRightButtonDisabled = false;
              } else if (_alignmentCenter == Alignment.centerRight) {
                //the same with the right
                _isLeftButtonDisabled = false;
              } else if (_alignmentCenter == Alignment.center) {
                // when returning to the center, the buttons become active
                _isLeftButtonDisabled = false;
                _isRightButtonDisabled = false;
              }
            });
          },
          duration: const Duration(seconds: 1),
          child: Container(
            width: _squareSize,
            height: _squareSize,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IgnorePointer(
              key: Key,
              ignoringSemantics:Null
              
              //we wrap the buttons in the ignore pointer so that they can be conveniently disabled - it was possible to use the built-in class in the button, but I decided to do it faster
              ignoring:
                  _isLeftButtonDisabled, // we work with each button separately
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: // if the button is inactive, we make it gray, otherwise we return the blue one back.
                          _isLeftButtonDisabled ? Colors.grey : Colors.blue),
                  onPressed: () {
                    setState(() {
                      if (_alignmentCenter == Alignment.center) {
                        // if we press the movement to the left from the center, then both buttons are inactive
                        _alignmentCenter = Alignment.centerLeft;
                        _isLeftButtonDisabled = true;
                        _isRightButtonDisabled = true;
                      } else if (_alignmentCenter == Alignment.centerRight) {
                        // also from the center to the right
                        _alignmentCenter = Alignment.center;
                      }
                    });
                  },
                  child: const Text("To the left")),
            ),
            IgnorePointer(
              // we do the same with the right button
              ignoring: _isRightButtonDisabled,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isRightButtonDisabled ? Colors.grey : Colors.blue),
                  onPressed: () => {
                        setState(() {
                          if (_alignmentCenter == Alignment.center) {
                            _alignmentCenter = Alignment.centerRight;
                            _isRightButtonDisabled = true;
                            _isLeftButtonDisabled = true;
                          } else if (_alignmentCenter == Alignment.centerLeft) {
                            _alignmentCenter = Alignment.center;
                          }
                        })
                      },
                  child: const Text("To the right")),
            )
          ],
        )
      ],
    );
  }
}
