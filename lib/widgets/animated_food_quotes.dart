import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dietary/utils/food_quotes.dart';

class AnimatedFoodQuotes extends StatelessWidget {
  const AnimatedFoodQuotes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    foodQuotes.shuffle();
    return SizedBox(
      width: 250.0,
      height: 37.0,
      child: TyperAnimatedTextKit(
        text: foodQuotes,
        textAlign: TextAlign.center,
        speed: Duration(milliseconds: 50),
        pause: Duration(minutes: 1),
        textStyle: TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
