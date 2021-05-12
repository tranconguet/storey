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


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Public transit mode
enum TransitMode {
    /// High speed train.
    highSpeedTrain,
    /// Intercity train.
    intercityTrain,
    /// Inter regional train.
    interRegionalTrain,
    /// Regional train.
    regionalTrain,
    /// City train.
    cityTrain,
    /// Bus.
    bus,
    /// Ferry.
    ferry,
    /// Subway.
    subway,
    /// Light rail.
    lightRail,
    /// Private bus.
    privateBus,
    /// Inclined.
    inclined,
    /// Aerial.
    aerial,
    /// Bus rapid.
    busRapid,
    /// Monorail.
    monorail,
    /// Flight.
    flight
}

// TransitMode "private" section, not exported.

int sdk_routing_TransitMode_toFfi(TransitMode value) {
  switch (value) {
  case TransitMode.highSpeedTrain:
    return 0;
  break;
  case TransitMode.intercityTrain:
    return 1;
  break;
  case TransitMode.interRegionalTrain:
    return 2;
  break;
  case TransitMode.regionalTrain:
    return 3;
  break;
  case TransitMode.cityTrain:
    return 4;
  break;
  case TransitMode.bus:
    return 5;
  break;
  case TransitMode.ferry:
    return 6;
  break;
  case TransitMode.subway:
    return 7;
  break;
  case TransitMode.lightRail:
    return 8;
  break;
  case TransitMode.privateBus:
    return 9;
  break;
  case TransitMode.inclined:
    return 10;
  break;
  case TransitMode.aerial:
    return 11;
  break;
  case TransitMode.busRapid:
    return 12;
  break;
  case TransitMode.monorail:
    return 13;
  break;
  case TransitMode.flight:
    return 14;
  break;
  default:
    throw StateError("Invalid enum value $value for TransitMode enum.");
  }
}

TransitMode sdk_routing_TransitMode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransitMode.highSpeedTrain;
  break;
  case 1:
    return TransitMode.intercityTrain;
  break;
  case 2:
    return TransitMode.interRegionalTrain;
  break;
  case 3:
    return TransitMode.regionalTrain;
  break;
  case 4:
    return TransitMode.cityTrain;
  break;
  case 5:
    return TransitMode.bus;
  break;
  case 6:
    return TransitMode.ferry;
  break;
  case 7:
    return TransitMode.subway;
  break;
  case 8:
    return TransitMode.lightRail;
  break;
  case 9:
    return TransitMode.privateBus;
  break;
  case 10:
    return TransitMode.inclined;
  break;
  case 11:
    return TransitMode.aerial;
  break;
  case 12:
    return TransitMode.busRapid;
  break;
  case 13:
    return TransitMode.monorail;
  break;
  case 14:
    return TransitMode.flight;
  break;
  default:
    throw StateError("Invalid numeric value $handle for TransitMode enum.");
  }
}

void sdk_routing_TransitMode_releaseFfiHandle(int handle) {}

final _sdk_routing_TransitMode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TransitMode_create_handle_nullable'));
final _sdk_routing_TransitMode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitMode_release_handle_nullable'));
final _sdk_routing_TransitMode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitMode_get_value_nullable'));

Pointer<Void> sdk_routing_TransitMode_toFfi_nullable(TransitMode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitMode_toFfi(value);
  final result = _sdk_routing_TransitMode_create_handle_nullable(_handle);
  sdk_routing_TransitMode_releaseFfiHandle(_handle);
  return result;
}

TransitMode sdk_routing_TransitMode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitMode_get_value_nullable(handle);
  final result = sdk_routing_TransitMode_fromFfi(_handle);
  sdk_routing_TransitMode_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitMode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitMode_release_handle_nullable(handle);

// End of TransitMode "private" section.

