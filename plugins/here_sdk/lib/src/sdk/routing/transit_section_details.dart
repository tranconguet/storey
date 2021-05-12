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

import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/agency.dart';
import 'package:here_sdk/src/sdk/routing/attribution.dart';
import 'package:here_sdk/src/sdk/routing/fare.dart';
import 'package:here_sdk/src/sdk/routing/transit_incident.dart';
import 'package:here_sdk/src/sdk/routing/transit_stop.dart';
import 'package:here_sdk/src/sdk/routing/transit_transport.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Gives the details of a transit section.

class TransitSectionDetails {
  /// Transit transport information.
  TransitTransport transport;

  /// All the intermediate stops between departure and destination of this section.
  List<TransitStop> intermediateStops;

  /// Contains information about a particular agency.
  Agency agency;

  /// List of required attributions to display.
  List<Attribution> attributions;

  /// List of tickets to pay for this section of the route.
  List<Fare> fares;

  /// A list of all incidents that apply to the section.
  List<TransitIncident> incidents;


  TransitSectionDetails(this.transport, this.intermediateStops, this.agency, this.attributions, this.fares, this.incidents);


  TransitSectionDetails.withDefaults(List<TransitStop> intermediateStops, Agency agency, List<Attribution> attributions, List<Fare> fares, List<TransitIncident> incidents)
    : transport = null, intermediateStops = intermediateStops, agency = agency, attributions = attributions, fares = fares, incidents = incidents;

}


// TransitSectionDetails "private" section, not exported.

final _sdk_routing_TransitSectionDetails_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_create_handle'));
final _sdk_routing_TransitSectionDetails_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_release_handle'));
final _sdk_routing_TransitSectionDetails_get_field_transport = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_transport'));
final _sdk_routing_TransitSectionDetails_get_field_intermediateStops = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_intermediateStops'));
final _sdk_routing_TransitSectionDetails_get_field_agency = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_agency'));
final _sdk_routing_TransitSectionDetails_get_field_attributions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_attributions'));
final _sdk_routing_TransitSectionDetails_get_field_fares = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_fares'));
final _sdk_routing_TransitSectionDetails_get_field_incidents = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_incidents'));

Pointer<Void> sdk_routing_TransitSectionDetails_toFfi(TransitSectionDetails value) {
  final _transport_handle = sdk_routing_TransitTransport_toFfi_nullable(value.transport);
  final _intermediateStops_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_TransitStop_toFfi(value.intermediateStops);
  final _agency_handle = sdk_routing_Agency_toFfi(value.agency);
  final _attributions_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Attribution_toFfi(value.attributions);
  final _fares_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Fare_toFfi(value.fares);
  final _incidents_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_TransitIncident_toFfi(value.incidents);
  final _result = _sdk_routing_TransitSectionDetails_create_handle(_transport_handle, _intermediateStops_handle, _agency_handle, _attributions_handle, _fares_handle, _incidents_handle);
  sdk_routing_TransitTransport_releaseFfiHandle_nullable(_transport_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_TransitStop_releaseFfiHandle(_intermediateStops_handle);
  sdk_routing_Agency_releaseFfiHandle(_agency_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Attribution_releaseFfiHandle(_attributions_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Fare_releaseFfiHandle(_fares_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_TransitIncident_releaseFfiHandle(_incidents_handle);
  return _result;
}

TransitSectionDetails sdk_routing_TransitSectionDetails_fromFfi(Pointer<Void> handle) {
  final _transport_handle = _sdk_routing_TransitSectionDetails_get_field_transport(handle);
  final _intermediateStops_handle = _sdk_routing_TransitSectionDetails_get_field_intermediateStops(handle);
  final _agency_handle = _sdk_routing_TransitSectionDetails_get_field_agency(handle);
  final _attributions_handle = _sdk_routing_TransitSectionDetails_get_field_attributions(handle);
  final _fares_handle = _sdk_routing_TransitSectionDetails_get_field_fares(handle);
  final _incidents_handle = _sdk_routing_TransitSectionDetails_get_field_incidents(handle);
  try {
    return TransitSectionDetails(
      sdk_routing_TransitTransport_fromFfi_nullable(_transport_handle), 
      heresdk_routing_common_bindings_ListOf_sdk_routing_TransitStop_fromFfi(_intermediateStops_handle), 
      sdk_routing_Agency_fromFfi(_agency_handle), 
      heresdk_routing_common_bindings_ListOf_sdk_routing_Attribution_fromFfi(_attributions_handle), 
      heresdk_routing_common_bindings_ListOf_sdk_routing_Fare_fromFfi(_fares_handle), 
      heresdk_routing_common_bindings_ListOf_sdk_routing_TransitIncident_fromFfi(_incidents_handle)
    );
  } finally {
    sdk_routing_TransitTransport_releaseFfiHandle_nullable(_transport_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_TransitStop_releaseFfiHandle(_intermediateStops_handle);
    sdk_routing_Agency_releaseFfiHandle(_agency_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_Attribution_releaseFfiHandle(_attributions_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_Fare_releaseFfiHandle(_fares_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_TransitIncident_releaseFfiHandle(_incidents_handle);
  }
}

void sdk_routing_TransitSectionDetails_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TransitSectionDetails_release_handle(handle);

// Nullable TransitSectionDetails

final _sdk_routing_TransitSectionDetails_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_create_handle_nullable'));
final _sdk_routing_TransitSectionDetails_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_release_handle_nullable'));
final _sdk_routing_TransitSectionDetails_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_value_nullable'));

Pointer<Void> sdk_routing_TransitSectionDetails_toFfi_nullable(TransitSectionDetails value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransitSectionDetails_toFfi(value);
  final result = _sdk_routing_TransitSectionDetails_create_handle_nullable(_handle);
  sdk_routing_TransitSectionDetails_releaseFfiHandle(_handle);
  return result;
}

TransitSectionDetails sdk_routing_TransitSectionDetails_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransitSectionDetails_get_value_nullable(handle);
  final result = sdk_routing_TransitSectionDetails_fromFfi(_handle);
  sdk_routing_TransitSectionDetails_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransitSectionDetails_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransitSectionDetails_release_handle_nullable(handle);

// End of TransitSectionDetails "private" section.

