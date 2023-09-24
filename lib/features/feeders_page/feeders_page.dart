import 'package:casureco/features/feeders_page/widgets/feeder_cards.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:casureco/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Feeders extends StatelessWidget {
  const Feeders({
    required this.appUserInfo,
    required this.onFirebaseSignOut,
    required this.feeders,
    super.key,
  });

  final AppUserInfo appUserInfo;
  final VoidCallback onFirebaseSignOut;
  final List<Feeder> feeders;

  @override
  Widget build(BuildContext context) {
    final subscribes = appUserInfo.subscribeTo ?? List.empty();

    return DefaultTabController(
      initialIndex: defaultZero,
      length: 2,
      child: Scaffold(
        drawer: AppDrawer(onSignOut: onFirebaseSignOut),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            )
          ],
          title: Text(appName),
          bottom: TabBar(
            padding: EdgeInsets.only(bottom: 10.0),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.subject_sharp),
                text: 'My Feeders',
              ),
              Tab(
                icon: Icon(Icons.select_all),
                text: 'All Feeders',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FeedersGridView(
              feeders: feeders,
              subscribesTo: subscribes,
            ),
            FeedersGridView(
              feeders: feeders,
              isAllFeeders: true,
              subscribesTo: subscribes,
            ),
          ],
        ),
      ),
    );
  }
}
