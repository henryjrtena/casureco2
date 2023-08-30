import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/state/app_state.dart';

class SignInPageVmFactory extends VmFactory<AppState, SignInPageConnector, Vm> {
  @override
  Vm fromStore() => SignInPageVm();
}

class SignInPageVm extends Vm {
  SignInPageVm() : super(equals: []);
}
