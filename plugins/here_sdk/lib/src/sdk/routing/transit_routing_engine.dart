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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/routing/calculate_route_callback.dart';
import 'package:here_sdk/src/sdk/routing/transit_route_options.dart';
import 'package:here_sdk/src/sdk/routing/transit_waypoint.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Use the TransitRoutingEngine to calculate a public transit route from A to B with
/// a number of waypoints in between.
///
/// Route calculation is done asynchronously and requires an
/// online connection. The resulting route contains various
/// information such as the polyline, route length in meters,
/// estimated time to traverse along the route and maneuver data.
abstract class TransitRoutingEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory TransitRoutingEngine() => TransitRoutingEngine$Impl.$init();
  /// Creates a new instance of TransitRoutingEngine.
  ///
  /// [sdkEngine] An SDKEngine instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory TransitRoutingEngine.withSdkEngine(SDKNativeEngine sdkEngine) => TransitRoutingEngine$Impl.withSdkEngine(sdkEngine);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Asynchronously calculates a public transit route from the origin to the destination.
  ///
  /// [startingPoint] Position of starting point.
  ///
  /// [destination] Position of destination.
  ///
  /// [routeOptions] Options for public transit route calculation.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  calculateRoute(TransitWaypoint startingPoint, TransitWaypoint destination, TransitRouteOptions routeOptions, CalculateRouteCallback callback);
}


// TransitRoutingEngine "private" section, not exported.

final _sdk_routing_TransitRoutingEngine_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_copy_handle'));
final _sdk_routing_TransitRoutingEngine_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_release_handle'));

final _$init_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make_return_release_handle'));
final _$init_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make_return_get_result'));
final _$init_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make_return_get_error'));
final _$init_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make_return_has_error'));


final _withSdkEngine_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngine_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEngine_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEngine_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine_return_has_error'));



class TransitRoutingEngine$Impl implements TransitRoutingEngine {
  @protected
  Pointer<Void> handle;

  TransitRoutingEngine$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _sdk_routing_TransitRoutingEngine_release_handle(handle);
    handle = null;
  }


  TransitRoutingEngine$Impl.$init() : handle = _$init() {
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  TransitRoutingEngine$Impl.withSdkEngine(SDKNativeEngine sdkEngine) : handle = _withSdkEngine(sdkEngine) {
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }

  static Pointer<Void> _$init() {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_routing_TransitRoutingEngine_make'));
    final __call_result_handle = _$init_ffi(__lib.LibraryContext.isolateId);
    if (_$init_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _$init_return_get_error(__call_result_handle);
        _$init_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _$init_return_get_result(__call_result_handle);
    _$init_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngine_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_TransitRoutingEngine_make__SDKNativeEngine'));
    final _sdkEngine_handle = sdk_core_engine_SDKNativeEngine_toFfi(sdkEngine);
    final __call_result_handle = _withSdkEngine_ffi(__lib.LibraryContext.isolateId, _sdkEngine_handle);
    sdk_core_engine_SDKNativeEngine_releaseFfiHandle(_sdkEngine_handle);
    if (_withSdkEngine_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _withSdkEngine_return_get_error(__call_result_handle);
        _withSdkEngine_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _withSdkEngine_return_get_result(__call_result_handle);
    _withSdkEngine_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  @override
  calculateRoute(TransitWaypoint startingPoint, TransitWaypoint destination, TransitRouteOptions routeOptions, CalculateRouteCallback callback) {
    final _calculateRoute_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_TransitRoutingEngine_calculateRoute__TransitWaypoint_TransitWaypoint_TransitRouteOptions_CalculateRouteCallback'));
    final _startingPoint_handle = sdk_routing_TransitWaypoint_toFfi(startingPoint);
    final _destination_handle = sdk_routing_TransitWaypoint_toFfi(destination);
    final _routeOptions_handle = sdk_routing_TransitRouteOptions_toFfi(routeOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateRoute_ffi(_handle, __lib.LibraryContext.isolateId, _startingPoint_handle, _destination_handle, _routeOptions_handle, _callback_handle);
    sdk_routing_TransitWaypoint_releaseFfiHandle(_startingPoint_handle);
    sdk_routing_TransitWaypoint_releaseFfiHandle(_destination_handle);
    sdk_routing_TransitRouteOptions_releaseFfiHandle(_routeOptions_handle);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

Pointer<Void> sdk_routing_TransitRoutingEngine_toFfi(TransitRoutingEngine value) =>
  _sdk_routing_TransitRoutingEngine_copy_handle((value as TransitRoutingEngine$Impl).handle);

TransitRoutingEngine sdk_routing_TransitRoutingEngine_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as TransitRoutingEngine;
  if (instance != null) return instance;

  final _copied_handle = _sdk_routing_TransitRoutingEngine_copy_handle(handle);
  final result = TransitRoutingEngine$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdk_routing_TransitRoutingEngine_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_routing_TransitRoutingEngine_release_handle(handle);

Pointer<Void> sdk_routing_TransitRoutingEngine_toFfi_nullable(TransitRoutingEngine value) =>
  value != null ? sdk_routing_TransitRoutingEngine_toFfi(value) : Pointer<Void>.fromAddress(0);

TransitRoutingEngine sdk_routing_TransitRoutingEngine_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_routing_TransitRoutingEngine_fromFfi(handle) : null;

void sdk_routing_TransitRoutingEngine_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitRoutingEngine_release_handle(handle);

// End of TransitRoutingEngine "private" section.

