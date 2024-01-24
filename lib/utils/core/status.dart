import '../response.dart';

class Status {
  /// This is used to check if the [Status] is NOT loading and NOT showing an error.
  ///
  /// This is true when data has been successfully loaded.
  /// Or loading has not been started.
  bool get isClear => !loading && !error;

  /// If the [Status] is loading some sort of data.
  bool loading = false;

  /// If the [Status] encountered some sort of error.
  bool error = false;

  /// This is the error message which contains specific details for the error.
  /// Like exception and stack trace e.t.c.
  /// This can be null if the [Status] is clear or if data loaded successfully.
  ///
  /// So make sure to check that [error] == true before reading this value.
  /// Like so:
  ///
  /// if (status.error) {
  ///   print("ERROR: ${status.errorMessage}");
  /// }
  String? errorMessage;

  /// This is the error message you should show to your user, like
  /// "Internet Not Available" or "Plese check your internet connection and try
  /// again".
  ///
  /// Usage example in UI:
  ///
  /// if (status.error) {
  ///   print("ERROR: ${status.errorMessage}");
  ///
  ///   setState(() {
  ///     _userFriendlyErrorMessage = status.friendlyErrorMessage;
  ///   });
  /// }
  String? friendlyErrorMessage;

  /// This is usually used as the default value for a [Status].
  /// [StatusMixin.status] uses this as the default value.
  ///
  /// THIS SAYS:
  /// "I'm not loading data right now and I haven't encountered any errors."
  Status.clear() {
    loading = false;
    error = false;
    errorMessage = null;
    friendlyErrorMessage = null;
  }

  /// This is used when the status is set to loading state.
  ///
  /// Quick usage Example:
  ///   status = Status.loading();
  ///
  /// THIS SAYS:
  /// "I have started loading but I have not encountered any errors so far."
  Status.loading()
      : loading = true,
        error = false,
        friendlyErrorMessage = null,
        errorMessage = null;

  Status.error([this.friendlyErrorMessage = "Something Went Wrong."])
      : loading = false,
        error = true;

  /// This is used when finishing up a loading function and the data is being
  /// fetched in a [Response] class.
  ///
  /// Quick usage Example:
  ///   status = Status.fromResponse(response);
  ///
  /// THIS SAYS:
  /// "I have finished loading and this is the error I encountered (if any)."
  Status.fromResponse(APIResponse response)
      : loading = false,
        error = response.success == false,
        friendlyErrorMessage = (response.success == false) == true
            ? response.friendlyErrorMessage
            : null,
        errorMessage =
            (response.success == false) == true ? response.errorMessage : null;

  /// Overriding this and manually printing the data makes it easier to debug.
  @override
  String toString() =>
      "Status(loading: $loading, error: $error, errorMessage: $errorMessage, friendlyErrorMessage: $friendlyErrorMessage)";
}
