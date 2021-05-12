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
import 'package:here_sdk/src/sdk/routing/fare_price.dart';
import 'package:here_sdk/src/sdk/routing/fare_reason.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Holds all the fare data.

class Fare {
  /// Name of a fare
  String name;

  /// Price of a fare. If not provided the price information should be hidden.
  FarePrice price;

  /// Reason of this cost.
  FareReason reason;


  Fare(this.name, this.price, this.reason);


}


// Fare "private" section, not exported.

final _sdk_routing_Fare_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_Fare_create_handle'));
final _sdk_routing_Fare_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_release_handle'));
final _sdk_routing_Fare_get_field_name = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_get_field_name'));
final _sdk_routing_Fare_get_field_price = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_get_field_price'));
final _sdk_routing_Fare_get_field_reason = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_get_field_reason'));

Pointer<Void> sdk_routing_Fare_toFfi(Fare value) {
  final _name_handle = String_toFfi(value.name);
  final _price_handle = sdk_routing_FarePrice_toFfi_nullable(value.price);
  final _reason_handle = sdk_routing_FareReason_toFfi(value.reason);
  final _result = _sdk_routing_Fare_create_handle(_name_handle, _price_handle, _reason_handle);
  String_releaseFfiHandle(_name_handle);
  sdk_routing_FarePrice_releaseFfiHandle_nullable(_price_handle);
  sdk_routing_FareReason_releaseFfiHandle(_reason_handle);
  return _result;
}

Fare sdk_routing_Fare_fromFfi(Pointer<Void> handle) {
  final _name_handle = _sdk_routing_Fare_get_field_name(handle);
  final _price_handle = _sdk_routing_Fare_get_field_price(handle);
  final _reason_handle = _sdk_routing_Fare_get_field_reason(handle);
  try {
    return Fare(
      String_fromFfi(_name_handle), 
      sdk_routing_FarePrice_fromFfi_nullable(_price_handle), 
      sdk_routing_FareReason_fromFfi(_reason_handle)
    );
  } finally {
    String_releaseFfiHandle(_name_handle);
    sdk_routing_FarePrice_releaseFfiHandle_nullable(_price_handle);
    sdk_routing_FareReason_releaseFfiHandle(_reason_handle);
  }
}

void sdk_routing_Fare_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_Fare_release_handle(handle);

// Nullable Fare

final _sdk_routing_Fare_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_create_handle_nullable'));
final _sdk_routing_Fare_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_release_handle_nullable'));
final _sdk_routing_Fare_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_get_value_nullable'));

Pointer<Void> sdk_routing_Fare_toFfi_nullable(Fare value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_Fare_toFfi(value);
  final result = _sdk_routing_Fare_create_handle_nullable(_handle);
  sdk_routing_Fare_releaseFfiHandle(_handle);
  return result;
}

Fare sdk_routing_Fare_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_Fare_get_value_nullable(handle);
  final result = sdk_routing_Fare_fromFfi(_handle);
  sdk_routing_Fare_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_Fare_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Fare_release_handle_nullable(handle);

// End of Fare "private" section.

