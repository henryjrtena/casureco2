import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/state/models/auth_user.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.authUser,
    required this.onFirebaseSignOut,
    required this.feeders,
    Key? key,
  }) : super(key: key);

  final AuthUser authUser;
  final VoidCallback onFirebaseSignOut;
  final List<Feeder> feeders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.logout_outlined),
          tooltip: 'Sign-out',
          onPressed: () => onFirebaseSignOut.call(),
        )
      ]),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final feeder = feeders[index];

          return ListTile(
            title: Text(feeder.name ?? emptyString),
          );
        },
        itemCount: feeders.length,
      ),
    );
  }
}
