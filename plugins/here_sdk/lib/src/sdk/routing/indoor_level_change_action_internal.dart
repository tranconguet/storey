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

/// @nodoc

class IndoorLevelChangeActionInternal {
  /// @nodoc
  String internalconnector;

  /// @nodoc
  int internaldeltaZ;


  IndoorLevelChangeActionInternal(this.internalconnector, this.internaldeltaZ);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! IndoorLevelChangeActionInternal) return false;
    IndoorLevelChangeActionInternal _other = other;
    return internalconnector == _other.internalconnector &&
        internaldeltaZ == _other.internaldeltaZ;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalconnector.hashCode;
    result = 31 * result + internaldeltaZ.hashCode;
    return result;
  }
}


// IndoorLevelChangeActionInternal "private" section, not exported.

final _sdk_routing_IndoorLevelChangeActionInternal_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_create_handle'));
final _sdk_routing_IndoorLevelChangeActionInternal_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_release_handle'));
final _sdk_routing_IndoorLevelChangeActionInternal_get_field_connector = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_get_field_connector'));
final _sdk_routing_IndoorLevelChangeActionInternal_get_field_deltaZ = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_get_field_deltaZ'));

Pointer<Void> sdk_routing_IndoorLevelChangeActionInternal_toFfi(IndoorLevelChangeActionInternal value) {
  final _connector_handle = String_toFfi(value.internalconnector);
  final _deltaZ_handle = (value.internaldeltaZ);
  final _result = _sdk_routing_IndoorLevelChangeActionInternal_create_handle(_connector_handle, _deltaZ_handle);
  String_releaseFfiHandle(_connector_handle);
  (_deltaZ_handle);
  return _result;
}

IndoorLevelChangeActionInternal sdk_routing_IndoorLevelChangeActionInternal_fromFfi(Pointer<Void> handle) {
  final _connector_handle = _sdk_routing_IndoorLevelChangeActionInternal_get_field_connector(handle);
  final _deltaZ_handle = _sdk_routing_IndoorLevelChangeActionInternal_get_field_deltaZ(handle);
  try {
    return IndoorLevelChangeActionInternal(
      String_fromFfi(_connector_handle), 
      (_deltaZ_handle)
    );
  } finally {
    String_releaseFfiHandle(_connector_handle);
    (_deltaZ_handle);
  }
}

void sdk_routing_IndoorLevelChangeActionInternal_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_IndoorLevelChangeActionInternal_release_handle(handle);

// Nullable IndoorLevelChangeActionInternal

final _sdk_routing_IndoorLevelChangeActionInternal_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_create_handle_nullable'));
final _sdk_routing_IndoorLevelChangeActionInternal_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_release_handle_nullable'));
final _sdk_routing_IndoorLevelChangeActionInternal_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLevelChangeActionInternal_get_value_nullable'));

Pointer<Void> sdk_routing_IndoorLevelChangeActionInternal_toFfi_nullable(IndoorLevelChangeActionInternal value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_IndoorLevelChangeActionInternal_toFfi(value);
  final result = _sdk_routing_IndoorLevelChangeActionInternal_create_handle_nullable(_handle);
  sdk_routing_IndoorLevelChangeActionInternal_releaseFfiHandle(_handle);
  return result;
}

IndoorLevelChangeActionInternal sdk_routing_IndoorLevelChangeActionInternal_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_IndoorLevelChangeActionInternal_get_value_nullable(handle);
  final result = sdk_routing_IndoorLevelChangeActionInternal_fromFfi(_handle);
  sdk_routing_IndoorLevelChangeActionInternal_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_IndoorLevelChangeActionInternal_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_IndoorLevelChangeActionInternal_release_handle_nullable(handle);

// End of IndoorLevelChangeActionInternal "private" section.

