import 'package:flutter/material.dart';

import 'animal_board_card.dart';

class BackgroundLayout extends StatelessWidget {
  const BackgroundLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AnimalBoardCard(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
        ),
      ],
    );
  }
}
