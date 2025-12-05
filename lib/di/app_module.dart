import 'package:earth_force_assignment/core/permission_center/permissions_center.dart';
import 'package:earth_force_assignment/core/permission_center/permissions_center_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  PermissionsCenter permissionsCenter() => PermissionsCenterImpl();
}