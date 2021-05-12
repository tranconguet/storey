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
import 'package:here_sdk/src/sdk/routing/transit_departure.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A transit stop between the departure and destination of a transit section.

class TransitStop {
  /// Departure.
  TransitDeparture departure;

  /// Stop duration. If not set, the vehicle departs as soon as people
  /// are on board.
  int durationInSeconds;


  TransitStop(this.departure, this.durationInSeconds);


}


// TransitStop "private" section, not exported.

final _sdk_routing_TransitStop_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_create_handle'));
final _sdk_routing_TransitStop_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_release_handle'));
final _sdk_routing_TransitStop_get_field_departure = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_get_field_departure'));
final _sdk_routing_TransitStop_get_field_durationInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_get_field_durationInSeconds'));

Pointer<Void> sdk_routing_TransitStop_toFfi(TransitStop value) {
  final _departure_handle = sdk_routing_TransitDeparture_toFfi(value.departure);
  final _durationInSeconds_handle = Int_toFfi_nullable(value.durationInSeconds);
  final _result = _sdk_routing_TransitStop_create_handle(_departure_handle, _durationInSeconds_handle);
  sdk_routing_TransitDeparture_releaseFfiHandle(_departure_handle);
  Int_releaseFfiHandle_nullable(_durationInSeconds_handle);
  return _result;
}

TransitStop sdk_routing_TransitStop_fromFfi(Pointer<Void> handle) {
  final _departure_handle = _sdk_routing_TransitStop_get_field_departure(handle);
  final _durationInSeconds_handle = _sdk_routing_TransitStop_get_field_durationInSeconds(handle);
  try {
    return TransitStop(
      sdk_routing_TransitDeparture_fromFfi(_departure_handle), 
      Int_fromFfi_nullable(_durationInSeconds_handle)
    );
  } finally {
    sdk_routing_TransitDeparture_releaseFfiHandle(_departure_handle);
    Int_releaseFfiHandle_nullable(_durationInSeconds_handle);
  }
}

void sdk_routing_TransitStop_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TransitStop_release_handle(handle);

// Nullable TransitStop

final _sdk_routing_TransitStop_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_create_handle_nullable'));
final _sdk_routing_TransitStop_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_release_handle_nullable'));
final _sdk_routing_TransitStop_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_get_value_nullable'));

Pointer<Void> sdk_routing_TransitStop_toFfi_nullable(TransitStop value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitStop_toFfi(value);
  final result = _sdk_routing_TransitStop_create_handle_nullable(_handle);
  sdk_routing_TransitStop_releaseFfiHandle(_handle);
  return result;
}

TransitStop sdk_routing_TransitStop_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitStop_get_value_nullable(handle);
  final result = sdk_routing_TransitStop_fromFfi(_handle);
  sdk_routing_TransitStop_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitStop_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitStop_release_handle_nullable(handle);

// End of TransitStop "private" section.

