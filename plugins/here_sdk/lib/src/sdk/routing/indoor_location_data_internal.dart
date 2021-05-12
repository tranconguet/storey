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

class IndoorLocationDataInternal {
  /// @nodoc
  String internalvenueId;

  /// @nodoc
  int internallevelZIndex;


  IndoorLocationDataInternal(this.internalvenueId, this.internallevelZIndex);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! IndoorLocationDataInternal) return false;
    IndoorLocationDataInternal _other = other;
    return internalvenueId == _other.internalvenueId &&
        internallevelZIndex == _other.internallevelZIndex;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalvenueId.hashCode;
    result = 31 * result + internallevelZIndex.hashCode;
    return result;
  }
}


// IndoorLocationDataInternal "private" section, not exported.

final _sdk_routing_IndoorLocationDataInternal_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_create_handle'));
final _sdk_routing_IndoorLocationDataInternal_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_release_handle'));
final _sdk_routing_IndoorLocationDataInternal_get_field_venueId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_get_field_venueId'));
final _sdk_routing_IndoorLocationDataInternal_get_field_levelZIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_get_field_levelZIndex'));

Pointer<Void> sdk_routing_IndoorLocationDataInternal_toFfi(IndoorLocationDataInternal value) {
  final _venueId_handle = String_toFfi(value.internalvenueId);
  final _levelZIndex_handle = (value.internallevelZIndex);
  final _result = _sdk_routing_IndoorLocationDataInternal_create_handle(_venueId_handle, _levelZIndex_handle);
  String_releaseFfiHandle(_venueId_handle);
  (_levelZIndex_handle);
  return _result;
}

IndoorLocationDataInternal sdk_routing_IndoorLocationDataInternal_fromFfi(Pointer<Void> handle) {
  final _venueId_handle = _sdk_routing_IndoorLocationDataInternal_get_field_venueId(handle);
  final _levelZIndex_handle = _sdk_routing_IndoorLocationDataInternal_get_field_levelZIndex(handle);
  try {
    return IndoorLocationDataInternal(
      String_fromFfi(_venueId_handle), 
      (_levelZIndex_handle)
    );
  } finally {
    String_releaseFfiHandle(_venueId_handle);
    (_levelZIndex_handle);
  }
}

void sdk_routing_IndoorLocationDataInternal_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_IndoorLocationDataInternal_release_handle(handle);

// Nullable IndoorLocationDataInternal

final _sdk_routing_IndoorLocationDataInternal_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_create_handle_nullable'));
final _sdk_routing_IndoorLocationDataInternal_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_release_handle_nullable'));
final _sdk_routing_IndoorLocationDataInternal_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_get_value_nullable'));

Pointer<Void> sdk_routing_IndoorLocationDataInternal_toFfi_nullable(IndoorLocationDataInternal value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_IndoorLocationDataInternal_toFfi(value);
  final result = _sdk_routing_IndoorLocationDataInternal_create_handle_nullable(_handle);
  sdk_routing_IndoorLocationDataInternal_releaseFfiHandle(_handle);
  return result;
}

IndoorLocationDataInternal sdk_routing_IndoorLocationDataInternal_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_IndoorLocationDataInternal_get_value_nullable(handle);
  final result = sdk_routing_IndoorLocationDataInternal_fromFfi(_handle);
  sdk_routing_IndoorLocationDataInternal_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_IndoorLocationDataInternal_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_IndoorLocationDataInternal_release_handle_nullable(handle);

// End of IndoorLocationDataInternal "private" section.

