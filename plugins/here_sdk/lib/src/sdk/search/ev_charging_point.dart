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

/// Contains information about an EV charging point.
/// @nodoc

class EvChargingPoint {
  /// Charging mode of the connector. The current available values are:
  /// Mode 1 ? slow charging from a regular electrical socket (1 or 3 phase)
  /// Mode 2 ? slow charging from a regular socket equipped with some EV specific protection arrangement.
  /// Examples include Park & Charge and PARVE systems.
  /// Mode 3 ? slow or fast charging using a specific EV multi-pin socket with control and
  /// protection functions. Examples include systems with SAE J1772 and IEC 62196 connectors.
  /// Mode 4 ? fast charging using some special charging technology such as CHAdeMO.
  /// Unspecified ? no information provided
  /// @nodoc
  String internalchargingMode;

  /// Number of physical connectors at the charging point.
  /// @nodoc
  int internalconnectorCount;

  /// Number of phases used by the charge point.
  /// @nodoc
  int internalphasesCount;

  /// Voltage range of the charge provided by the charge point, in volts.
  /// Values are alpha numeric represented by the Volt value followed by 'V' and
  /// by the current type 'AC' or 'DC', for example: '100-120V AC'
  /// @nodoc
  String internalvoltageRangeInVolts;

  /// Current range provided by the charge point, in amperes.
  /// Values are alpha numeric represented by the Ampere value followed by an 'A',
  /// for example '12A-80A'
  /// @nodoc
  String internalcurrentRangeInAmperes;


  EvChargingPoint(this.internalchargingMode, this.internalconnectorCount, this.internalphasesCount, this.internalvoltageRangeInVolts, this.internalcurrentRangeInAmperes);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EvChargingPoint) return false;
    EvChargingPoint _other = other;
    return internalchargingMode == _other.internalchargingMode &&
        internalconnectorCount == _other.internalconnectorCount &&
        internalphasesCount == _other.internalphasesCount &&
        internalvoltageRangeInVolts == _other.internalvoltageRangeInVolts &&
        internalcurrentRangeInAmperes == _other.internalcurrentRangeInAmperes;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalchargingMode.hashCode;
    result = 31 * result + internalconnectorCount.hashCode;
    result = 31 * result + internalphasesCount.hashCode;
    result = 31 * result + internalvoltageRangeInVolts.hashCode;
    result = 31 * result + internalcurrentRangeInAmperes.hashCode;
    return result;
  }
}


// EvChargingPoint "private" section, not exported.

final _sdk_search_EvChargingPoint_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_create_handle'));
final _sdk_search_EvChargingPoint_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_release_handle'));
final _sdk_search_EvChargingPoint_get_field_chargingMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_chargingMode'));
final _sdk_search_EvChargingPoint_get_field_connectorCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_connectorCount'));
final _sdk_search_EvChargingPoint_get_field_phasesCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_phasesCount'));
final _sdk_search_EvChargingPoint_get_field_voltageRangeInVolts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_voltageRangeInVolts'));
final _sdk_search_EvChargingPoint_get_field_currentRangeInAmperes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_field_currentRangeInAmperes'));

Pointer<Void> sdk_search_EvChargingPoint_toFfi(EvChargingPoint value) {
  final _chargingMode_handle = String_toFfi_nullable(value.internalchargingMode);
  final _connectorCount_handle = Int_toFfi_nullable(value.internalconnectorCount);
  final _phasesCount_handle = Int_toFfi_nullable(value.internalphasesCount);
  final _voltageRangeInVolts_handle = String_toFfi_nullable(value.internalvoltageRangeInVolts);
  final _currentRangeInAmperes_handle = String_toFfi_nullable(value.internalcurrentRangeInAmperes);
  final _result = _sdk_search_EvChargingPoint_create_handle(_chargingMode_handle, _connectorCount_handle, _phasesCount_handle, _voltageRangeInVolts_handle, _currentRangeInAmperes_handle);
  String_releaseFfiHandle_nullable(_chargingMode_handle);
  Int_releaseFfiHandle_nullable(_connectorCount_handle);
  Int_releaseFfiHandle_nullable(_phasesCount_handle);
  String_releaseFfiHandle_nullable(_voltageRangeInVolts_handle);
  String_releaseFfiHandle_nullable(_currentRangeInAmperes_handle);
  return _result;
}

EvChargingPoint sdk_search_EvChargingPoint_fromFfi(Pointer<Void> handle) {
  final _chargingMode_handle = _sdk_search_EvChargingPoint_get_field_chargingMode(handle);
  final _connectorCount_handle = _sdk_search_EvChargingPoint_get_field_connectorCount(handle);
  final _phasesCount_handle = _sdk_search_EvChargingPoint_get_field_phasesCount(handle);
  final _voltageRangeInVolts_handle = _sdk_search_EvChargingPoint_get_field_voltageRangeInVolts(handle);
  final _currentRangeInAmperes_handle = _sdk_search_EvChargingPoint_get_field_currentRangeInAmperes(handle);
  try {
    return EvChargingPoint(
      String_fromFfi_nullable(_chargingMode_handle), 
      Int_fromFfi_nullable(_connectorCount_handle), 
      Int_fromFfi_nullable(_phasesCount_handle), 
      String_fromFfi_nullable(_voltageRangeInVolts_handle), 
      String_fromFfi_nullable(_currentRangeInAmperes_handle)
    );
  } finally {
    String_releaseFfiHandle_nullable(_chargingMode_handle);
    Int_releaseFfiHandle_nullable(_connectorCount_handle);
    Int_releaseFfiHandle_nullable(_phasesCount_handle);
    String_releaseFfiHandle_nullable(_voltageRangeInVolts_handle);
    String_releaseFfiHandle_nullable(_currentRangeInAmperes_handle);
  }
}

void sdk_search_EvChargingPoint_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_EvChargingPoint_release_handle(handle);

// Nullable EvChargingPoint

final _sdk_search_EvChargingPoint_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_create_handle_nullable'));
final _sdk_search_EvChargingPoint_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_release_handle_nullable'));
final _sdk_search_EvChargingPoint_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EvChargingPoint_get_value_nullable'));

Pointer<Void> sdk_search_EvChargingPoint_toFfi_nullable(EvChargingPoint value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_EvChargingPoint_toFfi(value);
  final result = _sdk_search_EvChargingPoint_create_handle_nullable(_handle);
  sdk_search_EvChargingPoint_releaseFfiHandle(_handle);
  return result;
}

EvChargingPoint sdk_search_EvChargingPoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_EvChargingPoint_get_value_nullable(handle);
  final result = sdk_search_EvChargingPoint_fromFfi(_handle);
  sdk_search_EvChargingPoint_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_EvChargingPoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_EvChargingPoint_release_handle_nullable(handle);

// End of EvChargingPoint "private" section.

