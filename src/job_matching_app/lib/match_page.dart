import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Container> cards = [
      Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: const Text('1'),
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: const Text('2'),
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.purple,
        child: const Text('3'),
      )
    ];

    return Scaffold(
      body: CardSwiper(
        cardsCount: cards.length,
        allowedSwipeDirection: const AllowedSwipeDirection.only(
          left: true,
          up: true,
          right: true,
          down: false,
        ),
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
            cards[index],
      ),
    );
  }
}
