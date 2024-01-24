import '../response.dart';

class Process {
  bool loading = false;
  bool error = false;
  String? friendlyErrorMessage;
  String? errorMessage;

  Process.start() {
    loading = true;
  }

  Process.stop(APIResponse response)
      : loading = false,
        error = response.success == false,
        friendlyErrorMessage =
        response.success == false ? response.friendlyErrorMessage : null,
        errorMessage = response.success == false ? response.errorMessage : null;

  Process.clear() {
    loading = false;
  }

  OnProcessSuccess? onProcessSuccess;
  OnProcessFailed? onProcessFailed;
}

typedef OnProcessSuccess = void Function();
typedef OnProcessFailed = void Function();