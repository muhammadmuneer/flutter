import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../core/process.dart';

mixin ProcessMixin on GetxController {
  Process get process => _process;

  set process(Process process) {
    if (process.loading == false && _process.loading == true) {
      if (_process.onProcessFailed != null && process.error == true) {
        _process.onProcessFailed!.call();
      }
      if (_process.onProcessSuccess != null && process.error == false) {
        _process.onProcessSuccess!.call();
      }
    }
    _process = process;
    update();
  }

  Process _process = Process.clear();
}
