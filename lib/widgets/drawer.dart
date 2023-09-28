import 'package:casureco/extensions/context_texttheme_ext.dart';
import 'package:casureco/features/feeders_page/feeders_page_connector.dart';
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

  void navigateTo(BuildContext context, String route) {
    context.pushReplacement(route, extra: (route == SignInPageConnector.route));
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
              style: context.titleMedium.copyWith(color: black),
            ),
            leading: Icon(Icons.home),
            onTap: () => navigateTo(context, ProfilePage.route),
          ),
          ListTile(
            title: Text(
              'Home',
              style: context.titleMedium.copyWith(color: black),
            ),
            leading: Icon(Icons.account_circle_sharp),
            onTap: () => navigateTo(context, '/'),
          ),
          ListTile(
            title: Text(
              'Feeders',
              style: context.titleMedium.copyWith(color: black),
            ),
            leading: Icon(Icons.subject_sharp),
            onTap: () => navigateTo(context, FeedersConnector.route),
          ),
          ListTile(
            title: Text(
              'Sign-out',
              style: context.titleMedium.copyWith(color: black),
            ),
            leading: Icon(Icons.logout),
            onTap: () => navigateTo(context, SignInPageConnector.route),
          ),
        ],
      ),
    );
  }
}
