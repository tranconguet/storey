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

/// Defines the style of the HERE watermark logo.
///
/// The dark watermark should be used for custom
/// schemes that are brighter (like daytime) and the light watermark for darker custom schemes (like
/// night or satellite based).
enum WatermarkStyle {
    /// Dark watermark, to be used for brighter daytime map schemes.
    dark,
    /// Light watermark, to be used for darker map schemes like night or satellite.
    light
}

// WatermarkStyle "private" section, not exported.

int sdk_mapview_WatermarkStyle_toFfi(WatermarkStyle value) {
  switch (value) {
  case WatermarkStyle.dark:
    return 0;
  break;
  case WatermarkStyle.light:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for WatermarkStyle enum.");
  }
}

WatermarkStyle sdk_mapview_WatermarkStyle_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return WatermarkStyle.dark;
  break;
  case 1:
    return WatermarkStyle.light;
  break;
  default:
    throw StateError("Invalid numeric value $handle for WatermarkStyle enum.");
  }
}

void sdk_mapview_WatermarkStyle_releaseFfiHandle(int handle) {}

final _sdk_mapview_WatermarkStyle_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_WatermarkStyle_create_handle_nullable'));
final _sdk_mapview_WatermarkStyle_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_WatermarkStyle_release_handle_nullable'));
final _sdk_mapview_WatermarkStyle_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_WatermarkStyle_get_value_nullable'));

Pointer<Void> sdk_mapview_WatermarkStyle_toFfi_nullable(WatermarkStyle value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_WatermarkStyle_toFfi(value);
  final result = _sdk_mapview_WatermarkStyle_create_handle_nullable(_handle);
  sdk_mapview_WatermarkStyle_releaseFfiHandle(_handle);
  return result;
}

WatermarkStyle sdk_mapview_WatermarkStyle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_WatermarkStyle_get_value_nullable(handle);
  final result = sdk_mapview_WatermarkStyle_fromFfi(_handle);
  sdk_mapview_WatermarkStyle_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_WatermarkStyle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_WatermarkStyle_release_handle_nullable(handle);

// End of WatermarkStyle "private" section.

