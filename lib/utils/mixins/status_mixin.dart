import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../core/status.dart';

mixin StatusMixin on GetxController {
  Status _status = Status.clear();

  Status get status => _status;

  set status(Status taskStatus) {
    _status = taskStatus;
    update();
  }
}
