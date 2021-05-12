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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';
import 'package:here_sdk/src/sdk/routing/transit_mode.dart';
import 'package:here_sdk/src/sdk/routing/transit_mode_filter.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// All the options to specify how a public transit route should be calculated.

class TransitRouteOptions {
  /// Optional time when travel is expected to start.
  /// If it is not specified, it is set to the current time.
  DateTime departureTime;

  /// Optional time when travel is expected to end.
  DateTime arrivalTime;

  /// Number of alternative routes to return aside from the optimal route.
  /// The provided value must be in the range \[0, 6\].
  /// By default, it is 0 and only one route is calculated.
  int alternatives;

  /// Maximum number of changes or transfers allowed in a route.
  /// When it is not set, unlimited number of changes is permitted.
  /// The provided value must be in the range \[0, 6\].
  int changes;

  /// Defines inclusion or exclusion of transit modes for route calculation.
  /// By default, the inclusion mode is used.
  TransitModeFilter modeFilter;

  /// This list is used to determine which transit modes should be used for route calculation,
  /// [TransitRouteOptions.modeFilter] specifies whether this list is an inclusion or an exclusion.
  /// For example, specifying subway and bus transit modes with the include filter, returns only subway
  /// and bus transit modes, and with the exclude filter, returns all the transit modes except subway
  /// and bus. When not set, all the supported transit modes are permitted.
  /// By default, this list is empty.
  List<TransitMode> modes;

  /// Walking speed in meters per second. Influences the duration of walking segments from origin to a station,
  /// from a station to destination and in-between the stations (e.g. if transfer is needed).
  /// The provided value must be in the range \[0.5, 2.0\].
  /// The default value is 1.0 mps.
  double pedestrianSpeedInMetersPerSecond;

  /// Maximum allowed walking distance in meters (e.g. when looking for nearest stations).
  /// The provided value must be in the range \[0, 6000\].
  /// The default value is 2000 meters.
  int pedestrianMaxDistanceInMeters;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;


  TransitRouteOptions(this.departureTime, this.arrivalTime, this.alternatives, this.changes, this.modeFilter, this.modes, this.pedestrianSpeedInMetersPerSecond, this.pedestrianMaxDistanceInMeters, this.textOptions);


  TransitRouteOptions.withDefaults()
    : departureTime = null, arrivalTime = null, alternatives = 0, changes = null, modeFilter = TransitModeFilter.include, modes = [], pedestrianSpeedInMetersPerSecond = 1.0, pedestrianMaxDistanceInMeters = 2000, textOptions = RouteTextOptions.withDefaults();

}


// TransitRouteOptions "private" section, not exported.

final _sdk_routing_TransitRouteOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Int32, Pointer<Void>, Uint32, Pointer<Void>, Double, Int32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, Pointer<Void>, int, Pointer<Void>, double, int, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_create_handle'));
final _sdk_routing_TransitRouteOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_release_handle'));
final _sdk_routing_TransitRouteOptions_get_field_departureTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_departureTime'));
final _sdk_routing_TransitRouteOptions_get_field_arrivalTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_arrivalTime'));
final _sdk_routing_TransitRouteOptions_get_field_alternatives = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_alternatives'));
final _sdk_routing_TransitRouteOptions_get_field_changes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_changes'));
final _sdk_routing_TransitRouteOptions_get_field_modeFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_modeFilter'));
final _sdk_routing_TransitRouteOptions_get_field_modes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_modes'));
final _sdk_routing_TransitRouteOptions_get_field_pedestrianSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_pedestrianSpeedInMetersPerSecond'));
final _sdk_routing_TransitRouteOptions_get_field_pedestrianMaxDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_pedestrianMaxDistanceInMeters'));
final _sdk_routing_TransitRouteOptions_get_field_textOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_textOptions'));

Pointer<Void> sdk_routing_TransitRouteOptions_toFfi(TransitRouteOptions value) {
  final _departureTime_handle = Date_toFfi_nullable(value.departureTime);
  final _arrivalTime_handle = Date_toFfi_nullable(value.arrivalTime);
  final _alternatives_handle = (value.alternatives);
  final _changes_handle = Int_toFfi_nullable(value.changes);
  final _modeFilter_handle = sdk_routing_TransitModeFilter_toFfi(value.modeFilter);
  final _modes_handle = heresdk_routing_transit_bindings_ListOf_sdk_routing_TransitMode_toFfi(value.modes);
  final _pedestrianSpeedInMetersPerSecond_handle = (value.pedestrianSpeedInMetersPerSecond);
  final _pedestrianMaxDistanceInMeters_handle = (value.pedestrianMaxDistanceInMeters);
  final _textOptions_handle = sdk_routing_RouteTextOptions_toFfi(value.textOptions);
  final _result = _sdk_routing_TransitRouteOptions_create_handle(_departureTime_handle, _arrivalTime_handle, _alternatives_handle, _changes_handle, _modeFilter_handle, _modes_handle, _pedestrianSpeedInMetersPerSecond_handle, _pedestrianMaxDistanceInMeters_handle, _textOptions_handle);
  Date_releaseFfiHandle_nullable(_departureTime_handle);
  Date_releaseFfiHandle_nullable(_arrivalTime_handle);
  (_alternatives_handle);
  Int_releaseFfiHandle_nullable(_changes_handle);
  sdk_routing_TransitModeFilter_releaseFfiHandle(_modeFilter_handle);
  heresdk_routing_transit_bindings_ListOf_sdk_routing_TransitMode_releaseFfiHandle(_modes_handle);
  (_pedestrianSpeedInMetersPerSecond_handle);
  (_pedestrianMaxDistanceInMeters_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
  return _result;
}

TransitRouteOptions sdk_routing_TransitRouteOptions_fromFfi(Pointer<Void> handle) {
  final _departureTime_handle = _sdk_routing_TransitRouteOptions_get_field_departureTime(handle);
  final _arrivalTime_handle = _sdk_routing_TransitRouteOptions_get_field_arrivalTime(handle);
  final _alternatives_handle = _sdk_routing_TransitRouteOptions_get_field_alternatives(handle);
  final _changes_handle = _sdk_routing_TransitRouteOptions_get_field_changes(handle);
  final _modeFilter_handle = _sdk_routing_TransitRouteOptions_get_field_modeFilter(handle);
  final _modes_handle = _sdk_routing_TransitRouteOptions_get_field_modes(handle);
  final _pedestrianSpeedInMetersPerSecond_handle = _sdk_routing_TransitRouteOptions_get_field_pedestrianSpeedInMetersPerSecond(handle);
  final _pedestrianMaxDistanceInMeters_handle = _sdk_routing_TransitRouteOptions_get_field_pedestrianMaxDistanceInMeters(handle);
  final _textOptions_handle = _sdk_routing_TransitRouteOptions_get_field_textOptions(handle);
  try {
    return TransitRouteOptions(
      Date_fromFfi_nullable(_departureTime_handle), 
      Date_fromFfi_nullable(_arrivalTime_handle), 
      (_alternatives_handle), 
      Int_fromFfi_nullable(_changes_handle), 
      sdk_routing_TransitModeFilter_fromFfi(_modeFilter_handle), 
      heresdk_routing_transit_bindings_ListOf_sdk_routing_TransitMode_fromFfi(_modes_handle), 
      (_pedestrianSpeedInMetersPerSecond_handle), 
      (_pedestrianMaxDistanceInMeters_handle), 
      sdk_routing_RouteTextOptions_fromFfi(_textOptions_handle)
    );
  } finally {
    Date_releaseFfiHandle_nullable(_departureTime_handle);
    Date_releaseFfiHandle_nullable(_arrivalTime_handle);
    (_alternatives_handle);
    Int_releaseFfiHandle_nullable(_changes_handle);
    sdk_routing_TransitModeFilter_releaseFfiHandle(_modeFilter_handle);
    heresdk_routing_transit_bindings_ListOf_sdk_routing_TransitMode_releaseFfiHandle(_modes_handle);
    (_pedestrianSpeedInMetersPerSecond_handle);
    (_pedestrianMaxDistanceInMeters_handle);
    sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
  }
}

void sdk_routing_TransitRouteOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TransitRouteOptions_release_handle(handle);

// Nullable TransitRouteOptions

final _sdk_routing_TransitRouteOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_create_handle_nullable'));
final _sdk_routing_TransitRouteOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_release_handle_nullable'));
final _sdk_routing_TransitRouteOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_value_nullable'));

Pointer<Void> sdk_routing_TransitRouteOptions_toFfi_nullable(TransitRouteOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitRouteOptions_toFfi(value);
  final result = _sdk_routing_TransitRouteOptions_create_handle_nullable(_handle);
  sdk_routing_TransitRouteOptions_releaseFfiHandle(_handle);
  return result;
}

TransitRouteOptions sdk_routing_TransitRouteOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitRouteOptions_get_value_nullable(handle);
  final result = sdk_routing_TransitRouteOptions_fromFfi(_handle);
  sdk_routing_TransitRouteOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitRouteOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitRouteOptions_release_handle_nullable(handle);

// End of TransitRouteOptions "private" section.

