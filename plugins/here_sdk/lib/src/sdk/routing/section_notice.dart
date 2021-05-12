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
import 'package:here_sdk/src/sdk/routing/notice_severity.dart';
import 'package:here_sdk/src/sdk/routing/section_notice_code.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Explains an issue encountered in a [Section].

class SectionNotice {
  /// The notice code.
  SectionNoticeCode code;

  /// The notice severity.
  NoticeSeverity severity;


  SectionNotice(this.code, this.severity);


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SectionNotice) return false;
    SectionNotice _other = other;
    return code == _other.code &&
        severity == _other.severity;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + code.hashCode;
    result = 31 * result + severity.hashCode;
    return result;
  }
}


// SectionNotice "private" section, not exported.

final _sdk_routing_SectionNotice_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_routing_SectionNotice_create_handle'));
final _sdk_routing_SectionNotice_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_release_handle'));
final _sdk_routing_SectionNotice_get_field_code = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_get_field_code'));
final _sdk_routing_SectionNotice_get_field_severity = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_get_field_severity'));

Pointer<Void> sdk_routing_SectionNotice_toFfi(SectionNotice value) {
  final _code_handle = sdk_routing_SectionNoticeCode_toFfi(value.code);
  final _severity_handle = sdk_routing_NoticeSeverity_toFfi(value.severity);
  final _result = _sdk_routing_SectionNotice_create_handle(_code_handle, _severity_handle);
  sdk_routing_SectionNoticeCode_releaseFfiHandle(_code_handle);
  sdk_routing_NoticeSeverity_releaseFfiHandle(_severity_handle);
  return _result;
}

SectionNotice sdk_routing_SectionNotice_fromFfi(Pointer<Void> handle) {
  final _code_handle = _sdk_routing_SectionNotice_get_field_code(handle);
  final _severity_handle = _sdk_routing_SectionNotice_get_field_severity(handle);
  try {
    return SectionNotice(
      sdk_routing_SectionNoticeCode_fromFfi(_code_handle), 
      sdk_routing_NoticeSeverity_fromFfi(_severity_handle)
    );
  } finally {
    sdk_routing_SectionNoticeCode_releaseFfiHandle(_code_handle);
    sdk_routing_NoticeSeverity_releaseFfiHandle(_severity_handle);
  }
}

void sdk_routing_SectionNotice_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_SectionNotice_release_handle(handle);

// Nullable SectionNotice

final _sdk_routing_SectionNotice_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_create_handle_nullable'));
final _sdk_routing_SectionNotice_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_release_handle_nullable'));
final _sdk_routing_SectionNotice_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNotice_get_value_nullable'));

Pointer<Void> sdk_routing_SectionNotice_toFfi_nullable(SectionNotice value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_SectionNotice_toFfi(value);
  final result = _sdk_routing_SectionNotice_create_handle_nullable(_handle);
  sdk_routing_SectionNotice_releaseFfiHandle(_handle);
  return result;
}

SectionNotice sdk_routing_SectionNotice_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_SectionNotice_get_value_nullable(handle);
  final result = sdk_routing_SectionNotice_fromFfi(_handle);
  sdk_routing_SectionNotice_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_SectionNotice_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_SectionNotice_release_handle_nullable(handle);

// End of SectionNotice "private" section.

