// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseBlocState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseBlocState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseBlocState<$T>()';
}


}

/// @nodoc
class $BaseBlocStateCopyWith<T,$Res>  {
$BaseBlocStateCopyWith(BaseBlocState<T> _, $Res Function(BaseBlocState<T>) __);
}


/// Adds pattern-matching-related methods to [BaseBlocState].
extension BaseBlocStatePatterns<T> on BaseBlocState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init<T> value)?  init,TResult Function( _Loading<T> value)?  loading,TResult Function( _Next<T> value)?  next,TResult Function( _Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Next() when next != null:
return next(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init<T> value)  init,required TResult Function( _Loading<T> value)  loading,required TResult Function( _Next<T> value)  next,required TResult Function( _Error<T> value)  error,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Loading():
return loading(_that);case _Next():
return next(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init<T> value)?  init,TResult? Function( _Loading<T> value)?  loading,TResult? Function( _Next<T> value)?  next,TResult? Function( _Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Next() when next != null:
return next(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loading,TResult Function( T data)?  next,TResult Function( Error error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Next() when next != null:
return next(_that.data);case _Error() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loading,required TResult Function( T data)  next,required TResult Function( Error error)  error,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Loading():
return loading();case _Next():
return next(_that.data);case _Error():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loading,TResult? Function( T data)?  next,TResult? Function( Error error)?  error,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Next() when next != null:
return next(_that.data);case _Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Init<T> implements BaseBlocState<T> {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseBlocState<$T>.init()';
}


}




/// @nodoc


class _Loading<T> implements BaseBlocState<T> {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseBlocState<$T>.loading()';
}


}




/// @nodoc


class _Next<T> implements BaseBlocState<T> {
  const _Next(this.data);
  

 final  T data;

/// Create a copy of BaseBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextCopyWith<T, _Next<T>> get copyWith => __$NextCopyWithImpl<T, _Next<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Next<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BaseBlocState<$T>.next(data: $data)';
}


}

/// @nodoc
abstract mixin class _$NextCopyWith<T,$Res> implements $BaseBlocStateCopyWith<T, $Res> {
  factory _$NextCopyWith(_Next<T> value, $Res Function(_Next<T>) _then) = __$NextCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class __$NextCopyWithImpl<T,$Res>
    implements _$NextCopyWith<T, $Res> {
  __$NextCopyWithImpl(this._self, this._then);

  final _Next<T> _self;
  final $Res Function(_Next<T>) _then;

/// Create a copy of BaseBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_Next<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _Error<T> implements BaseBlocState<T> {
  const _Error(this.error);
  

 final  Error error;

/// Create a copy of BaseBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, _Error<T>> get copyWith => __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BaseBlocState<$T>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,$Res> implements $BaseBlocStateCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Error error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,$Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

/// Create a copy of BaseBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Error<T>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Error,
  ));
}


}

// dart format on
