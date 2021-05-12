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

/// Describes the impact a notice has on the resource to which the notice is attached.
enum NoticeSeverity {
    /// The notice must not be ignored, even if the type of notice is not known to the user.
    /// Any associated resource (e.g., route section) must not be used without further evaluation.
    critical,
    /// The notice is for informative purposes, but does not affect usability of the route.
    info
}

// NoticeSeverity "private" section, not exported.

int sdk_routing_NoticeSeverity_toFfi(NoticeSeverity value) {
  switch (value) {
  case NoticeSeverity.critical:
    return 0;
  break;
  case NoticeSeverity.info:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for NoticeSeverity enum.");
  }
}

NoticeSeverity sdk_routing_NoticeSeverity_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return NoticeSeverity.critical;
  break;
  case 1:
    return NoticeSeverity.info;
  break;
  default:
    throw StateError("Invalid numeric value $handle for NoticeSeverity enum.");
  }
}

void sdk_routing_NoticeSeverity_releaseFfiHandle(int handle) {}

final _sdk_routing_NoticeSeverity_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_NoticeSeverity_create_handle_nullable'));
final _sdk_routing_NoticeSeverity_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_NoticeSeverity_release_handle_nullable'));
final _sdk_routing_NoticeSeverity_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_NoticeSeverity_get_value_nullable'));

Pointer<Void> sdk_routing_NoticeSeverity_toFfi_nullable(NoticeSeverity value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_NoticeSeverity_toFfi(value);
  final result = _sdk_routing_NoticeSeverity_create_handle_nullable(_handle);
  sdk_routing_NoticeSeverity_releaseFfiHandle(_handle);
  return result;
}

NoticeSeverity sdk_routing_NoticeSeverity_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_NoticeSeverity_get_value_nullable(handle);
  final result = sdk_routing_NoticeSeverity_fromFfi(_handle);
  sdk_routing_NoticeSeverity_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_NoticeSeverity_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_NoticeSeverity_release_handle_nullable(handle);

// End of NoticeSeverity "private" section.

