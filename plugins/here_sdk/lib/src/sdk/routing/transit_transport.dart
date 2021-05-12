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

import 'dart:ui' as ui;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/routing/transit_mode.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Holds all the transit transport information.

class TransitTransport {
  /// Transit mode of transport in the route.
  TransitMode mode;

  /// Transit line name.
  String name;

  /// Transit line headsign.
  String headsign;

  /// Human readable transport category (such as Bus, Gondola, Tram, Train, ...)
  String category;

  /// Color of the transport polyline and background for the transport name.
  ui.Color color;

  /// Color of the transport name.
  ui.Color textColor;


  TransitTransport(this.mode, this.name, this.headsign, this.category, this.color, this.textColor);


}


// TransitTransport "private" section, not exported.

final _sdk_routing_TransitTransport_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_create_handle'));
final _sdk_routing_TransitTransport_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_release_handle'));
final _sdk_routing_TransitTransport_get_field_mode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_mode'));
final _sdk_routing_TransitTransport_get_field_name = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_name'));
final _sdk_routing_TransitTransport_get_field_headsign = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_headsign'));
final _sdk_routing_TransitTransport_get_field_category = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_category'));
final _sdk_routing_TransitTransport_get_field_color = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_color'));
final _sdk_routing_TransitTransport_get_field_textColor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_textColor'));

Pointer<Void> sdk_routing_TransitTransport_toFfi(TransitTransport value) {
  final _mode_handle = sdk_routing_TransitMode_toFfi(value.mode);
  final _name_handle = String_toFfi_nullable(value.name);
  final _headsign_handle = String_toFfi_nullable(value.headsign);
  final _category_handle = String_toFfi_nullable(value.category);
  final _color_handle = sdk_core_Color_toFfi_nullable(value.color);
  final _textColor_handle = sdk_core_Color_toFfi_nullable(value.textColor);
  final _result = _sdk_routing_TransitTransport_create_handle(_mode_handle, _name_handle, _headsign_handle, _category_handle, _color_handle, _textColor_handle);
  sdk_routing_TransitMode_releaseFfiHandle(_mode_handle);
  String_releaseFfiHandle_nullable(_name_handle);
  String_releaseFfiHandle_nullable(_headsign_handle);
  String_releaseFfiHandle_nullable(_category_handle);
  sdk_core_Color_releaseFfiHandle_nullable(_color_handle);
  sdk_core_Color_releaseFfiHandle_nullable(_textColor_handle);
  return _result;
}

TransitTransport sdk_routing_TransitTransport_fromFfi(Pointer<Void> handle) {
  final _mode_handle = _sdk_routing_TransitTransport_get_field_mode(handle);
  final _name_handle = _sdk_routing_TransitTransport_get_field_name(handle);
  final _headsign_handle = _sdk_routing_TransitTransport_get_field_headsign(handle);
  final _category_handle = _sdk_routing_TransitTransport_get_field_category(handle);
  final _color_handle = _sdk_routing_TransitTransport_get_field_color(handle);
  final _textColor_handle = _sdk_routing_TransitTransport_get_field_textColor(handle);
  try {
    return TransitTransport(
      sdk_routing_TransitMode_fromFfi(_mode_handle), 
      String_fromFfi_nullable(_name_handle), 
      String_fromFfi_nullable(_headsign_handle), 
      String_fromFfi_nullable(_category_handle), 
      sdk_core_Color_fromFfi_nullable(_color_handle), 
      sdk_core_Color_fromFfi_nullable(_textColor_handle)
    );
  } finally {
    sdk_routing_TransitMode_releaseFfiHandle(_mode_handle);
    String_releaseFfiHandle_nullable(_name_handle);
    String_releaseFfiHandle_nullable(_headsign_handle);
    String_releaseFfiHandle_nullable(_category_handle);
    sdk_core_Color_releaseFfiHandle_nullable(_color_handle);
    sdk_core_Color_releaseFfiHandle_nullable(_textColor_handle);
  }
}

void sdk_routing_TransitTransport_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TransitTransport_release_handle(handle);

// Nullable TransitTransport

final _sdk_routing_TransitTransport_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_create_handle_nullable'));
final _sdk_routing_TransitTransport_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_release_handle_nullable'));
final _sdk_routing_TransitTransport_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_value_nullable'));

Pointer<Void> sdk_routing_TransitTransport_toFfi_nullable(TransitTransport value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitTransport_toFfi(value);
  final result = _sdk_routing_TransitTransport_create_handle_nullable(_handle);
  sdk_routing_TransitTransport_releaseFfiHandle(_handle);
  return result;
}

TransitTransport sdk_routing_TransitTransport_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitTransport_get_value_nullable(handle);
  final result = sdk_routing_TransitTransport_fromFfi(_handle);
  sdk_routing_TransitTransport_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitTransport_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitTransport_release_handle_nullable(handle);

// End of TransitTransport "private" section.

