// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomePageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageState()';
}


}

/// @nodoc
class $HomePageStateCopyWith<$Res>  {
$HomePageStateCopyWith(HomePageState _, $Res Function(HomePageState) __);
}


/// Adds pattern-matching-related methods to [HomePageState].
extension HomePageStatePatterns on HomePageState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialState value)?  initialState,TResult Function( NoLocationPermissions value)?  noLocationPermissions,TResult Function( LocationPermissionsGranted value)?  locationPermissionsGranted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialState() when initialState != null:
return initialState(_that);case NoLocationPermissions() when noLocationPermissions != null:
return noLocationPermissions(_that);case LocationPermissionsGranted() when locationPermissionsGranted != null:
return locationPermissionsGranted(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialState value)  initialState,required TResult Function( NoLocationPermissions value)  noLocationPermissions,required TResult Function( LocationPermissionsGranted value)  locationPermissionsGranted,}){
final _that = this;
switch (_that) {
case InitialState():
return initialState(_that);case NoLocationPermissions():
return noLocationPermissions(_that);case LocationPermissionsGranted():
return locationPermissionsGranted(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialState value)?  initialState,TResult? Function( NoLocationPermissions value)?  noLocationPermissions,TResult? Function( LocationPermissionsGranted value)?  locationPermissionsGranted,}){
final _that = this;
switch (_that) {
case InitialState() when initialState != null:
return initialState(_that);case NoLocationPermissions() when noLocationPermissions != null:
return noLocationPermissions(_that);case LocationPermissionsGranted() when locationPermissionsGranted != null:
return locationPermissionsGranted(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialState,TResult Function()?  noLocationPermissions,TResult Function()?  locationPermissionsGranted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialState() when initialState != null:
return initialState();case NoLocationPermissions() when noLocationPermissions != null:
return noLocationPermissions();case LocationPermissionsGranted() when locationPermissionsGranted != null:
return locationPermissionsGranted();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialState,required TResult Function()  noLocationPermissions,required TResult Function()  locationPermissionsGranted,}) {final _that = this;
switch (_that) {
case InitialState():
return initialState();case NoLocationPermissions():
return noLocationPermissions();case LocationPermissionsGranted():
return locationPermissionsGranted();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialState,TResult? Function()?  noLocationPermissions,TResult? Function()?  locationPermissionsGranted,}) {final _that = this;
switch (_that) {
case InitialState() when initialState != null:
return initialState();case NoLocationPermissions() when noLocationPermissions != null:
return noLocationPermissions();case LocationPermissionsGranted() when locationPermissionsGranted != null:
return locationPermissionsGranted();case _:
  return null;

}
}

}

/// @nodoc


class InitialState implements HomePageState {
  const InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageState.initialState()';
}


}




/// @nodoc


class NoLocationPermissions implements HomePageState {
  const NoLocationPermissions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoLocationPermissions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageState.noLocationPermissions()';
}


}




/// @nodoc


class LocationPermissionsGranted implements HomePageState {
  const LocationPermissionsGranted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPermissionsGranted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageState.locationPermissionsGranted()';
}


}




// dart format on
