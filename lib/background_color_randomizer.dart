import 'dart:math';

import 'package:flutter/material.dart';

/// Basis of the app
/// Create the statefull widget
class BackgroundColorRandomizer extends StatefulWidget {
  /// Constructor of BackgroundColorRandomizer Class
  const BackgroundColorRandomizer({super.key});
  @override
  State<BackgroundColorRandomizer> createState() =>
      _BackgroundColorRandomizerState();
}

/// it's empty
class _BackgroundColorRandomizerState extends State<BackgroundColorRandomizer> {
  /// Declaration of the variables used in the widget
  Color backgroundColor = Colors.blue;
  Color textColor = Colors.black;
  static const darkTheme = 190;
  static const lightTheme = 220;
  static const darkThemeLimit = darkTheme * 0.7;
  static const lightThemeLimit = lightTheme * 0.8;
  static const double fontSize = 50;
  static const double letterSpacing = 5;
  static const transitionMilliseconds = 750;

  /// Function responsible for changing the background color
  void _pageChange() {
    setState(() {
      /// Checks if Dark theme is enabled in the device
      /// Change the background for a Random color less bright
      if (Theme.of(context).brightness == Brightness.dark) {
        backgroundColor = Color.fromRGBO(
          Random().nextInt(darkTheme),
          Random().nextInt(darkTheme),
          Random().nextInt(darkTheme),
          1,
        );

        /// Checks if the random color is bellow the limit (sum < darkTheme)
        /// Change the color of the text to White in order to keep visibility
        textColor =
            backgroundColor.red + backgroundColor.blue + backgroundColor.green <
                    darkThemeLimit
                ? Colors.white
                : Colors.black;
      } else {
        /// Change the background for a Random color
        backgroundColor = Color.fromRGBO(
          Random().nextInt(lightTheme),
          Random().nextInt(lightTheme),
          Random().nextInt(lightTheme),
          1,
        );

        /// Checks if the random color is bellow the limit (sum < LightTheme)
        /// Change the color of the text to White in order to keep visibility
        textColor =
            backgroundColor.red + backgroundColor.blue + backgroundColor.green <
                    lightThemeLimit
                ? Colors.white
                : Colors.black;
      }
    });
  }

  /// Body of the widget
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pageChange();
      },
      child: AnimatedContainer(
        color: backgroundColor,
        duration: const Duration(milliseconds: transitionMilliseconds),
        curve: Curves.fastOutSlowIn,
        child: Center(
          child: Text(
            'Hello there',
            style: TextStyle(
              decoration: TextDecoration.none,
              letterSpacing: letterSpacing,
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
