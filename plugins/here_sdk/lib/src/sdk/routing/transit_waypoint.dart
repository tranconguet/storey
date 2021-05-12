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

import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a transit waypoint, used as input for transit route calculation.

class TransitWaypoint {
  /// The waypoint's geographic coordinates.
  GeoCoordinates coordinates;

  /// This parameter can be used to customize the name of the origin place and will
  /// affect the generated actions descriptions.
  String placeName;


  TransitWaypoint(this.coordinates, this.placeName);


  TransitWaypoint.withDefaults(GeoCoordinates coordinates)
    : coordinates = coordinates, placeName = null;

}


// TransitWaypoint "private" section, not exported.

final _sdk_routing_TransitWaypoint_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_create_handle'));
final _sdk_routing_TransitWaypoint_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_release_handle'));
final _sdk_routing_TransitWaypoint_get_field_coordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_get_field_coordinates'));
final _sdk_routing_TransitWaypoint_get_field_placeName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_get_field_placeName'));

Pointer<Void> sdk_routing_TransitWaypoint_toFfi(TransitWaypoint value) {
  final _coordinates_handle = sdk_core_GeoCoordinates_toFfi(value.coordinates);
  final _placeName_handle = String_toFfi_nullable(value.placeName);
  final _result = _sdk_routing_TransitWaypoint_create_handle(_coordinates_handle, _placeName_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
  String_releaseFfiHandle_nullable(_placeName_handle);
  return _result;
}

TransitWaypoint sdk_routing_TransitWaypoint_fromFfi(Pointer<Void> handle) {
  final _coordinates_handle = _sdk_routing_TransitWaypoint_get_field_coordinates(handle);
  final _placeName_handle = _sdk_routing_TransitWaypoint_get_field_placeName(handle);
  try {
    return TransitWaypoint(
      sdk_core_GeoCoordinates_fromFfi(_coordinates_handle), 
      String_fromFfi_nullable(_placeName_handle)
    );
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
    String_releaseFfiHandle_nullable(_placeName_handle);
  }
}

void sdk_routing_TransitWaypoint_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TransitWaypoint_release_handle(handle);

// Nullable TransitWaypoint

final _sdk_routing_TransitWaypoint_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_create_handle_nullable'));
final _sdk_routing_TransitWaypoint_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_release_handle_nullable'));
final _sdk_routing_TransitWaypoint_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitWaypoint_get_value_nullable'));

Pointer<Void> sdk_routing_TransitWaypoint_toFfi_nullable(TransitWaypoint value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitWaypoint_toFfi(value);
  final result = _sdk_routing_TransitWaypoint_create_handle_nullable(_handle);
  sdk_routing_TransitWaypoint_releaseFfiHandle(_handle);
  return result;
}

TransitWaypoint sdk_routing_TransitWaypoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitWaypoint_get_value_nullable(handle);
  final result = sdk_routing_TransitWaypoint_fromFfi(_handle);
  sdk_routing_TransitWaypoint_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitWaypoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitWaypoint_release_handle_nullable(handle);

// End of TransitWaypoint "private" section.

