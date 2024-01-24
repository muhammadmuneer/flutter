class PushNotification {
  PushNotification({this.title, this.body});

  String? title;
  String? body;

  @override
  String toString() {
    return 'PushNotification{title: $title, body: $body}';
  }
}
