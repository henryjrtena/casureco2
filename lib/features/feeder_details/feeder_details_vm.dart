import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/feeder_details/feeder_details_connector.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/state/actions/collection_actions.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/cupertino.dart';

class FeederDetailsVmFactory extends VmFactory<AppState, FeederDetailsConnector, Vm> {
  @override
  Vm fromStore() => FeederDetailsVm(
        selectedFeeder: _selectedFeeder,
        onSubscribe: _onSubscribe,
        subscribeFeeders: _subscribeFeeders,
      );

  Feeder? get _selectedFeeder => state.selectedFeeder;

  List<String> get _subscribeFeeders => state.appUserInfo?.subscribeTo ?? [];

  void _onSubscribe(String feederId) => dispatchAsync(SubscribeAFeederAction(feederId));
}

class FeederDetailsVm extends Vm {
  FeederDetailsVm({
    required this.selectedFeeder,
    required this.onSubscribe,
    required this.subscribeFeeders,
  }) : super(equals: [
          selectedFeeder,
          subscribeFeeders,
        ]);

  final Feeder? selectedFeeder;
  final ValueChanged<String> onSubscribe;
  final List<String> subscribeFeeders;
}
