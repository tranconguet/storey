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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/ev_charging_point.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Contains information about a connector at an EV charging station.
/// @nodoc

class EvConnector {
  /// The supplier name.
  /// @nodoc
  String internalsupplierName;

  /// Id and name element pairs with an Integer value and a descriptive name describing the connector type.
  /// For more information on the current connector types, see the list of connectorType values.
  /// @nodoc
  List<String> internalconnectorTypes;

  /// Maximum charge power of connector in kilowatts.
  /// @nodoc
  double internalmaxPowerInKilowatts;

  /// Dynamic information for the connector.
  /// @nodoc
  List<EvChargingPoint> internalchargingPoints;


  EvConnector(this.internalsupplierName, this.internalconnectorTypes, this.internalmaxPowerInKilowatts, this.internalchargingPoints);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EvConnector) return false;
    EvConnector _other = other;
    return internalsupplierName == _other.internalsupplierName &&
        DeepCollectionEquality().equals(internalconnectorTypes, _other.internalconnectorTypes) &&
        internalmaxPowerInKilowatts == _other.internalmaxPowerInKilowatts &&
        DeepCollectionEquality().equals(internalchargingPoints, _other.internalchargingPoints);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalsupplierName.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(internalconnectorTypes);
    result = 31 * result + internalmaxPowerInKilowatts.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(internalchargingPoints);
    return result;
  }
}


// EvConnector "private" section, not exported.

final _sdk_search_EvConnector_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_create_handle'));
final _sdk_search_EvConnector_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_release_handle'));
final _sdk_search_EvConnector_get_field_supplierName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_field_supplierName'));
final _sdk_search_EvConnector_get_field_connectorTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_field_connectorTypes'));
final _sdk_search_EvConnector_get_field_maxPowerInKilowatts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_field_maxPowerInKilowatts'));
final _sdk_search_EvConnector_get_field_chargingPoints = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_field_chargingPoints'));

Pointer<Void> sdk_search_EvConnector_toFfi(EvConnector value) {
  final _supplierName_handle = String_toFfi_nullable(value.internalsupplierName);
  final _connectorTypes_handle = heresdk_search_common_bindings_ListOf_String_toFfi(value.internalconnectorTypes);
  final _maxPowerInKilowatts_handle = Double_toFfi_nullable(value.internalmaxPowerInKilowatts);
  final _chargingPoints_handle = heresdk_search_common_bindings_ListOf_sdk_search_EvChargingPoint_toFfi(value.internalchargingPoints);
  final _result = _sdk_search_EvConnector_create_handle(_supplierName_handle, _connectorTypes_handle, _maxPowerInKilowatts_handle, _chargingPoints_handle);
  String_releaseFfiHandle_nullable(_supplierName_handle);
  heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_connectorTypes_handle);
  Double_releaseFfiHandle_nullable(_maxPowerInKilowatts_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_EvChargingPoint_releaseFfiHandle(_chargingPoints_handle);
  return _result;
}

EvConnector sdk_search_EvConnector_fromFfi(Pointer<Void> handle) {
  final _supplierName_handle = _sdk_search_EvConnector_get_field_supplierName(handle);
  final _connectorTypes_handle = _sdk_search_EvConnector_get_field_connectorTypes(handle);
  final _maxPowerInKilowatts_handle = _sdk_search_EvConnector_get_field_maxPowerInKilowatts(handle);
  final _chargingPoints_handle = _sdk_search_EvConnector_get_field_chargingPoints(handle);
  try {
    return EvConnector(
      String_fromFfi_nullable(_supplierName_handle), 
      heresdk_search_common_bindings_ListOf_String_fromFfi(_connectorTypes_handle), 
      Double_fromFfi_nullable(_maxPowerInKilowatts_handle), 
      heresdk_search_common_bindings_ListOf_sdk_search_EvChargingPoint_fromFfi(_chargingPoints_handle)
    );
  } finally {
    String_releaseFfiHandle_nullable(_supplierName_handle);
    heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_connectorTypes_handle);
    Double_releaseFfiHandle_nullable(_maxPowerInKilowatts_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_EvChargingPoint_releaseFfiHandle(_chargingPoints_handle);
  }
}

void sdk_search_EvConnector_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_EvConnector_release_handle(handle);

// Nullable EvConnector

final _sdk_search_EvConnector_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_create_handle_nullable'));
final _sdk_search_EvConnector_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_release_handle_nullable'));
final _sdk_search_EvConnector_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvConnector_get_value_nullable'));

Pointer<Void> sdk_search_EvConnector_toFfi_nullable(EvConnector value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_EvConnector_toFfi(value);
  final result = _sdk_search_EvConnector_create_handle_nullable(_handle);
  sdk_search_EvConnector_releaseFfiHandle(_handle);
  return result;
}

EvConnector sdk_search_EvConnector_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_EvConnector_get_value_nullable(handle);
  final result = sdk_search_EvConnector_fromFfi(_handle);
  sdk_search_EvConnector_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_EvConnector_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_EvConnector_release_handle_nullable(handle);

// End of EvConnector "private" section.

