import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/feeders_page/feeders_page.dart';
import 'package:casureco/features/feeders_page/feeders_page_vm.dart';
import 'package:casureco/handler/api_manager.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/main.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/material.dart';

class FeedersConnector extends StatelessWidget {
  static const route = '/feeders';

  const FeedersConnector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeedersVm>(
      vm: () => FeedersVmFactory(),
      builder: (context, vm) => StreamBuilder<List<Feeder>>(
        stream: getIt<ApiManager>().getAllFeedersStream(),
        builder: (context, snapshot) {
          final feeders = snapshot.data ?? List.empty();

          return Feeders(
            appUserInfo: vm.appUserInfo,
            onFirebaseSignOut: vm.onFirebaseSignOut,
            feeders: feeders,
          );
        },
      ),
    );
  }
}
