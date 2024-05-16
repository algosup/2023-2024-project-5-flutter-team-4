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
        child: const Image(
          image: AssetImage('lib/assets/images/flutte_logo.png'),
        ),
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: const Image(
          image: AssetImage('lib/assets/images/dart_logo.png'),
        ),
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.purple,
        child: const Image(
          image: AssetImage('lib/assets/images/d_logo.png'),
        ),
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
