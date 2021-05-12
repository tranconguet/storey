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
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'location_converter.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Describes a location in the world at a given time.

class Location_internal {
  /// The geographic coordinates of the location.
  GeoCoordinates coordinates;

  /// Bearing (also known as course) is the device's horizontal direction of travel.
  /// Starts at 0 in the geographical north and rotates around the compass in a clockwise
  /// direction. This means for going north it is equal to 0, for northeast it is 45,
  /// for east it is 90 and so on. Note that this may be different from the orientation of
  /// the device. If it cannot be determined, the value is `null`. Otherwise, it is
  /// guaranteed to be in the range \[0, 360).
  double bearingInDegrees;

  /// Current speed of the device. If it cannot be determined, the value is `null`.
  double speedInMetersPerSecond;

  /// The time at which the location was determined.
  DateTime timestamp;

  /// The estimated horizontal accuracy. The actual location will lie within this radius of uncertainty.
  double horizontalAccuracyInMeters;

  /// Estimated vertical accuracy.
  /// Given that the received Location contains the altitude, the real value of the altitude
  /// is estimated to lie within the following range:
  /// \[altitude - vertical accuracy, altitude + vertical accuracy\].
  /// For example, when the altitude is equal to 50 and the vertical accuracy
  /// is 8, then the actual value is most likely in the range \[42, 58\].
  double verticalAccuracyInMeters;

  /// Estimated bearing accuracy for this location, in degrees.
  /// If it cannot be determined, the value is `null`.
  double bearingAccuracyInDegrees;

  /// Estimated speed accuracy of this location, in meters per second.
  /// If it cannot be determined, the value is `null`.
  double speedAccuracyInMetersPerSecond;

  /// The time in milliseconds at which the location was determined, relative to device
  /// boot time. This time is monotonic and not affected by leap time or other system
  /// time adjustments, so this is the recommended basis for general purpose interval timing
  /// between location updates.
  /// If it cannot be determined, the value is `null`.
  int timestampSinceBootInMilliseconds;


  Location_internal(this.coordinates, this.bearingInDegrees, this.speedInMetersPerSecond, this.timestamp, this.horizontalAccuracyInMeters, this.verticalAccuracyInMeters, this.bearingAccuracyInDegrees, this.speedAccuracyInMetersPerSecond, this.timestampSinceBootInMilliseconds);


  Location_internal.withDefaults(GeoCoordinates coordinates, DateTime timestamp)
    : coordinates = coordinates, bearingInDegrees = null, speedInMetersPerSecond = null, timestamp = timestamp, horizontalAccuracyInMeters = null, verticalAccuracyInMeters = null, bearingAccuracyInDegrees = null, speedAccuracyInMetersPerSecond = null, timestampSinceBootInMilliseconds = null;

}


// Location "private" section, not exported.

final _sdk_core_Location_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_Location_create_handle'));
final _sdk_core_Location_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_release_handle'));
final _sdk_core_Location_get_field_coordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_coordinates'));
final _sdk_core_Location_get_field_bearingInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_bearingInDegrees'));
final _sdk_core_Location_get_field_speedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_speedInMetersPerSecond'));
final _sdk_core_Location_get_field_timestamp = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_timestamp'));
final _sdk_core_Location_get_field_horizontalAccuracyInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_horizontalAccuracyInMeters'));
final _sdk_core_Location_get_field_verticalAccuracyInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_verticalAccuracyInMeters'));
final _sdk_core_Location_get_field_bearingAccuracyInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_bearingAccuracyInDegrees'));
final _sdk_core_Location_get_field_speedAccuracyInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_speedAccuracyInMetersPerSecond'));
final _sdk_core_Location_get_field_timestampSinceBootInMilliseconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_timestampSinceBootInMilliseconds'));

Pointer<Void> sdk_core_Location_toFfi(location_impl.Location value_ext) {
  final value = LocationConverter.convertToInternal(value_ext);
  final _coordinates_handle = sdk_core_GeoCoordinates_toFfi(value.coordinates);
  final _bearingInDegrees_handle = Double_toFfi_nullable(value.bearingInDegrees);
  final _speedInMetersPerSecond_handle = Double_toFfi_nullable(value.speedInMetersPerSecond);
  final _timestamp_handle = Date_toFfi(value.timestamp);
  final _horizontalAccuracyInMeters_handle = Double_toFfi_nullable(value.horizontalAccuracyInMeters);
  final _verticalAccuracyInMeters_handle = Double_toFfi_nullable(value.verticalAccuracyInMeters);
  final _bearingAccuracyInDegrees_handle = Double_toFfi_nullable(value.bearingAccuracyInDegrees);
  final _speedAccuracyInMetersPerSecond_handle = Double_toFfi_nullable(value.speedAccuracyInMetersPerSecond);
  final _timestampSinceBootInMilliseconds_handle = Long_toFfi_nullable(value.timestampSinceBootInMilliseconds);
  final _result = _sdk_core_Location_create_handle(_coordinates_handle, _bearingInDegrees_handle, _speedInMetersPerSecond_handle, _timestamp_handle, _horizontalAccuracyInMeters_handle, _verticalAccuracyInMeters_handle, _bearingAccuracyInDegrees_handle, _speedAccuracyInMetersPerSecond_handle, _timestampSinceBootInMilliseconds_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
  Double_releaseFfiHandle_nullable(_bearingInDegrees_handle);
  Double_releaseFfiHandle_nullable(_speedInMetersPerSecond_handle);
  Date_releaseFfiHandle(_timestamp_handle);
  Double_releaseFfiHandle_nullable(_horizontalAccuracyInMeters_handle);
  Double_releaseFfiHandle_nullable(_verticalAccuracyInMeters_handle);
  Double_releaseFfiHandle_nullable(_bearingAccuracyInDegrees_handle);
  Double_releaseFfiHandle_nullable(_speedAccuracyInMetersPerSecond_handle);
  Long_releaseFfiHandle_nullable(_timestampSinceBootInMilliseconds_handle);
  return _result;
}

location_impl.Location sdk_core_Location_fromFfi(Pointer<Void> handle) {
  final _coordinates_handle = _sdk_core_Location_get_field_coordinates(handle);
  final _bearingInDegrees_handle = _sdk_core_Location_get_field_bearingInDegrees(handle);
  final _speedInMetersPerSecond_handle = _sdk_core_Location_get_field_speedInMetersPerSecond(handle);
  final _timestamp_handle = _sdk_core_Location_get_field_timestamp(handle);
  final _horizontalAccuracyInMeters_handle = _sdk_core_Location_get_field_horizontalAccuracyInMeters(handle);
  final _verticalAccuracyInMeters_handle = _sdk_core_Location_get_field_verticalAccuracyInMeters(handle);
  final _bearingAccuracyInDegrees_handle = _sdk_core_Location_get_field_bearingAccuracyInDegrees(handle);
  final _speedAccuracyInMetersPerSecond_handle = _sdk_core_Location_get_field_speedAccuracyInMetersPerSecond(handle);
  final _timestampSinceBootInMilliseconds_handle = _sdk_core_Location_get_field_timestampSinceBootInMilliseconds(handle);
  try {
    final result_internal = Location_internal(
      sdk_core_GeoCoordinates_fromFfi(_coordinates_handle), 
      Double_fromFfi_nullable(_bearingInDegrees_handle), 
      Double_fromFfi_nullable(_speedInMetersPerSecond_handle), 
      Date_fromFfi(_timestamp_handle), 
      Double_fromFfi_nullable(_horizontalAccuracyInMeters_handle), 
      Double_fromFfi_nullable(_verticalAccuracyInMeters_handle), 
      Double_fromFfi_nullable(_bearingAccuracyInDegrees_handle), 
      Double_fromFfi_nullable(_speedAccuracyInMetersPerSecond_handle), 
      Long_fromFfi_nullable(_timestampSinceBootInMilliseconds_handle)
    );
    return LocationConverter.convertFromInternal(result_internal);
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
    Double_releaseFfiHandle_nullable(_bearingInDegrees_handle);
    Double_releaseFfiHandle_nullable(_speedInMetersPerSecond_handle);
    Date_releaseFfiHandle(_timestamp_handle);
    Double_releaseFfiHandle_nullable(_horizontalAccuracyInMeters_handle);
    Double_releaseFfiHandle_nullable(_verticalAccuracyInMeters_handle);
    Double_releaseFfiHandle_nullable(_bearingAccuracyInDegrees_handle);
    Double_releaseFfiHandle_nullable(_speedAccuracyInMetersPerSecond_handle);
    Long_releaseFfiHandle_nullable(_timestampSinceBootInMilliseconds_handle);
  }
}

void sdk_core_Location_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_Location_release_handle(handle);

// Nullable Location

final _sdk_core_Location_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_create_handle_nullable'));
final _sdk_core_Location_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_release_handle_nullable'));
final _sdk_core_Location_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_value_nullable'));

Pointer<Void> sdk_core_Location_toFfi_nullable(location_impl.Location value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_Location_toFfi(value);
  final result = _sdk_core_Location_create_handle_nullable(_handle);
  sdk_core_Location_releaseFfiHandle(_handle);
  return result;
}

location_impl.Location sdk_core_Location_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_Location_get_value_nullable(handle);
  final result = sdk_core_Location_fromFfi(_handle);
  sdk_core_Location_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_Location_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Location_release_handle_nullable(handle);

// End of Location "private" section.

