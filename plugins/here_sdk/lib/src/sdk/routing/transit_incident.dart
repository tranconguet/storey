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
import 'package:here_sdk/src/sdk/routing/transit_incident_effect.dart';
import 'package:here_sdk/src/sdk/routing/transit_incident_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A transit incident describes disruptions on the transit network.
///
/// Disruptions scale from delays to service cancellations.

class TransitIncident {
  /// A human readable summary of the incident.
  String summary;

  /// A human readable description of the incident
  String description;

  /// Type of the incident.
  TransitIncidentType type;

  /// Effect of the incident.
  TransitIncidentEffect effect;

  /// Valid from.
  DateTime validFrom;

  /// Valid until.
  DateTime validUntil;

  /// Link to the original incident published at the agency website.
  String url;


  TransitIncident(this.summary, this.description, this.type, this.effect, this.validFrom, this.validUntil, this.url);


}


// TransitIncident "private" section, not exported.

final _sdk_routing_TransitIncident_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_create_handle'));
final _sdk_routing_TransitIncident_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_release_handle'));
final _sdk_routing_TransitIncident_get_field_summary = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_summary'));
final _sdk_routing_TransitIncident_get_field_description = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_description'));
final _sdk_routing_TransitIncident_get_field_type = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_type'));
final _sdk_routing_TransitIncident_get_field_effect = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_effect'));
final _sdk_routing_TransitIncident_get_field_validFrom = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_validFrom'));
final _sdk_routing_TransitIncident_get_field_validUntil = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_validUntil'));
final _sdk_routing_TransitIncident_get_field_url = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_url'));

Pointer<Void> sdk_routing_TransitIncident_toFfi(TransitIncident value) {
  final _summary_handle = String_toFfi_nullable(value.summary);
  final _description_handle = String_toFfi_nullable(value.description);
  final _type_handle = sdk_routing_TransitIncidentType_toFfi_nullable(value.type);
  final _effect_handle = sdk_routing_TransitIncidentEffect_toFfi_nullable(value.effect);
  final _validFrom_handle = Date_toFfi_nullable(value.validFrom);
  final _validUntil_handle = Date_toFfi_nullable(value.validUntil);
  final _url_handle = String_toFfi_nullable(value.url);
  final _result = _sdk_routing_TransitIncident_create_handle(_summary_handle, _description_handle, _type_handle, _effect_handle, _validFrom_handle, _validUntil_handle, _url_handle);
  String_releaseFfiHandle_nullable(_summary_handle);
  String_releaseFfiHandle_nullable(_description_handle);
  sdk_routing_TransitIncidentType_releaseFfiHandle_nullable(_type_handle);
  sdk_routing_TransitIncidentEffect_releaseFfiHandle_nullable(_effect_handle);
  Date_releaseFfiHandle_nullable(_validFrom_handle);
  Date_releaseFfiHandle_nullable(_validUntil_handle);
  String_releaseFfiHandle_nullable(_url_handle);
  return _result;
}

TransitIncident sdk_routing_TransitIncident_fromFfi(Pointer<Void> handle) {
  final _summary_handle = _sdk_routing_TransitIncident_get_field_summary(handle);
  final _description_handle = _sdk_routing_TransitIncident_get_field_description(handle);
  final _type_handle = _sdk_routing_TransitIncident_get_field_type(handle);
  final _effect_handle = _sdk_routing_TransitIncident_get_field_effect(handle);
  final _validFrom_handle = _sdk_routing_TransitIncident_get_field_validFrom(handle);
  final _validUntil_handle = _sdk_routing_TransitIncident_get_field_validUntil(handle);
  final _url_handle = _sdk_routing_TransitIncident_get_field_url(handle);
  try {
    return TransitIncident(
      String_fromFfi_nullable(_summary_handle), 
      String_fromFfi_nullable(_description_handle), 
      sdk_routing_TransitIncidentType_fromFfi_nullable(_type_handle), 
      sdk_routing_TransitIncidentEffect_fromFfi_nullable(_effect_handle), 
      Date_fromFfi_nullable(_validFrom_handle), 
      Date_fromFfi_nullable(_validUntil_handle), 
      String_fromFfi_nullable(_url_handle)
    );
  } finally {
    String_releaseFfiHandle_nullable(_summary_handle);
    String_releaseFfiHandle_nullable(_description_handle);
    sdk_routing_TransitIncidentType_releaseFfiHandle_nullable(_type_handle);
    sdk_routing_TransitIncidentEffect_releaseFfiHandle_nullable(_effect_handle);
    Date_releaseFfiHandle_nullable(_validFrom_handle);
    Date_releaseFfiHandle_nullable(_validUntil_handle);
    String_releaseFfiHandle_nullable(_url_handle);
  }
}

void sdk_routing_TransitIncident_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TransitIncident_release_handle(handle);

// Nullable TransitIncident

final _sdk_routing_TransitIncident_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_create_handle_nullable'));
final _sdk_routing_TransitIncident_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_release_handle_nullable'));
final _sdk_routing_TransitIncident_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_value_nullable'));

Pointer<Void> sdk_routing_TransitIncident_toFfi_nullable(TransitIncident value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitIncident_toFfi(value);
  final result = _sdk_routing_TransitIncident_create_handle_nullable(_handle);
  sdk_routing_TransitIncident_releaseFfiHandle(_handle);
  return result;
}

TransitIncident sdk_routing_TransitIncident_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitIncident_get_value_nullable(handle);
  final result = sdk_routing_TransitIncident_fromFfi(_handle);
  sdk_routing_TransitIncident_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitIncident_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitIncident_release_handle_nullable(handle);

// End of TransitIncident "private" section.

