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

import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/builtin_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Provides an internal representation of a [Route] including all parameters such
/// as waypoints, shape and options.
///
/// Note that the [Route.routeHandle] is provided only
/// if [RouteOptions.enableRouteHandle] is set before route calculation. When a route handle
/// object is submitted, its encoded data is accessed in an opaque way.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
/// @nodoc

class RouteHandle {
  /// @nodoc
  String internalencodedData;


  RouteHandle(this.internalencodedData);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! RouteHandle) return false;
    RouteHandle _other = other;
    return internalencodedData == _other.internalencodedData;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalencodedData.hashCode;
    return result;
  }
}


// RouteHandle "private" section, not exported.

final _sdk_routing_RouteHandle_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_create_handle'));
final _sdk_routing_RouteHandle_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_release_handle'));
final _sdk_routing_RouteHandle_get_field_encodedData = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_get_field_encodedData'));

Pointer<Void> sdk_routing_RouteHandle_toFfi(RouteHandle value) {
  final _encodedData_handle = String_toFfi(value.internalencodedData);
  final _result = _sdk_routing_RouteHandle_create_handle(_encodedData_handle);
  String_releaseFfiHandle(_encodedData_handle);
  return _result;
}

RouteHandle sdk_routing_RouteHandle_fromFfi(Pointer<Void> handle) {
  final _encodedData_handle = _sdk_routing_RouteHandle_get_field_encodedData(handle);
  try {
    return RouteHandle(
      String_fromFfi(_encodedData_handle)
    );
  } finally {
    String_releaseFfiHandle(_encodedData_handle);
  }
}

void sdk_routing_RouteHandle_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_RouteHandle_release_handle(handle);

// Nullable RouteHandle

final _sdk_routing_RouteHandle_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_create_handle_nullable'));
final _sdk_routing_RouteHandle_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_release_handle_nullable'));
final _sdk_routing_RouteHandle_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_get_value_nullable'));

Pointer<Void> sdk_routing_RouteHandle_toFfi_nullable(RouteHandle value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RouteHandle_toFfi(value);
  final result = _sdk_routing_RouteHandle_create_handle_nullable(_handle);
  sdk_routing_RouteHandle_releaseFfiHandle(_handle);
  return result;
}

RouteHandle sdk_routing_RouteHandle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RouteHandle_get_value_nullable(handle);
  final result = sdk_routing_RouteHandle_fromFfi(_handle);
  sdk_routing_RouteHandle_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RouteHandle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RouteHandle_release_handle_nullable(handle);

// End of RouteHandle "private" section.

