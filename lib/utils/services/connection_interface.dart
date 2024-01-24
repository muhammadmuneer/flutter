import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectionInterface {
  Future<ConnectivityResult> hasConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {}
    return connectivityResult;
  }

  Future<bool> checkConnection() async {
    StreamController<bool> controller = StreamController<bool>();
    Stream stream = controller.stream;
    var connectivityResult = await (Connectivity().checkConnectivity());
    stream.listen((value) {
      if (kDebugMode) {
        print('Value from controller: $value');
        print('Value from connectivityResult: ${connectivityResult.name}');
      }
    });
    return true;
  }
}
