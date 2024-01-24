class APIResponse<T> {
  late T data;
  late bool success;
  late String errorMessage;
  late String friendlyErrorMessage;
  dynamic raw;

  APIResponse.success(this.data)
      : success = true,
        raw = data;

  APIResponse.error(
      {required this.errorMessage,
        this.friendlyErrorMessage = "Something Went Wrong."})
      : success = false,
        raw = null;
}