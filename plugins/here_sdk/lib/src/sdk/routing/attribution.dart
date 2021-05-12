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
import 'package:here_sdk/src/sdk/routing/attribution_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Holds all the data on a URL address to an external resource.

class Attribution {
  /// Unique identifier for the web link.
  /// It is used to deduplicate links defined in multiple sections.
  /// @nodoc
  String internalid;

  /// An URL address that links to a particular resource.
  String href;

  /// Text describing the url address (e.g. The example website).
  String text;

  /// The interactive (or clickable) portion of the text. If not present (default),
  /// the entire content of the text attribute will be considered.
  String hrefText;

  /// Attribution link type.
  AttributionType type;


  Attribution(this.internalid, this.href, this.text, this.hrefText, this.type);


  Attribution.withDefaults(String id, String text, AttributionType type)
    : internalid = id, href = null, text = text, hrefText = null, type = type;

}


// Attribution "private" section, not exported.

final _sdk_routing_Attribution_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_Attribution_create_handle'));
final _sdk_routing_Attribution_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_release_handle'));
final _sdk_routing_Attribution_get_field_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_id'));
final _sdk_routing_Attribution_get_field_href = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_href'));
final _sdk_routing_Attribution_get_field_text = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_text'));
final _sdk_routing_Attribution_get_field_hrefText = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_hrefText'));
final _sdk_routing_Attribution_get_field_type = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_type'));

Pointer<Void> sdk_routing_Attribution_toFfi(Attribution value) {
  final _id_handle = String_toFfi(value.internalid);
  final _href_handle = String_toFfi_nullable(value.href);
  final _text_handle = String_toFfi(value.text);
  final _hrefText_handle = String_toFfi_nullable(value.hrefText);
  final _type_handle = sdk_routing_AttributionType_toFfi(value.type);
  final _result = _sdk_routing_Attribution_create_handle(_id_handle, _href_handle, _text_handle, _hrefText_handle, _type_handle);
  String_releaseFfiHandle(_id_handle);
  String_releaseFfiHandle_nullable(_href_handle);
  String_releaseFfiHandle(_text_handle);
  String_releaseFfiHandle_nullable(_hrefText_handle);
  sdk_routing_AttributionType_releaseFfiHandle(_type_handle);
  return _result;
}

Attribution sdk_routing_Attribution_fromFfi(Pointer<Void> handle) {
  final _id_handle = _sdk_routing_Attribution_get_field_id(handle);
  final _href_handle = _sdk_routing_Attribution_get_field_href(handle);
  final _text_handle = _sdk_routing_Attribution_get_field_text(handle);
  final _hrefText_handle = _sdk_routing_Attribution_get_field_hrefText(handle);
  final _type_handle = _sdk_routing_Attribution_get_field_type(handle);
  try {
    return Attribution(
      String_fromFfi(_id_handle), 
      String_fromFfi_nullable(_href_handle), 
      String_fromFfi(_text_handle), 
      String_fromFfi_nullable(_hrefText_handle), 
      sdk_routing_AttributionType_fromFfi(_type_handle)
    );
  } finally {
    String_releaseFfiHandle(_id_handle);
    String_releaseFfiHandle_nullable(_href_handle);
    String_releaseFfiHandle(_text_handle);
    String_releaseFfiHandle_nullable(_hrefText_handle);
    sdk_routing_AttributionType_releaseFfiHandle(_type_handle);
  }
}

void sdk_routing_Attribution_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_Attribution_release_handle(handle);

// Nullable Attribution

final _sdk_routing_Attribution_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_create_handle_nullable'));
final _sdk_routing_Attribution_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_release_handle_nullable'));
final _sdk_routing_Attribution_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_value_nullable'));

Pointer<Void> sdk_routing_Attribution_toFfi_nullable(Attribution value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_Attribution_toFfi(value);
  final result = _sdk_routing_Attribution_create_handle_nullable(_handle);
  sdk_routing_Attribution_releaseFfiHandle(_handle);
  return result;
}

Attribution sdk_routing_Attribution_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_Attribution_get_value_nullable(handle);
  final result = sdk_routing_Attribution_fromFfi(_handle);
  sdk_routing_Attribution_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_Attribution_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Attribution_release_handle_nullable(handle);

// End of Attribution "private" section.

