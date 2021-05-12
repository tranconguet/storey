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

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A span is a part of the [Section] which is traversable or navigable.
///
/// Each span
/// usually has some geometry associated with it.
abstract class Span {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// Gets the geographic coordinates that make up the polyline of this span.
  List<GeoCoordinates> get polyline;





  /// Gets the length of this span in meters.
  int get lengthInMeters;





  /// Gets the list of indexes to [Section.sectionNotices] the parent section owns.
  /// In case the list is not empty, the user must judge all the indexed [SectionNotice]'s
  /// carefully before proceeding.
  List<int> get noticeIndexes;



}


// Span "private" section, not exported.

final _sdk_routing_Span_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Span_copy_handle'));
final _sdk_routing_Span_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Span_release_handle'));

class Span$Impl implements Span {
  @protected
  Pointer<Void> handle;

  Span$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _sdk_routing_Span_release_handle(handle);
    handle = null;
  }

  @override
  List<GeoCoordinates> get polyline {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_polyline_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(__result_handle);
    } finally {
      heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
    }
  }


  @override
  int get lengthInMeters {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_lengthInMeters_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  List<int> get noticeIndexes {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_noticeIndexes_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdk_routing_common_bindings_ListOf_Int_fromFfi(__result_handle);
    } finally {
      heresdk_routing_common_bindings_ListOf_Int_releaseFfiHandle(__result_handle);
    }
  }



}

Pointer<Void> sdk_routing_Span_toFfi(Span value) =>
  _sdk_routing_Span_copy_handle((value as Span$Impl).handle);

Span sdk_routing_Span_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as Span;
  if (instance != null) return instance;

  final _copied_handle = _sdk_routing_Span_copy_handle(handle);
  final result = Span$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdk_routing_Span_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_routing_Span_release_handle(handle);

Pointer<Void> sdk_routing_Span_toFfi_nullable(Span value) =>
  value != null ? sdk_routing_Span_toFfi(value) : Pointer<Void>.fromAddress(0);

Span sdk_routing_Span_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_routing_Span_fromFfi(handle) : null;

void sdk_routing_Span_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Span_release_handle(handle);

// End of Span "private" section.

