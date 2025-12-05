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

import '../core/permission_center/permissions_center.dart' as _i106;
import '../presentation/pages/tabs/map/map_tab_store.dart' as _i99;
import '../presentation/pages/tabs_main/bloc/home_page_cubit.dart' as _i123;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i99.MapTabStore>(() => _i99.MapTabStore());
    gh.lazySingleton<_i106.PermissionsCenter>(
        () => appModule.permissionsCenter());
    gh.factory<_i123.HomePageCubit>(
        () => _i123.HomePageCubit(gh<_i106.PermissionsCenter>()));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
