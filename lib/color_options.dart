import 'package:flutter/material.dart';
import 'dart:math';
import './color_option.dart';

class ColorOptions extends StatelessWidget {
  final int randomR;
  final int randomG;
  final int randomB;

  final Function answerHandler;

  ColorOptions(this.randomR, this.randomG, this.randomB, this.answerHandler);

  @override
  Widget build(BuildContext context) {
    List<int> optionList= [0,1,2,3];

    Random random = Random();

    int answer = random.nextInt(4);
    optionList.remove(answer);
    var randomOptions = {
      answer: {'r': randomR, 'g': randomG, 'b': randomB},
      optionList[0]: {'r': random.nextInt(256), 'g':random.nextInt(256), 'b':random.nextInt(256)},
      optionList[1]: {'r': random.nextInt(256), 'g':random.nextInt(256), 'b':random.nextInt(256)},
      optionList[2]: {'r': random.nextInt(256), 'g':random.nextInt(256), 'b':random.nextInt(256)},
    };

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorOption(randomOptions[0], answerHandler),
            ColorOption(randomOptions[1], answerHandler)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorOption(randomOptions[2], answerHandler),
            ColorOption(randomOptions[3], answerHandler)
          ],
        ),
      ],
    );
  }
}
