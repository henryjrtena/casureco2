import 'package:casureco/extensions/context_texttheme_ext.dart';
import 'package:casureco/features/feeders_page/feeders_page_connector.dart';
import 'package:casureco/features/home_page/home_page_connector.dart';
import 'package:casureco/features/profile/profile_page.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    required this.onSignOut,
    super.key,
  });

  final VoidCallback onSignOut;

  void onNavigateTo(BuildContext context, String route){
    context.go(route, extra: route == SignInPageConnector);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: blue),
            child: Text(
              appName,
              style: context.headlineMedium.copyWith(color: white),
            ),
          ),
          ListTile(
            title: Text(
              'My Profile',
              style: context.titleLarge.copyWith(color: black),
            ),
            leading: Icon(Icons.account_circle_sharp),
            onTap: () {
              onNavigateTo(context, ProfilePage.route);
            },
          ),
          ListTile(
            title: Text(
              'Home',
              style: context.titleLarge.copyWith(color: black),
            ),
            leading: Icon(Icons.home),
            onTap: () {
              onNavigateTo(context, HomePageConnector.route);
            },
          ),
          ListTile(
            title: Text(
              'Feeders',
              style: context.titleLarge.copyWith(color: black),
            ),
            leading: Icon(Icons.subject_sharp),
            onTap: () {
              onNavigateTo(context, FeedersConnector.route);
            },
          ),
          ListTile(
            title: Text(
              'Sign-out',
              style: context.titleLarge.copyWith(color: black),
            ),
            leading: Icon(Icons.logout),
            onTap: () {
              onNavigateTo(context, SignInPageConnector.route);
            },
          ),
        ],
      ),
    );
  }
}
