import 'package:earth_force_assignment/core/channels/platform_channel_adapter.dart';
import 'package:earth_force_assignment/core/data/datasources/device_info_datasource.dart';
import 'package:earth_force_assignment/core/data/datasources/poi_datasource.dart';
import 'package:earth_force_assignment/core/permission_center/permissions_center.dart';
import 'package:earth_force_assignment/core/permission_center/permissions_center_impl.dart';
import 'package:earth_force_assignment/presentation/repositories/poi_repository.dart';
import 'package:injectable/injectable.dart';

import '../core/location/location_center.dart' show LocationManager, GeoLocationManager;

@module
abstract class AppModule {
  @lazySingleton
  PermissionsCenter permissionsCenter() => PermissionsCenterImpl();

  @lazySingleton
  LocationManager locationCenter() => GeoLocationManager();

  @lazySingleton
  PoiRepository bindPoiRepository(PoiRepositoryImpl impl) => impl;

  @lazySingleton
  PoiLocalDatasource bindPoiDatasource(PoiLocalDatasourceImpl impl) => impl;

  @lazySingleton
  PlatformChannelAdapter bindPlatformChannelAdapter() => ChannelAdapterImpl();

  @lazySingleton
  DeviceInfoDatasource bindDeviceInfoDatasource(PlatformDeviceInfoDatasource impl) => impl;

}