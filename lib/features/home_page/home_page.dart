import 'package:casureco/utilities/constant.dart';
import 'package:casureco/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(onSignOut: () {}),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          )
        ],
        title: Text(appName),
      ),
      body: Placeholder(),
    );
  }
}
