import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/feeder_details/feeder_details_page.dart';
import 'package:casureco/features/feeder_details/feeder_details_vm.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/material.dart';

class FeederDetailsConnector extends StatelessWidget {
  static const route = '/feeders/feeder-details';

  const FeederDetailsConnector({
    required this.feeder,
    super.key,
  });

  final Feeder feeder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeederDetailsVm>(
      vm: () => FeederDetailsVmFactory(),
      builder: (context, vm) => FeederDetails(
        feeder: feeder,
        onSubscribed: vm.onSubscribe,
        subscribeFeeders: vm.subscribeFeeders,
      ),
    );
  }
}
