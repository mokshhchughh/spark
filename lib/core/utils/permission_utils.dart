import 'package:permission_handler/permission_handler.dart';

sealed class PermissionUtils {
  PermissionUtils._();

  Future<bool> getCameraAndMicrophonePermissionStatus() async {
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;

    if (cameraStatus.isGranted && microphoneStatus.isGranted) {
      return true;
    }
    return false;
  }

  Future<bool> askForPermission() async {
    Map<Permission, PermissionStatus> status = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (status[Permission.camera]!.isGranted &&
        status[Permission.microphone]!.isGranted) {
      return true;
    }
    return false;
  }
}
