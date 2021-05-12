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
import 'package:here_sdk/src/sdk/routing/indoor_level_change_action_internal.dart';
import 'package:here_sdk/src/sdk/routing/indoor_location_data_internal.dart';
import 'package:here_sdk/src/sdk/routing/indoor_space_action_internal.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// @nodoc
abstract class IndoorManeuverInternal {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// @nodoc
  IndoorLocationDataInternal get internalindoorLocation;





  /// @nodoc
  IndoorLevelChangeActionInternal get internallevelChangeAction;





  /// @nodoc
  IndoorSpaceActionInternal get internalleaveAction;





  /// @nodoc
  IndoorSpaceActionInternal get internalenterAction;



}


// IndoorManeuverInternal "private" section, not exported.

final _sdk_routing_IndoorManeuverInternal_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorManeuverInternal_copy_handle'));
final _sdk_routing_IndoorManeuverInternal_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorManeuverInternal_release_handle'));

class IndoorManeuverInternal$Impl implements IndoorManeuverInternal {
  @protected
  Pointer<Void> handle;

  IndoorManeuverInternal$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _sdk_routing_IndoorManeuverInternal_release_handle(handle);
    handle = null;
  }

  @override
  IndoorLocationDataInternal get internalindoorLocation {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorManeuverInternal_indoorLocation_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_IndoorLocationDataInternal_fromFfi(__result_handle);
    } finally {
      sdk_routing_IndoorLocationDataInternal_releaseFfiHandle(__result_handle);
    }
  }


  @override
  IndoorLevelChangeActionInternal get internallevelChangeAction {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorManeuverInternal_levelChangeAction_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_IndoorLevelChangeActionInternal_fromFfi_nullable(__result_handle);
    } finally {
      sdk_routing_IndoorLevelChangeActionInternal_releaseFfiHandle_nullable(__result_handle);
    }
  }


  @override
  IndoorSpaceActionInternal get internalleaveAction {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorManeuverInternal_leaveAction_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_IndoorSpaceActionInternal_fromFfi_nullable(__result_handle);
    } finally {
      sdk_routing_IndoorSpaceActionInternal_releaseFfiHandle_nullable(__result_handle);
    }
  }


  @override
  IndoorSpaceActionInternal get internalenterAction {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_IndoorManeuverInternal_enterAction_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_IndoorSpaceActionInternal_fromFfi_nullable(__result_handle);
    } finally {
      sdk_routing_IndoorSpaceActionInternal_releaseFfiHandle_nullable(__result_handle);
    }
  }



}

Pointer<Void> sdk_routing_IndoorManeuverInternal_toFfi(IndoorManeuverInternal value) =>
  _sdk_routing_IndoorManeuverInternal_copy_handle((value as IndoorManeuverInternal$Impl).handle);

IndoorManeuverInternal sdk_routing_IndoorManeuverInternal_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as IndoorManeuverInternal;
  if (instance != null) return instance;

  final _copied_handle = _sdk_routing_IndoorManeuverInternal_copy_handle(handle);
  final result = IndoorManeuverInternal$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdk_routing_IndoorManeuverInternal_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_routing_IndoorManeuverInternal_release_handle(handle);

Pointer<Void> sdk_routing_IndoorManeuverInternal_toFfi_nullable(IndoorManeuverInternal value) =>
  value != null ? sdk_routing_IndoorManeuverInternal_toFfi(value) : Pointer<Void>.fromAddress(0);

IndoorManeuverInternal sdk_routing_IndoorManeuverInternal_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_routing_IndoorManeuverInternal_fromFfi(handle) : null;

void sdk_routing_IndoorManeuverInternal_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_IndoorManeuverInternal_release_handle(handle);

// End of IndoorManeuverInternal "private" section.

