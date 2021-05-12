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

/// Transit incident type.
enum TransitIncidentType {
    /// Technical problem.
    technicalProblem,
    /// Strike
    strike,
    /// Demostration
    demonstration,
    /// Accident
    accident,
    /// Holiday
    holiday,
    /// Weather
    weather,
    /// Maintenance
    maintenance,
    /// Construction
    construction,
    /// Police activity
    policeActivity,
    /// Medical emergency
    medicalEmergency
}

// TransitIncidentType "private" section, not exported.

int sdk_routing_TransitIncidentType_toFfi(TransitIncidentType value) {
  switch (value) {
  case TransitIncidentType.technicalProblem:
    return 0;
  break;
  case TransitIncidentType.strike:
    return 1;
  break;
  case TransitIncidentType.demonstration:
    return 2;
  break;
  case TransitIncidentType.accident:
    return 3;
  break;
  case TransitIncidentType.holiday:
    return 4;
  break;
  case TransitIncidentType.weather:
    return 5;
  break;
  case TransitIncidentType.maintenance:
    return 6;
  break;
  case TransitIncidentType.construction:
    return 7;
  break;
  case TransitIncidentType.policeActivity:
    return 8;
  break;
  case TransitIncidentType.medicalEmergency:
    return 9;
  break;
  default:
    throw StateError("Invalid enum value $value for TransitIncidentType enum.");
  }
}

TransitIncidentType sdk_routing_TransitIncidentType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransitIncidentType.technicalProblem;
  break;
  case 1:
    return TransitIncidentType.strike;
  break;
  case 2:
    return TransitIncidentType.demonstration;
  break;
  case 3:
    return TransitIncidentType.accident;
  break;
  case 4:
    return TransitIncidentType.holiday;
  break;
  case 5:
    return TransitIncidentType.weather;
  break;
  case 6:
    return TransitIncidentType.maintenance;
  break;
  case 7:
    return TransitIncidentType.construction;
  break;
  case 8:
    return TransitIncidentType.policeActivity;
  break;
  case 9:
    return TransitIncidentType.medicalEmergency;
  break;
  default:
    throw StateError("Invalid numeric value $handle for TransitIncidentType enum.");
  }
}

void sdk_routing_TransitIncidentType_releaseFfiHandle(int handle) {}

final _sdk_routing_TransitIncidentType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TransitIncidentType_create_handle_nullable'));
final _sdk_routing_TransitIncidentType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncidentType_release_handle_nullable'));
final _sdk_routing_TransitIncidentType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncidentType_get_value_nullable'));

Pointer<Void> sdk_routing_TransitIncidentType_toFfi_nullable(TransitIncidentType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitIncidentType_toFfi(value);
  final result = _sdk_routing_TransitIncidentType_create_handle_nullable(_handle);
  sdk_routing_TransitIncidentType_releaseFfiHandle(_handle);
  return result;
}

TransitIncidentType sdk_routing_TransitIncidentType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitIncidentType_get_value_nullable(handle);
  final result = sdk_routing_TransitIncidentType_fromFfi(_handle);
  sdk_routing_TransitIncidentType_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitIncidentType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitIncidentType_release_handle_nullable(handle);

// End of TransitIncidentType "private" section.

