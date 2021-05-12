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
import 'package:here_sdk/src/sdk/routing/fare_price_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Price of a fare.

class FarePrice {
  /// Type of price represented by this object.
  /// @nodoc
  FarePriceType internaltype;

  /// Attribute value is true if the fare price is estimated, false if it is an exact value.
  bool estimated;

  /// Local currency of the price compliant to ISO 4217
  String currency;

  /// When set, the price is paid for a specific duration.
  ///
  /// Examples:
  ///
  /// 3600 - price for one hour
  /// 28800 - price for 8 hours
  /// 86400 - price for one day
  int unit;

  /// The price value
  /// TODO: Set for VALUE type
  /// @nodoc
  double internalvalue;

  /// Minimum price.
  /// TODO: Set for RANGE type
  /// @nodoc
  double internalminimum;

  /// Maximum price.
  /// TODO: Set for RANGE type
  /// @nodoc
  double internalmaximum;


  FarePrice(this.internaltype, this.estimated, this.currency, this.unit, this.internalvalue, this.internalminimum, this.internalmaximum);


  FarePrice.withDefaults(FarePriceType type, String currency, int unit, double value, double minimum, double maximum)
    : internaltype = type, estimated = false, currency = currency, unit = unit, internalvalue = value, internalminimum = minimum, internalmaximum = maximum;

}


// FarePrice "private" section, not exported.

final _sdk_routing_FarePrice_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint8, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_create_handle'));
final _sdk_routing_FarePrice_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_release_handle'));
final _sdk_routing_FarePrice_get_field_type = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_type'));
final _sdk_routing_FarePrice_get_field_estimated = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_estimated'));
final _sdk_routing_FarePrice_get_field_currency = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_currency'));
final _sdk_routing_FarePrice_get_field_unit = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_unit'));
final _sdk_routing_FarePrice_get_field_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_value'));
final _sdk_routing_FarePrice_get_field_minimum = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_minimum'));
final _sdk_routing_FarePrice_get_field_maximum = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_maximum'));

Pointer<Void> sdk_routing_FarePrice_toFfi(FarePrice value) {
  final _type_handle = sdk_routing_FarePriceType_toFfi(value.internaltype);
  final _estimated_handle = Boolean_toFfi(value.estimated);
  final _currency_handle = String_toFfi(value.currency);
  final _unit_handle = Int_toFfi_nullable(value.unit);
  final _value_handle = Double_toFfi_nullable(value.internalvalue);
  final _minimum_handle = Double_toFfi_nullable(value.internalminimum);
  final _maximum_handle = Double_toFfi_nullable(value.internalmaximum);
  final _result = _sdk_routing_FarePrice_create_handle(_type_handle, _estimated_handle, _currency_handle, _unit_handle, _value_handle, _minimum_handle, _maximum_handle);
  sdk_routing_FarePriceType_releaseFfiHandle(_type_handle);
  Boolean_releaseFfiHandle(_estimated_handle);
  String_releaseFfiHandle(_currency_handle);
  Int_releaseFfiHandle_nullable(_unit_handle);
  Double_releaseFfiHandle_nullable(_value_handle);
  Double_releaseFfiHandle_nullable(_minimum_handle);
  Double_releaseFfiHandle_nullable(_maximum_handle);
  return _result;
}

FarePrice sdk_routing_FarePrice_fromFfi(Pointer<Void> handle) {
  final _type_handle = _sdk_routing_FarePrice_get_field_type(handle);
  final _estimated_handle = _sdk_routing_FarePrice_get_field_estimated(handle);
  final _currency_handle = _sdk_routing_FarePrice_get_field_currency(handle);
  final _unit_handle = _sdk_routing_FarePrice_get_field_unit(handle);
  final _value_handle = _sdk_routing_FarePrice_get_field_value(handle);
  final _minimum_handle = _sdk_routing_FarePrice_get_field_minimum(handle);
  final _maximum_handle = _sdk_routing_FarePrice_get_field_maximum(handle);
  try {
    return FarePrice(
      sdk_routing_FarePriceType_fromFfi(_type_handle), 
      Boolean_fromFfi(_estimated_handle), 
      String_fromFfi(_currency_handle), 
      Int_fromFfi_nullable(_unit_handle), 
      Double_fromFfi_nullable(_value_handle), 
      Double_fromFfi_nullable(_minimum_handle), 
      Double_fromFfi_nullable(_maximum_handle)
    );
  } finally {
    sdk_routing_FarePriceType_releaseFfiHandle(_type_handle);
    Boolean_releaseFfiHandle(_estimated_handle);
    String_releaseFfiHandle(_currency_handle);
    Int_releaseFfiHandle_nullable(_unit_handle);
    Double_releaseFfiHandle_nullable(_value_handle);
    Double_releaseFfiHandle_nullable(_minimum_handle);
    Double_releaseFfiHandle_nullable(_maximum_handle);
  }
}

void sdk_routing_FarePrice_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_FarePrice_release_handle(handle);

// Nullable FarePrice

final _sdk_routing_FarePrice_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_create_handle_nullable'));
final _sdk_routing_FarePrice_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_release_handle_nullable'));
final _sdk_routing_FarePrice_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_value_nullable'));

Pointer<Void> sdk_routing_FarePrice_toFfi_nullable(FarePrice value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_FarePrice_toFfi(value);
  final result = _sdk_routing_FarePrice_create_handle_nullable(_handle);
  sdk_routing_FarePrice_releaseFfiHandle(_handle);
  return result;
}

FarePrice sdk_routing_FarePrice_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_FarePrice_get_value_nullable(handle);
  final result = sdk_routing_FarePrice_fromFfi(_handle);
  sdk_routing_FarePrice_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_FarePrice_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_FarePrice_release_handle_nullable(handle);

// End of FarePrice "private" section.

