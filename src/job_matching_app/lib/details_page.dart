import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text("Details",
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Details Page",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                )),
          ),
        ],
      ),
    );
  }
}