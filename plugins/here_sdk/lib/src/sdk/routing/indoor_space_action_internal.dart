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

class IndoorSpaceActionInternal {
  /// @nodoc
  String internaldisplayName;

  /// @nodoc
  String internalfacility;

  /// @nodoc
  String internalspaceId;


  IndoorSpaceActionInternal(this.internaldisplayName, this.internalfacility, this.internalspaceId);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! IndoorSpaceActionInternal) return false;
    IndoorSpaceActionInternal _other = other;
    return internaldisplayName == _other.internaldisplayName &&
        internalfacility == _other.internalfacility &&
        internalspaceId == _other.internalspaceId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internaldisplayName.hashCode;
    result = 31 * result + internalfacility.hashCode;
    result = 31 * result + internalspaceId.hashCode;
    return result;
  }
}


// IndoorSpaceActionInternal "private" section, not exported.

final _sdk_routing_IndoorSpaceActionInternal_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_create_handle'));
final _sdk_routing_IndoorSpaceActionInternal_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_release_handle'));
final _sdk_routing_IndoorSpaceActionInternal_get_field_displayName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_get_field_displayName'));
final _sdk_routing_IndoorSpaceActionInternal_get_field_facility = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_get_field_facility'));
final _sdk_routing_IndoorSpaceActionInternal_get_field_spaceId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_get_field_spaceId'));

Pointer<Void> sdk_routing_IndoorSpaceActionInternal_toFfi(IndoorSpaceActionInternal value) {
  final _displayName_handle = String_toFfi(value.internaldisplayName);
  final _facility_handle = String_toFfi(value.internalfacility);
  final _spaceId_handle = String_toFfi(value.internalspaceId);
  final _result = _sdk_routing_IndoorSpaceActionInternal_create_handle(_displayName_handle, _facility_handle, _spaceId_handle);
  String_releaseFfiHandle(_displayName_handle);
  String_releaseFfiHandle(_facility_handle);
  String_releaseFfiHandle(_spaceId_handle);
  return _result;
}

IndoorSpaceActionInternal sdk_routing_IndoorSpaceActionInternal_fromFfi(Pointer<Void> handle) {
  final _displayName_handle = _sdk_routing_IndoorSpaceActionInternal_get_field_displayName(handle);
  final _facility_handle = _sdk_routing_IndoorSpaceActionInternal_get_field_facility(handle);
  final _spaceId_handle = _sdk_routing_IndoorSpaceActionInternal_get_field_spaceId(handle);
  try {
    return IndoorSpaceActionInternal(
      String_fromFfi(_displayName_handle), 
      String_fromFfi(_facility_handle), 
      String_fromFfi(_spaceId_handle)
    );
  } finally {
    String_releaseFfiHandle(_displayName_handle);
    String_releaseFfiHandle(_facility_handle);
    String_releaseFfiHandle(_spaceId_handle);
  }
}

void sdk_routing_IndoorSpaceActionInternal_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_IndoorSpaceActionInternal_release_handle(handle);

// Nullable IndoorSpaceActionInternal

final _sdk_routing_IndoorSpaceActionInternal_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_create_handle_nullable'));
final _sdk_routing_IndoorSpaceActionInternal_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_release_handle_nullable'));
final _sdk_routing_IndoorSpaceActionInternal_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorSpaceActionInternal_get_value_nullable'));

Pointer<Void> sdk_routing_IndoorSpaceActionInternal_toFfi_nullable(IndoorSpaceActionInternal value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_IndoorSpaceActionInternal_toFfi(value);
  final result = _sdk_routing_IndoorSpaceActionInternal_create_handle_nullable(_handle);
  sdk_routing_IndoorSpaceActionInternal_releaseFfiHandle(_handle);
  return result;
}

IndoorSpaceActionInternal sdk_routing_IndoorSpaceActionInternal_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_IndoorSpaceActionInternal_get_value_nullable(handle);
  final result = sdk_routing_IndoorSpaceActionInternal_fromFfi(_handle);
  sdk_routing_IndoorSpaceActionInternal_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_IndoorSpaceActionInternal_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_IndoorSpaceActionInternal_release_handle_nullable(handle);

// End of IndoorSpaceActionInternal "private" section.

