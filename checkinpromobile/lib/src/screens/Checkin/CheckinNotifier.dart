import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../MainNotifier.dart';

class CheckinNotifier extends MainNotifier {
  bool isLoading = false;
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
}
