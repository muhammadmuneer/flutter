import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

class CloudFunctionsInterface {
  final cloudFunctions = FirebaseFunctions.instance;

  Future<bool> sendNotifications() async {
    try {
      final result =
          await FirebaseFunctions.instance.httpsCallable('addMessage').call();
      if (kDebugMode) {
        print(result.data);
      }
      return true;
    } on FirebaseFunctionsException catch (error) {
      if (kDebugMode) {
        print(error.code);
        print(error.details);
        print(error.message);
      }
      return false;
    }
  }
}
