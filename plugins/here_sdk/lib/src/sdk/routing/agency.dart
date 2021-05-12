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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Holds all the agency information.

class Agency {
  /// Unique code of the agency.
  /// Specifies if the same agency is used on different sections of the same route.
  /// @nodoc
  String internalid;

  /// Human readable name of the owner of the transport service.
  String name;

  /// Link to the agency's website.
  String website;

  /// Agency icon url.
  String icon;


  Agency(this.internalid, this.name, this.website, this.icon);


}


// Agency "private" section, not exported.

final _sdk_routing_Agency_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_create_handle'));
final _sdk_routing_Agency_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_release_handle'));
final _sdk_routing_Agency_get_field_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_field_id'));
final _sdk_routing_Agency_get_field_name = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_field_name'));
final _sdk_routing_Agency_get_field_website = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_field_website'));
final _sdk_routing_Agency_get_field_icon = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_field_icon'));

Pointer<Void> sdk_routing_Agency_toFfi(Agency value) {
  final _id_handle = String_toFfi(value.internalid);
  final _name_handle = String_toFfi(value.name);
  final _website_handle = String_toFfi_nullable(value.website);
  final _icon_handle = String_toFfi_nullable(value.icon);
  final _result = _sdk_routing_Agency_create_handle(_id_handle, _name_handle, _website_handle, _icon_handle);
  String_releaseFfiHandle(_id_handle);
  String_releaseFfiHandle(_name_handle);
  String_releaseFfiHandle_nullable(_website_handle);
  String_releaseFfiHandle_nullable(_icon_handle);
  return _result;
}

Agency sdk_routing_Agency_fromFfi(Pointer<Void> handle) {
  final _id_handle = _sdk_routing_Agency_get_field_id(handle);
  final _name_handle = _sdk_routing_Agency_get_field_name(handle);
  final _website_handle = _sdk_routing_Agency_get_field_website(handle);
  final _icon_handle = _sdk_routing_Agency_get_field_icon(handle);
  try {
    return Agency(
      String_fromFfi(_id_handle), 
      String_fromFfi(_name_handle), 
      String_fromFfi_nullable(_website_handle), 
      String_fromFfi_nullable(_icon_handle)
    );
  } finally {
    String_releaseFfiHandle(_id_handle);
    String_releaseFfiHandle(_name_handle);
    String_releaseFfiHandle_nullable(_website_handle);
    String_releaseFfiHandle_nullable(_icon_handle);
  }
}

void sdk_routing_Agency_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_Agency_release_handle(handle);

// Nullable Agency

final _sdk_routing_Agency_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_create_handle_nullable'));
final _sdk_routing_Agency_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_release_handle_nullable'));
final _sdk_routing_Agency_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_value_nullable'));

Pointer<Void> sdk_routing_Agency_toFfi_nullable(Agency value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_Agency_toFfi(value);
  final result = _sdk_routing_Agency_create_handle_nullable(_handle);
  sdk_routing_Agency_releaseFfiHandle(_handle);
  return result;
}

Agency sdk_routing_Agency_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_Agency_get_value_nullable(handle);
  final result = sdk_routing_Agency_fromFfi(_handle);
  sdk_routing_Agency_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_Agency_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Agency_release_handle_nullable(handle);

// End of Agency "private" section.

