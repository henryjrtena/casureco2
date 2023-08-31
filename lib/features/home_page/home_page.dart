import 'package:casureco/state/models/auth_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.authUser,
    required this.onFirebaseSignOut,
    Key? key,
  }) : super(key: key);

  final AuthUser authUser;
  final VoidCallback onFirebaseSignOut;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.logout_outlined),
          tooltip: 'Sign-out',
          onPressed: () => widget.onFirebaseSignOut.call(),
        )
      ]),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text('Hi! ${widget.authUser.email}'),
        ),
      ),
    );
  }
}
