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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/indoor_location_data_internal.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// @nodoc
abstract class IndoorLevelSubsection {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// @nodoc
  List<GeoCoordinates> get internalpolyline;





  /// @nodoc
  IndoorLocationDataInternal get internalindoorLocation;





  /// @nodoc
  List<Maneuver> get internalmaneuvers;



}


// IndoorLevelSubsection "private" section, not exported.

final _sdk_routing_IndoorLevelSubsection_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelSubsection_copy_handle'));
final _sdk_routing_IndoorLevelSubsection_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelSubsection_release_handle'));

class IndoorLevelSubsection$Impl implements IndoorLevelSubsection {
  @protected
  Pointer<Void> handle;

  IndoorLevelSubsection$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _sdk_routing_IndoorLevelSubsection_release_handle(handle);
    handle = null;
  }


  List<GeoCoordinates> _cache_polyline;
  bool _is_cached_polyline = false;
  @override

  List<GeoCoordinates> get internalpolyline {
    if (!_is_cached_polyline) {
      final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_polyline_get'));
      final __result_handle = _get_ffi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _cache_polyline = heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(__result_handle);
      } finally {
        heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
      }
      _is_cached_polyline = true;
    }
    return _cache_polyline;
  }

  @override
  IndoorLocationDataInternal get internalindoorLocation {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_indoorLocation_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_IndoorLocationDataInternal_fromFfi(__result_handle);
    } finally {
      sdk_routing_IndoorLocationDataInternal_releaseFfiHandle(__result_handle);
    }
  }



  List<Maneuver> _cache_maneuvers;
  bool _is_cached_maneuvers = false;
  @override

  List<Maneuver> get internalmaneuvers {
    if (!_is_cached_maneuvers) {
      final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorLevelSubsection_maneuvers_get'));
      final __result_handle = _get_ffi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _cache_maneuvers = heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_fromFfi(__result_handle);
      } finally {
        heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle(__result_handle);
      }
      _is_cached_maneuvers = true;
    }
    return _cache_maneuvers;
  }


}

Pointer<Void> sdk_routing_IndoorLevelSubsection_toFfi(IndoorLevelSubsection value) =>
  _sdk_routing_IndoorLevelSubsection_copy_handle((value as IndoorLevelSubsection$Impl).handle);

IndoorLevelSubsection sdk_routing_IndoorLevelSubsection_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as IndoorLevelSubsection;
  if (instance != null) return instance;

  final _copied_handle = _sdk_routing_IndoorLevelSubsection_copy_handle(handle);
  final result = IndoorLevelSubsection$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdk_routing_IndoorLevelSubsection_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_routing_IndoorLevelSubsection_release_handle(handle);

Pointer<Void> sdk_routing_IndoorLevelSubsection_toFfi_nullable(IndoorLevelSubsection value) =>
  value != null ? sdk_routing_IndoorLevelSubsection_toFfi(value) : Pointer<Void>.fromAddress(0);

IndoorLevelSubsection sdk_routing_IndoorLevelSubsection_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_routing_IndoorLevelSubsection_fromFfi(handle) : null;

void sdk_routing_IndoorLevelSubsection_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_IndoorLevelSubsection_release_handle(handle);

// End of IndoorLevelSubsection "private" section.

