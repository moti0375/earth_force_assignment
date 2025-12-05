import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initialState() = InitialState;
  const factory HomePageState.noLocationPermissions() = NoLocationPermissions;
  const factory HomePageState.locationPermissionsGranted() = LocationPermissionsGranted;



}