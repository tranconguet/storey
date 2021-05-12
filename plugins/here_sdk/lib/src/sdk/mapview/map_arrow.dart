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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A visual representation of an arrow on the map.
///
/// It consists of a polyline with an arbitrary
/// number of points and an arrow tip at its end. The map arrows are only visible on zoom levels
/// above 13.
///
/// To display the map arrow, it needs to be added to the scene using [MapScene.addMapArrow].
/// To stop displaying it, remove it from the scene using [MapScene.removeMapArrow].
abstract class MapArrow {
  /// Creates a new MapArrow instance
  ///
  /// [geometry] The geometry of the arrow. The last coordinate in the list defines the position where the
  /// tip of the arrow is located.
  ///
  /// [widthInPixels] The width of the arrow line in pixel. The tip is scaled accordingly.
  ///
  /// [color] The color with which to render the arrow.
  ///
  factory MapArrow(GeoPolyline geometry, double widthInPixels, ui.Color color) => MapArrow$Impl.$init(geometry, widthInPixels, color);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();


  /// @nodoc
  int internalgetId();
}


// MapArrow "private" section, not exported.

final _sdk_mapview_MapArrow_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapArrow_copy_handle'));
final _sdk_mapview_MapArrow_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapArrow_release_handle'));
final __are_equal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapArrow_are_equal'));


class MapArrow$Impl implements MapArrow {
  @protected
  Pointer<Void> handle;

  MapArrow$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _sdk_mapview_MapArrow_release_handle(handle);
    handle = null;
  }


  MapArrow$Impl.$init(GeoPolyline geometry, double widthInPixels, ui.Color color) : handle = _$init(geometry, widthInPixels, color) {
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }

  static Pointer<Void> _$init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapArrow_make__GeoPolyline_Double_Color'));
    final _geometry_handle = sdk_core_GeoPolyline_toFfi(geometry);
    final _widthInPixels_handle = (widthInPixels);
    final _color_handle = sdk_core_Color_toFfi(color);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _geometry_handle, _widthInPixels_handle, _color_handle);
    sdk_core_GeoPolyline_releaseFfiHandle(_geometry_handle);
    (_widthInPixels_handle);
    sdk_core_Color_releaseFfiHandle(_color_handle);
    return __result_handle;
  }

  @override
  int internalgetId() {
    final _getId_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapArrow_getId'));
    final _handle = this.handle;
    final __result_handle = _getId_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapArrow$Impl) return false;
    return __are_equal((this as MapArrow$Impl).handle, other.handle) != 0;
  }

}

Pointer<Void> sdk_mapview_MapArrow_toFfi(MapArrow value) =>
  _sdk_mapview_MapArrow_copy_handle((value as MapArrow$Impl).handle);

MapArrow sdk_mapview_MapArrow_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapArrow;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapArrow_copy_handle(handle);
  final result = MapArrow$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdk_mapview_MapArrow_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapArrow_release_handle(handle);

Pointer<Void> sdk_mapview_MapArrow_toFfi_nullable(MapArrow value) =>
  value != null ? sdk_mapview_MapArrow_toFfi(value) : Pointer<Void>.fromAddress(0);

MapArrow sdk_mapview_MapArrow_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapArrow_fromFfi(handle) : null;

void sdk_mapview_MapArrow_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapArrow_release_handle(handle);

// End of MapArrow "private" section.

