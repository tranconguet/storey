// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Provides a mechanism for observing a lifecycle of a map view and/or implementing components
/// whose lifecycle needs to be linked with that of a map view.
abstract class MapViewLifecycleListener {
  MapViewLifecycleListener() {}

  factory MapViewLifecycleListener.fromLambdas({
    @required void Function(MapViewBase) lambda_onAttach,
    @required void Function(MapViewBase) lambda_onDetach,
    @required void Function() lambda_onPause,
    @required void Function() lambda_onResume,
    @required void Function() lambda_onDestroy
  }) => MapViewLifecycleListener$Lambdas(
    lambda_onAttach,
    lambda_onDetach,
    lambda_onPause,
    lambda_onResume,
    lambda_onDestroy
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when adding [MapViewLifecycleListener] to the map view.
  ///
  /// Can be used to implement
  /// the logic to create and add visual components to the map view.
  ///
  /// param[MapViewLifecycleListener.onAttach.mapView] The map view to attach to.
  ///
  onAttach(MapViewBase mapView);
  /// Called when removing [MapViewLifecycleListener] from the map view.
  ///
  /// Can be used to implement
  /// the logic to remove visual components from the map view and release resources if necessary.
  ///
  /// param[MapViewLifecycleListener.onDetach.mapView] The map view to detach from.
  ///
  onDetach(MapViewBase mapView);
  /// Called when the map view to which this [MapViewLifecycleListener] is attached to gets paused
  /// (usually when the app goes into background).
  ///
  /// This should be used by components that
  /// perform continuous updates to pause those updates until [MapViewLifecycleListener.onResume]
  /// is called.
  ///
  onPause();
  /// Called when the map view to which this [MapViewLifecycleListener] is attached to gets resumed
  /// (usually when the app goes into foreground).
  ///
  /// This should be used by components that
  /// perform continuous updates to resume those updates after a previous call to
  /// [MapViewLifecycleListener.onPause].
  ///
  onResume();
  /// Called when the map view to which this is attached to is destroyed.
  ///
  /// After this is called, no other [MapViewLifecycleListener] method will be invoked.
  /// This should be used to make sure all resources are freed.
  ///
  onDestroy();
}


// MapViewLifecycleListener "private" section, not exported.

final _sdk_mapview_MapViewLifecycleListener_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_copy_handle'));
final _sdk_mapview_MapViewLifecycleListener_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_release_handle'));
final _sdk_mapview_MapViewLifecycleListener_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_create_proxy'));
final _sdk_mapview_MapViewLifecycleListener_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_get_type_id'));






class MapViewLifecycleListener$Lambdas implements MapViewLifecycleListener {
  void Function(MapViewBase) lambda_onAttach;
  void Function(MapViewBase) lambda_onDetach;
  void Function() lambda_onPause;
  void Function() lambda_onResume;
  void Function() lambda_onDestroy;

  MapViewLifecycleListener$Lambdas(
    this.lambda_onAttach,
    this.lambda_onDetach,
    this.lambda_onPause,
    this.lambda_onResume,
    this.lambda_onDestroy
  );

  @override
  void release() {}

  @override
  onAttach(MapViewBase mapView) =>
    lambda_onAttach(mapView);
  @override
  onDetach(MapViewBase mapView) =>
    lambda_onDetach(mapView);
  @override
  onPause() =>
    lambda_onPause();
  @override
  onResume() =>
    lambda_onResume();
  @override
  onDestroy() =>
    lambda_onDestroy();
}

class MapViewLifecycleListener$Impl implements MapViewLifecycleListener {
  Pointer<Void> handle;
  MapViewLifecycleListener$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _sdk_mapview_MapViewLifecycleListener_release_handle(handle);
    handle = null;
  }

  @override
  onAttach(MapViewBase mapView) {
    final _onAttach_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onAttach__MapViewBase'));
    final _mapView_handle = sdk_mapview_MapViewBase_toFfi(mapView);
    final _handle = this.handle;
    final __result_handle = _onAttach_ffi(_handle, __lib.LibraryContext.isolateId, _mapView_handle);
    sdk_mapview_MapViewBase_releaseFfiHandle(_mapView_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  onDetach(MapViewBase mapView) {
    final _onDetach_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onDetach__MapViewBase'));
    final _mapView_handle = sdk_mapview_MapViewBase_toFfi(mapView);
    final _handle = this.handle;
    final __result_handle = _onDetach_ffi(_handle, __lib.LibraryContext.isolateId, _mapView_handle);
    sdk_mapview_MapViewBase_releaseFfiHandle(_mapView_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  onPause() {
    final _onPause_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onPause'));
    final _handle = this.handle;
    final __result_handle = _onPause_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  onResume() {
    final _onResume_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onResume'));
    final _handle = this.handle;
    final __result_handle = _onResume_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  onDestroy() {
    final _onDestroy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onDestroy'));
    final _handle = this.handle;
    final __result_handle = _onDestroy_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _MapViewLifecycleListener_onAttach_static(int _token, Pointer<Void> mapView) {

  try {
    (__lib.instanceCache[_token] as MapViewLifecycleListener).onAttach(sdk_mapview_MapViewBase_fromFfi(mapView));
  } finally {
    sdk_mapview_MapViewBase_releaseFfiHandle(mapView);
  }
  return 0;
}
int _MapViewLifecycleListener_onDetach_static(int _token, Pointer<Void> mapView) {

  try {
    (__lib.instanceCache[_token] as MapViewLifecycleListener).onDetach(sdk_mapview_MapViewBase_fromFfi(mapView));
  } finally {
    sdk_mapview_MapViewBase_releaseFfiHandle(mapView);
  }
  return 0;
}
int _MapViewLifecycleListener_onPause_static(int _token) {

  try {
    (__lib.instanceCache[_token] as MapViewLifecycleListener).onPause();
  } finally {
  }
  return 0;
}
int _MapViewLifecycleListener_onResume_static(int _token) {

  try {
    (__lib.instanceCache[_token] as MapViewLifecycleListener).onResume();
  } finally {
  }
  return 0;
}
int _MapViewLifecycleListener_onDestroy_static(int _token) {

  try {
    (__lib.instanceCache[_token] as MapViewLifecycleListener).onDestroy();
  } finally {
  }
  return 0;
}


Pointer<Void> sdk_mapview_MapViewLifecycleListener_toFfi(MapViewLifecycleListener value) {
  if (value is MapViewLifecycleListener$Impl) return _sdk_mapview_MapViewLifecycleListener_copy_handle(value.handle);

  final result = _sdk_mapview_MapViewLifecycleListener_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_MapViewLifecycleListener_onAttach_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_MapViewLifecycleListener_onDetach_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_MapViewLifecycleListener_onPause_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_MapViewLifecycleListener_onResume_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_MapViewLifecycleListener_onDestroy_static, __lib.unknownError)
  );

  return result;
}

MapViewLifecycleListener sdk_mapview_MapViewLifecycleListener_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapViewLifecycleListener;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_mapview_MapViewLifecycleListener_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_mapview_MapViewLifecycleListener_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : MapViewLifecycleListener$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdk_mapview_MapViewLifecycleListener_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapViewLifecycleListener_release_handle(handle);

Pointer<Void> sdk_mapview_MapViewLifecycleListener_toFfi_nullable(MapViewLifecycleListener value) =>
  value != null ? sdk_mapview_MapViewLifecycleListener_toFfi(value) : Pointer<Void>.fromAddress(0);

MapViewLifecycleListener sdk_mapview_MapViewLifecycleListener_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapViewLifecycleListener_fromFfi(handle) : null;

void sdk_mapview_MapViewLifecycleListener_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapViewLifecycleListener_release_handle(handle);

// End of MapViewLifecycleListener "private" section.

