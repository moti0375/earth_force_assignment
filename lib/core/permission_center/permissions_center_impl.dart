import 'package:earth_force_assignment/core/permission_center/permissions_center.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsCenterImpl implements PermissionsCenter{
  @override
  Future<bool> requestLocationPermissions() async {
    var locationGranted = await Permission.location.request().isGranted;
    return locationGranted;
  }

  @override
  Future<bool> checkLocationPermissions() async {
    return Permission.location.isGranted;
  }
}