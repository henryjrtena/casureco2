import 'package:casureco/features/feeder_details/feeder_details_connector.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.appUserInfo,
    required this.onFirebaseSignOut,
    required this.feeders,
    Key? key,
  }) : super(key: key);

  final AppUserInfo appUserInfo;
  final VoidCallback onFirebaseSignOut;
  final List<Feeder> feeders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.logout_sharp),
          tooltip: 'Sign-out',
          onPressed: onFirebaseSignOut,
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

          return GestureDetector(
            child: Card(
              child: ListTile(
                title: Text(feeder.name ?? emptyString),
              ),
            ),
            onTap: () => context.go(
              FeederDetailsConnector.route,
              extra: feeder.id,
            ),
          );
        },
        itemCount: feeders.length,
      ),
    );
  }
}
