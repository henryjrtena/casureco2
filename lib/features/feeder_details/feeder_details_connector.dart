import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/feeder_details/feeder_details_page.dart';
import 'package:casureco/features/feeder_details/feeder_details_vm.dart';
import 'package:casureco/state/actions/collection_actions.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/material.dart';

class FeederDetailsConnector extends StatelessWidget {
  static const route = '/feeder-details';

  const FeederDetailsConnector({
    required this.feederId,
    super.key,
  });

  final int feederId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeederDetailsVm>(
      vm: () => FeederDetailsVmFactory(),
      onInit: (store) => store.dispatchSync(SetSelectedFeederAction(feederId)),
      onDispose: (store) => store.dispatchSync(ClearSelectedFeederAction()),
      builder: (context, vm) => FeederDetails(
        feeder: vm.selectedFeeder,
      ),
    );
  }
}
