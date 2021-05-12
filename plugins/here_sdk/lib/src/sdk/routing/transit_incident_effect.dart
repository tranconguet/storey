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

/// Transit incident effect.
enum TransitIncidentEffect {
    /// Cancelled service
    cancelledService,
    /// Reduced service
    reducedService,
    /// Additional service
    additionalService,
    /// Modified service
    modifiedService,
    /// Delays
    delays,
    /// Detour
    detour,
    /// Stop moved
    stopMoved
}

// TransitIncidentEffect "private" section, not exported.

int sdk_routing_TransitIncidentEffect_toFfi(TransitIncidentEffect value) {
  switch (value) {
  case TransitIncidentEffect.cancelledService:
    return 0;
  break;
  case TransitIncidentEffect.reducedService:
    return 1;
  break;
  case TransitIncidentEffect.additionalService:
    return 2;
  break;
  case TransitIncidentEffect.modifiedService:
    return 3;
  break;
  case TransitIncidentEffect.delays:
    return 4;
  break;
  case TransitIncidentEffect.detour:
    return 5;
  break;
  case TransitIncidentEffect.stopMoved:
    return 6;
  break;
  default:
    throw StateError("Invalid enum value $value for TransitIncidentEffect enum.");
  }
}

TransitIncidentEffect sdk_routing_TransitIncidentEffect_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransitIncidentEffect.cancelledService;
  break;
  case 1:
    return TransitIncidentEffect.reducedService;
  break;
  case 2:
    return TransitIncidentEffect.additionalService;
  break;
  case 3:
    return TransitIncidentEffect.modifiedService;
  break;
  case 4:
    return TransitIncidentEffect.delays;
  break;
  case 5:
    return TransitIncidentEffect.detour;
  break;
  case 6:
    return TransitIncidentEffect.stopMoved;
  break;
  default:
    throw StateError("Invalid numeric value $handle for TransitIncidentEffect enum.");
  }
}

void sdk_routing_TransitIncidentEffect_releaseFfiHandle(int handle) {}

final _sdk_routing_TransitIncidentEffect_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TransitIncidentEffect_create_handle_nullable'));
final _sdk_routing_TransitIncidentEffect_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncidentEffect_release_handle_nullable'));
final _sdk_routing_TransitIncidentEffect_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncidentEffect_get_value_nullable'));

Pointer<Void> sdk_routing_TransitIncidentEffect_toFfi_nullable(TransitIncidentEffect value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitIncidentEffect_toFfi(value);
  final result = _sdk_routing_TransitIncidentEffect_create_handle_nullable(_handle);
  sdk_routing_TransitIncidentEffect_releaseFfiHandle(_handle);
  return result;
}

TransitIncidentEffect sdk_routing_TransitIncidentEffect_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitIncidentEffect_get_value_nullable(handle);
  final result = sdk_routing_TransitIncidentEffect_fromFfi(_handle);
  sdk_routing_TransitIncidentEffect_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitIncidentEffect_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitIncidentEffect_release_handle_nullable(handle);

// End of TransitIncidentEffect "private" section.

