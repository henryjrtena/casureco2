import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/feeder_details/feeder_details_connector.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/state/app_state.dart';

class FeederDetailsVmFactory extends VmFactory<AppState, FeederDetailsConnector, Vm> {
  @override
  Vm fromStore() => FeederDetailsVm(selectedFeeder: selectedFeeder);

  Feeder? get selectedFeeder => state.selectedFeeder;
}

class FeederDetailsVm extends Vm {
  FeederDetailsVm({
    required this.selectedFeeder,
  }) : super(equals: [selectedFeeder]);

  final Feeder? selectedFeeder;
}
