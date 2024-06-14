import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsTimeLinePage extends StatefulWidget {
  const DetailsTimeLinePage({super.key, required this.id});

  final int id;

  @override
  State<DetailsTimeLinePage> createState() => _DetailsTimeLinePageState(id: id);
}

class _DetailsTimeLinePageState extends State<DetailsTimeLinePage> {
  var id;
  _DetailsTimeLinePageState({required this.id});


  List<String> dates = [];
  List<String> datesDescription = [];

  @override
  void initState() {
    super.initState();
    var db = FirebaseFirestore.instance;

    db.collection('Users').get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (result.data()["ID"] == id) {
            if (result.data()["Dates"] != null){
            dates = result.data()["Dates"].cast<String>();
            datesDescription = result.data()["DatesDescription"].cast<String>();
            }
            break;
          }
        }
      },
    ).then(
      (value) => setState(() {}),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          for (int i = 0; i < dates.length; i++)
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
            isFirst: i == 0 ? true : false,
            isLast: i == dates.length - 1 ? true : false,
            startChild: Container(
              margin: const EdgeInsets.only(left: 10, right: 15, top: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.width * 0.25,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      dates[i],
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      datesDescription[i],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
