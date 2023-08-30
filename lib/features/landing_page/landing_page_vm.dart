import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/landing_page/landing_page_connector.dart';
import 'package:casureco/state/app_state.dart';

class LandingPageVmFactory extends VmFactory<AppState, LandingPageConnector, Vm> {
  @override
  Vm fromStore() => LandingPageVm();
}

class LandingPageVm extends Vm {
  LandingPageVm() : super(equals: []);
}
