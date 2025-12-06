// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/channels/platform_channel_adapter.dart' as _i1024;
import '../core/data/datasources/device_info_datasource.dart' as _i826;
import '../core/data/datasources/poi_datasource.dart' as _i246;
import '../core/location/location_center.dart' as _i190;
import '../core/offline_manager/offline_manager.dart' as _i10;
import '../core/permission_center/permissions_center.dart' as _i106;
import '../core/storage/database/app_database.dart' as _i139;
import '../core/storage/database/daos/poi_dao.dart' as _i436;
import '../presentation/pages/tabs/device_properties/device_properties_notifier.dart'
    as _i898;
import '../presentation/pages/tabs/map/map_tab_store.dart' as _i99;
import '../presentation/pages/tabs_main/bloc/home_page_cubit.dart' as _i123;
import '../presentation/repositories/poi_repository.dart' as _i851;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i139.AppDatabase>(() => _i139.AppDatabase());
    gh.lazySingleton<_i106.PermissionsCenter>(
      () => appModule.permissionsCenter(),
    );
    gh.lazySingleton<_i190.LocationManager>(() => appModule.locationCenter());
    gh.lazySingleton<_i1024.PlatformChannelAdapter>(
      () => appModule.bindPlatformChannelAdapter(),
    );
    gh.factory<_i123.HomePageCubit>(
      () => _i123.HomePageCubit(
        gh<_i106.PermissionsCenter>(),
        gh<_i190.LocationManager>(),
      ),
    );
    gh.factory<_i826.PlatformDeviceInfoDatasource>(
      () => _i826.PlatformDeviceInfoDatasource(
        gh<_i1024.PlatformChannelAdapter>(),
      ),
    );
    gh.lazySingleton<_i826.DeviceInfoDatasource>(
      () => appModule.bindDeviceInfoDatasource(
        gh<_i826.PlatformDeviceInfoDatasource>(),
      ),
    );
    gh.factory<_i436.PoiDao>(() => _i436.PoiDao(gh<_i139.AppDatabase>()));
    gh.factory<_i898.DeviceStatusNotifier>(
      () =>
          _i898.DeviceStatusNotifier(gh<_i826.PlatformDeviceInfoDatasource>()),
    );
    gh.lazySingleton<_i246.PoiLocalDatasourceImpl>(
      () => _i246.PoiLocalDatasourceImpl(gh<_i436.PoiDao>()),
    );
    gh.lazySingleton<_i246.PoiLocalDatasource>(
      () => appModule.bindPoiDatasource(gh<_i246.PoiLocalDatasourceImpl>()),
    );
    gh.lazySingleton<_i851.PoiRepositoryImpl>(
      () => _i851.PoiRepositoryImpl(gh<_i246.PoiLocalDatasource>()),
    );
    gh.lazySingleton<_i851.PoiRepository>(
      () => appModule.bindPoiRepository(gh<_i851.PoiRepositoryImpl>()),
    );
    gh.factory<_i10.OfflineManager>(
      () => _i10.OfflineManager(gh<_i851.PoiRepository>()),
    );
    gh.factory<_i99.MapTabStore>(
      () => _i99.MapTabStore(
        gh<_i190.LocationManager>(),
        gh<_i851.PoiRepository>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
