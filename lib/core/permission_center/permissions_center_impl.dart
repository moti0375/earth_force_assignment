import 'package:earth_force_assignment/core/permission_center/permissions_center.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsCenterImpl implements PermissionsCenter{
  @override
  Future<bool> requestLocationPermissions() async {
    print("_requestLocationPermissions: ");
    bool isShown = await Permission.location.shouldShowRequestRationale;
    print("location granted: isShown: $isShown");
    var locationGranted = await Permission.location.request().isGranted;
    print("location granted: $locationGranted");
    return locationGranted;
  }

  @override
  Future<bool> checkLocationPermissions() async {
    return Permission.location.isGranted;
  }
}