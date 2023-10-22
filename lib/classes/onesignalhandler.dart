import 'package:casureco/environment.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


class OneSignalHandler {
  late String? subcriberId;

  void initOneSignal() {
    OneSignal.initialize(Environment.oneSignalPassCode);
    OneSignal.Notifications.requestPermission(true);

    OneSignal.User.pushSubscription.addObserver((state) {
      subcriberId = state.current.id ?? emptyString;
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      event.preventDefault();

      event.notification.display();
    });
  }
}
