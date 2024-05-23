import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DetailsTimeLinePage extends StatefulWidget {
  const DetailsTimeLinePage({super.key});

  @override
  State<DetailsTimeLinePage> createState() => _DetailsTimeLinePageState();
}

class _DetailsTimeLinePageState extends State<DetailsTimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: () {
      //   return FloatingActionButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Icon(Icons.close),
      //   );
      // }(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
            right: 20, left: 20, top: 40, bottom: 40),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.end,
            beforeLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            afterLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            indicatorStyle: IndicatorStyle(
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.circle,
              ),
              width: 35,
              color: Colors.blue,
            ),
            isFirst: true,
            startChild: Container(
              margin: const EdgeInsets.only(left: 10, right: 15, top: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "1970",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "The company was founded in 1970 by Steve Jobs, Steve Wozniak, and Ronald Wayne.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.end,
            beforeLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            afterLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            indicatorStyle: IndicatorStyle(
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.circle,
              ),
              width: 35,
              color: Colors.blue,
            ),
            startChild: Container(
              margin: const EdgeInsets.only(left: 10, right: 15, top: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "1980",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "In 1980, Apple went public and became the first company to reach a market capitalization of \$1 billion.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.end,
            beforeLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            afterLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            indicatorStyle: IndicatorStyle(
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.circle,
              ),
              width: 35,
              color: Colors.blue,
            ),
            startChild: Container(
              margin: const EdgeInsets.only(left: 10, right: 15, top: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "1990",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "In 1990, Apple released the Macintosh Portable, the first portable Macintosh computer.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.end,
            beforeLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            afterLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            indicatorStyle: IndicatorStyle(
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.circle,
              ),
              width: 35,
              color: Colors.blue,
            ),
            startChild: Container(
              margin: const EdgeInsets.only(left: 10, right: 15, top: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "2000",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "In 2000, Apple released the Power Mac G4 Cube, a small form factor Macintosh computer.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.end,
            beforeLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            indicatorStyle: IndicatorStyle(
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.circle,
              ),
              width: 35,
              color: Colors.blue,
            ),
            startChild: Container(
              margin: const EdgeInsets.only(left: 10, right: 15, top: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "2010",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2010 saw the release of the iPad, Apple's first tablet computer.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.end,
            beforeLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            indicatorStyle: IndicatorStyle(
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.circle,
              ),
              width: 35,
              color: Colors.blue,
            ),
            startChild: Container(
              margin: const EdgeInsets.only(left: 10, right: 15, top: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "2020",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "From 2020 onwards, Apple has been releasing new products and services, including the iPhone 12, Apple Watch Series 6, and Apple Fitness+.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.end,
            isLast: true,
            beforeLineStyle: const LineStyle(
              color: Colors.blue,
              thickness: 8,
            ),
            indicatorStyle: IndicatorStyle(
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.circle,
              ),
              width: 35,
              color: Colors.blue,
            ),
            startChild: Container(
              margin: const EdgeInsets.only(left: 10, right: 15, top: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "2030",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "In 2030, Apple is expected to release new products and services, including the iPhone 20, Apple Watch Series 10, and Apple Fitness++.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
