import 'package:casureco/extensions/context_texttheme_ext.dart';
import 'package:casureco/features/home_page/widgets/feeder_cards.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:flutter/material.dart';

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
    final subscribes = appUserInfo.subscribeTo;
    final subscribeFeeders = List<Feeder>.from([]);

    if (subscribes == null) {
      subscribeFeeders.addAll(feeders);
    } else {
      for (final feeder in feeders) {
        if (subscribes.contains(feeder.id?.toString())) {
          subscribeFeeders.add(feeder);
        }
      }
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: blue),
                child: Text(
                  'Casureco II',
                  style: context.headlineMedium.copyWith(color: white),
                ),
              ),
              ListTile(
                title: const Text('My Profile'),
                leading: Icon(Icons.account_circle_sharp),
                onTap: () {

                },
              ),
              ListTile(
                title: const Text('Sign-out'),
                leading: Icon(Icons.logout),
                onTap: onFirebaseSignOut,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            )
          ],
          title: Text('Casureco II'),
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
            FeedersGridView(feeders: subscribeFeeders),
            FeedersGridView(
              feeders: feeders,
              isAllFeeders: true,
            ),
          ],
        ),
      ),
    );
  }
}
