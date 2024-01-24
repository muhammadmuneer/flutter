import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../utils/services/api_interface.dart';
import '../utils/core/process.dart';
import '../utils/mixins/process_mixin.dart';
import '../utils/response.dart';
import '../utils/services/firestore_interface.dart';

class AuthenticationController extends GetxController with ProcessMixin {
  //Selected Image
  XFile? profileImage;
  String? deviceID;

  @override
  void onInit() {
    _getDeviceID();
    super.onInit();
  }

  Future<bool> register(String firstName, String lastName, String email,
      String gender, String dob, String role, String password) async {
    process = Process.start();
    APIResponse response = await ApiInterface.register(
        firstName, lastName, email, gender, dob, role, password, deviceID!);
    process = Process.stop(response);
    return response.success;
  }

  Future<bool> login(String email, String password) async {
    process = Process.start();
    APIResponse apiResponse =
        await ApiInterface.login(email, password, deviceID!);
    process = Process.stop(apiResponse);
    return apiResponse.success;
  }

  Future<bool> resetPassword(String email) async {
    process = Process.start();
    APIResponse response = await ApiInterface.resetPassword(email);
    process = Process.stop(response);
    return response.success;
  }

  Future<bool> updateUserProfile(
    String firstName,
    String lastName,
    String email,
  ) async {
    process = Process.start();
    APIResponse response = await ApiInterface.updateUserProfile(
        firstName, lastName, email, profileImage);

    if (response.success) {
      // Calling Firestore Interface to update the user data.
      FirestoreInterface _fireStoreInterface = FirestoreInterface();

      // Update FireStoreDocuments.
      _fireStoreInterface.updateFirestoreDocuments(response.data);
    }
    process = Process.stop(response);
    return response.success;
  }

  Future<bool> logOut() async {
    process = Process.start();
    APIResponse response = await ApiInterface.logOut(deviceID!);
    process = Process.stop(response);
    return response.success;
  }

  // Get device id.
  void _getDeviceID() async => deviceID = await PlatformDeviceId.getDeviceId;
}
