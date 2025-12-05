import 'package:earth_force_assignment/core/permission_center/permissions_center.dart';
import 'package:earth_force_assignment/presentation/pages/tabs_main/bloc/home_page_state.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState>{

  final PermissionsCenter _permissionsCenter;

  HomePageCubit(this._permissionsCenter) : super(const HomePageState.initialState()){
    print("HomePageCubit created");
  }

  Future<void> checkLocationPermissions() async {
    bool permissionGranted = await _permissionsCenter.checkLocationPermissions();
    print("_checkLocationPermissions: $permissionGranted");

    if(permissionGranted){
      emit(const HomePageState.initialState());
    }else{
      emit(const HomePageState.noLocationPermissions());
    }
  }

  Future<void> requestLocationPermission() async {
    bool permissionGranted = await _permissionsCenter.requestLocationPermissions();

  }
}