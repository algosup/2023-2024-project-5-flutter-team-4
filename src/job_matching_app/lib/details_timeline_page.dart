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
      floatingActionButton: () {
        return FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        );
      }(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: ListView(
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width / 3, top: 40, bottom: 40),
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
            // startChild: Container(
            //   constraints: BoxConstraints(
            //     minHeight: MediaQuery.of(context).size.width * 0.25,
            //   ),
            // ),
            startChild: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child: Text(
                  "2010",
                  style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
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
            // startChild: Container(
            //   constraints: BoxConstraints(
            //     minHeight: MediaQuery.of(context).size.width * 0.25,
            //   ),
            // ),
            startChild: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child:
                  Text(
                    "2010",
                    style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
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
            // startChild: Container(
            //   constraints: BoxConstraints(
            //     minHeight: MediaQuery.of(context).size.width * 0.25,
            //   ),
            // ),
            startChild: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child:
                  Text(
                    "2010",
                    style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
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
            // startChild: Container(
            //   constraints: BoxConstraints(
            //     minHeight: MediaQuery.of(context).size.width * 0.25,
            //   ),
            // ),
            startChild: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child:
                  Text(
                    "2010",
                    style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
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
            // startChild: Container(
            //   constraints: BoxConstraints(
            //     minHeight: MediaQuery.of(context).size.width * 0.25,
            //   ),
            // ),
            startChild: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: const Center(
                child:
                  Text(
                    "2010",
                    style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
