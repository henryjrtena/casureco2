import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/home_page/home_page_connector.dart';
import 'package:casureco/state/app_state.dart';

class HomePageVmFactory extends VmFactory<AppState, HomePageConnector, Vm> {
  @override
  Vm fromStore() => HomePageVm();
}

class HomePageVm extends Vm {
  HomePageVm() : super(equals: []);
}
