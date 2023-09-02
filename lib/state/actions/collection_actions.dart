import 'package:async_redux/async_redux.dart';
import 'package:casureco/handler/api_manager.dart';
import 'package:casureco/main.dart';
import 'package:casureco/state/app_state.dart';

class GetAllFeedersAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final feeders = await getIt<ApiManager>().getAllFeeders();
    return state.copyWith(feeders: feeders);
  }
}
