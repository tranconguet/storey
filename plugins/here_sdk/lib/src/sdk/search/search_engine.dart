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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/search/address_query.dart';
import 'package:here_sdk/src/sdk/search/category_query.dart';
import 'package:here_sdk/src/sdk/search/place_id_query.dart';
import 'package:here_sdk/src/sdk/search/place_id_search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_error.dart';
import 'package:here_sdk/src/sdk/search/search_options.dart';
import 'package:here_sdk/src/sdk/search/suggest_callback.dart';
import 'package:here_sdk/src/sdk/search/text_query.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// The SearchEngine API unlocks the search, geocoding and suggesting capabilities of HERE services
/// to provide developers with unmatched flexibility to create differentiating location-enabled
/// applications.
///
/// It enables to search for HERE points of interests, forward and reverse
/// geocode addresses and geographic coordinates from the HERE map and search for suggested addresses or
/// place candidates based on incomplete or misspelled queries.
/// It also allows to search along a given [GeoPolyline] set inside a [GeoCorridor]
/// as part of a [TextQuery].
/// The SearchEngine API requires an online connection to execute the requests.
abstract class SearchEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SearchEngine() => SearchEngine$Impl.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SearchEngine.withSdkEngine(SDKNativeEngine sdkEngine) => SearchEngine$Impl.withSdkEngine(sdkEngine);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Performs an asynchronous request to do a text query search for [Place] instances.
  ///
  /// Optionally, search along a polyline, such as a route, by specifying a [GeoCorridor].
  /// Provides candidate places sorted by relevance.
  ///
  /// [query] Desired free-form text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places based on a given address.
  ///
  /// This is the same process as forward geocoding, except that more data is returned
  /// than just the geographic coordinates of a given address. Note that an address can
  /// belong to more than one [Place] result, although all found places will
  /// share the same geographic coordinates.
  /// Provides candidate places sorted by relevance.
  ///
  /// [query] Desired free-form address query text to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for a [Place] based on its ID and [LanguageCode].
  ///
  /// [query] The id of place to search.
  ///
  /// [languageCode] The preferred language for the search results. When unset or unsupported language is chosen,
  /// results will be returned in their local language.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode languageCode, PlaceIdSearchCallback callback);
  /// Performs an asynchronous request to search for places based on given geographic coordinates.
  ///
  /// This is the same process as reverse geocoding, except that more data is returned
  /// than just the [Address] that belongs to given coordinates. Note that coordinates can
  /// belong to more than one [Place] result, but all found places will
  /// share the same coordinates.
  /// Provides candidate places sorted by relevance.
  ///
  /// [coordinates] The coordinates where to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request by using the given href.
  ///
  /// The href value can be obtained from [Suggestion] objects,
  /// which are the result of successful call to [SearchEngine.suggest].
  /// Currently supports only /v1/discover path.
  /// Provides candidate places sorted by relevance.
  ///
  /// [href] The direct link.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle sendRequest(String href, SearchCallback callback);
  /// Performs an asynchronous request to do a category search for [Place] instances.
  ///
  /// A list containing at least one [PlaceCategory] must be provided
  /// as part of the [SearchEngine.searchByCategory.query].
  ///
  /// [query] Query with list of desired categories.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to suggest places for text queries and
  /// returns candidate suggestions sorted by relevance.
  ///
  /// [query] Desired text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback);
  /// Sets custom option.
  ///
  /// [name] Option name.
  ///
  /// [value] Option value.
  ///
  /// Returns [SearchError]. Error in case when setting the option fails.
  ///
  SearchError setCustomOption(String name, String value);
}


// SearchEngine "private" section, not exported.

final _sdk_search_SearchEngine_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_copy_handle'));
final _sdk_search_SearchEngine_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_release_handle'));

final _$init_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_release_handle'));
final _$init_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_get_result'));
final _$init_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_get_error'));
final _$init_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_has_error'));


final _withSdkEngine_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngine_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEngine_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEngine_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_has_error'));










class SearchEngine$Impl implements SearchEngine {
  @protected
  Pointer<Void> handle;

  SearchEngine$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _sdk_search_SearchEngine_release_handle(handle);
    handle = null;
  }


  SearchEngine$Impl.$init() : handle = _$init() {
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }


  SearchEngine$Impl.withSdkEngine(SDKNativeEngine sdkEngine) : handle = _withSdkEngine(sdkEngine) {
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }

  static Pointer<Void> _$init() {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_search_SearchEngine_make'));
    final __call_result_handle = _$init_ffi(__lib.LibraryContext.isolateId);
    if (_$init_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _$init_return_get_error(__call_result_handle);
        _$init_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _$init_return_get_result(__call_result_handle);
    _$init_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngine_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine'));
    final _sdkEngine_handle = sdk_core_engine_SDKNativeEngine_toFfi(sdkEngine);
    final __call_result_handle = _withSdkEngine_ffi(__lib.LibraryContext.isolateId, _sdkEngine_handle);
    sdk_core_engine_SDKNativeEngine_releaseFfiHandle(_sdkEngine_handle);
    if (_withSdkEngine_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _withSdkEngine_return_get_error(__call_result_handle);
        _withSdkEngine_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _withSdkEngine_return_get_result(__call_result_handle);
    _withSdkEngine_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  @override
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByText_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__TextQuery_SearchOptions_SearchCallback'));
    final _query_handle = sdk_search_TextQuery_toFfi(query);
    final _options_handle = sdk_search_SearchOptions_toFfi(options);
    final _callback_handle = sdk_search_SearchCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _searchByText_ffi(_handle, __lib.LibraryContext.isolateId, _query_handle, _options_handle, _callback_handle);
    sdk_search_TextQuery_releaseFfiHandle(_query_handle);
    sdk_search_SearchOptions_releaseFfiHandle(_options_handle);
    sdk_search_SearchCallback_releaseFfiHandle(_callback_handle);
    try {
      return sdk_core_threading_TaskHandle_fromFfi(__result_handle);
    } finally {
      sdk_core_threading_TaskHandle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByAddress_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__AddressQuery_SearchOptions_SearchCallback'));
    final _query_handle = sdk_search_AddressQuery_toFfi(query);
    final _options_handle = sdk_search_SearchOptions_toFfi(options);
    final _callback_handle = sdk_search_SearchCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _searchByAddress_ffi(_handle, __lib.LibraryContext.isolateId, _query_handle, _options_handle, _callback_handle);
    sdk_search_AddressQuery_releaseFfiHandle(_query_handle);
    sdk_search_SearchOptions_releaseFfiHandle(_options_handle);
    sdk_search_SearchCallback_releaseFfiHandle(_callback_handle);
    try {
      return sdk_core_threading_TaskHandle_fromFfi(__result_handle);
    } finally {
      sdk_core_threading_TaskHandle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode languageCode, PlaceIdSearchCallback callback) {
    final _searchByPlaceIdWithLanguageCode_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__PlaceIdQuery_LanguageCode_PlaceIdSearchCallback'));
    final _query_handle = sdk_search_PlaceIdQuery_toFfi(query);
    final _languageCode_handle = sdk_core_LanguageCode_toFfi_nullable(languageCode);
    final _callback_handle = sdk_search_PlaceIdSearchCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _searchByPlaceIdWithLanguageCode_ffi(_handle, __lib.LibraryContext.isolateId, _query_handle, _languageCode_handle, _callback_handle);
    sdk_search_PlaceIdQuery_releaseFfiHandle(_query_handle);
    sdk_core_LanguageCode_releaseFfiHandle_nullable(_languageCode_handle);
    sdk_search_PlaceIdSearchCallback_releaseFfiHandle(_callback_handle);
    try {
      return sdk_core_threading_TaskHandle_fromFfi(__result_handle);
    } finally {
      sdk_core_threading_TaskHandle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback) {
    final _searchByCoordinates_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__GeoCoordinates_SearchOptions_SearchCallback'));
    final _coordinates_handle = sdk_core_GeoCoordinates_toFfi(coordinates);
    final _options_handle = sdk_search_SearchOptions_toFfi(options);
    final _callback_handle = sdk_search_SearchCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _searchByCoordinates_ffi(_handle, __lib.LibraryContext.isolateId, _coordinates_handle, _options_handle, _callback_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
    sdk_search_SearchOptions_releaseFfiHandle(_options_handle);
    sdk_search_SearchCallback_releaseFfiHandle(_callback_handle);
    try {
      return sdk_core_threading_TaskHandle_fromFfi(__result_handle);
    } finally {
      sdk_core_threading_TaskHandle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  TaskHandle sendRequest(String href, SearchCallback callback) {
    final _sendRequest_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_sendRequest__String_SearchCallback'));
    final _href_handle = String_toFfi(href);
    final _callback_handle = sdk_search_SearchCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _sendRequest_ffi(_handle, __lib.LibraryContext.isolateId, _href_handle, _callback_handle);
    String_releaseFfiHandle(_href_handle);
    sdk_search_SearchCallback_releaseFfiHandle(_callback_handle);
    try {
      return sdk_core_threading_TaskHandle_fromFfi(__result_handle);
    } finally {
      sdk_core_threading_TaskHandle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByCategory_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__CategoryQuery_SearchOptions_SearchCallback'));
    final _query_handle = sdk_search_CategoryQuery_toFfi(query);
    final _options_handle = sdk_search_SearchOptions_toFfi(options);
    final _callback_handle = sdk_search_SearchCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _searchByCategory_ffi(_handle, __lib.LibraryContext.isolateId, _query_handle, _options_handle, _callback_handle);
    sdk_search_CategoryQuery_releaseFfiHandle(_query_handle);
    sdk_search_SearchOptions_releaseFfiHandle(_options_handle);
    sdk_search_SearchCallback_releaseFfiHandle(_callback_handle);
    try {
      return sdk_core_threading_TaskHandle_fromFfi(__result_handle);
    } finally {
      sdk_core_threading_TaskHandle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback) {
    final _suggest_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_suggest__TextQuery_SearchOptions_SuggestCallback'));
    final _query_handle = sdk_search_TextQuery_toFfi(query);
    final _options_handle = sdk_search_SearchOptions_toFfi(options);
    final _callback_handle = sdk_search_SuggestCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _suggest_ffi(_handle, __lib.LibraryContext.isolateId, _query_handle, _options_handle, _callback_handle);
    sdk_search_TextQuery_releaseFfiHandle(_query_handle);
    sdk_search_SearchOptions_releaseFfiHandle(_options_handle);
    sdk_search_SuggestCallback_releaseFfiHandle(_callback_handle);
    try {
      return sdk_core_threading_TaskHandle_fromFfi(__result_handle);
    } finally {
      sdk_core_threading_TaskHandle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  SearchError setCustomOption(String name, String value) {
    final _setCustomOption_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_setCustomOption__String_String'));
    final _name_handle = String_toFfi(name);
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _setCustomOption_ffi(_handle, __lib.LibraryContext.isolateId, _name_handle, _value_handle);
    String_releaseFfiHandle(_name_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return sdk_search_SearchError_fromFfi_nullable(__result_handle);
    } finally {
      sdk_search_SearchError_releaseFfiHandle_nullable(__result_handle);
    }
  }


}

Pointer<Void> sdk_search_SearchEngine_toFfi(SearchEngine value) =>
  _sdk_search_SearchEngine_copy_handle((value as SearchEngine$Impl).handle);

SearchEngine sdk_search_SearchEngine_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as SearchEngine;
  if (instance != null) return instance;

  final _copied_handle = _sdk_search_SearchEngine_copy_handle(handle);
  final result = SearchEngine$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdk_search_SearchEngine_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_search_SearchEngine_release_handle(handle);

Pointer<Void> sdk_search_SearchEngine_toFfi_nullable(SearchEngine value) =>
  value != null ? sdk_search_SearchEngine_toFfi(value) : Pointer<Void>.fromAddress(0);

SearchEngine sdk_search_SearchEngine_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_search_SearchEngine_fromFfi(handle) : null;

void sdk_search_SearchEngine_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_SearchEngine_release_handle(handle);

// End of SearchEngine "private" section.
