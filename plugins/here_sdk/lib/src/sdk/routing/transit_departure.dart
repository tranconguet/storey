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
import 'package:here_sdk/src/sdk/routing/route_place.dart';
import 'package:here_sdk/src/sdk/routing/transit_departure_status.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// This struct holds the transit departure or arrival information.

class TransitDeparture {
  /// The departure or arrival place.
  RoutePlace place;

  /// Expected departure or arrival time of the event.
  DateTime time;

  /// The accumulated delay in seconds from the scheduled time of the event.
  int delay;

  /// Status of the departure.
  TransitDepartureStatus status;


  TransitDeparture(this.place, this.time, this.delay, this.status);


}


// TransitDeparture "private" section, not exported.

final _sdk_routing_TransitDeparture_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_create_handle'));
final _sdk_routing_TransitDeparture_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_release_handle'));
final _sdk_routing_TransitDeparture_get_field_place = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_field_place'));
final _sdk_routing_TransitDeparture_get_field_time = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_field_time'));
final _sdk_routing_TransitDeparture_get_field_delay = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_field_delay'));
final _sdk_routing_TransitDeparture_get_field_status = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_field_status'));

Pointer<Void> sdk_routing_TransitDeparture_toFfi(TransitDeparture value) {
  final _place_handle = sdk_routing_RoutePlace_toFfi(value.place);
  final _time_handle = Date_toFfi_nullable(value.time);
  final _delay_handle = Int_toFfi_nullable(value.delay);
  final _status_handle = sdk_routing_TransitDepartureStatus_toFfi_nullable(value.status);
  final _result = _sdk_routing_TransitDeparture_create_handle(_place_handle, _time_handle, _delay_handle, _status_handle);
  sdk_routing_RoutePlace_releaseFfiHandle(_place_handle);
  Date_releaseFfiHandle_nullable(_time_handle);
  Int_releaseFfiHandle_nullable(_delay_handle);
  sdk_routing_TransitDepartureStatus_releaseFfiHandle_nullable(_status_handle);
  return _result;
}

TransitDeparture sdk_routing_TransitDeparture_fromFfi(Pointer<Void> handle) {
  final _place_handle = _sdk_routing_TransitDeparture_get_field_place(handle);
  final _time_handle = _sdk_routing_TransitDeparture_get_field_time(handle);
  final _delay_handle = _sdk_routing_TransitDeparture_get_field_delay(handle);
  final _status_handle = _sdk_routing_TransitDeparture_get_field_status(handle);
  try {
    return TransitDeparture(
      sdk_routing_RoutePlace_fromFfi(_place_handle), 
      Date_fromFfi_nullable(_time_handle), 
      Int_fromFfi_nullable(_delay_handle), 
      sdk_routing_TransitDepartureStatus_fromFfi_nullable(_status_handle)
    );
  } finally {
    sdk_routing_RoutePlace_releaseFfiHandle(_place_handle);
    Date_releaseFfiHandle_nullable(_time_handle);
    Int_releaseFfiHandle_nullable(_delay_handle);
    sdk_routing_TransitDepartureStatus_releaseFfiHandle_nullable(_status_handle);
  }
}

void sdk_routing_TransitDeparture_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TransitDeparture_release_handle(handle);

// Nullable TransitDeparture

final _sdk_routing_TransitDeparture_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_create_handle_nullable'));
final _sdk_routing_TransitDeparture_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_release_handle_nullable'));
final _sdk_routing_TransitDeparture_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_value_nullable'));

Pointer<Void> sdk_routing_TransitDeparture_toFfi_nullable(TransitDeparture value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitDeparture_toFfi(value);
  final result = _sdk_routing_TransitDeparture_create_handle_nullable(_handle);
  sdk_routing_TransitDeparture_releaseFfiHandle(_handle);
  return result;
}

TransitDeparture sdk_routing_TransitDeparture_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitDeparture_get_value_nullable(handle);
  final result = sdk_routing_TransitDeparture_fromFfi(_handle);
  sdk_routing_TransitDeparture_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitDeparture_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitDeparture_release_handle_nullable(handle);

// End of TransitDeparture "private" section.

