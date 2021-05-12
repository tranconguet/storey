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

/// Notice codes which point the issues encountered during processing of a [Section].
///
/// **Note:** The section notice codes are going to be extended for new error situations.
enum SectionNoticeCode {
    /// Route has violoated a non-detailed critical rule. Severity: [NoticeSeverity.critical].
    violatedCriticalRule,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedAvoidControlledAccessHighway,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedAvoidTollRoad,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedAvoidFerry,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedAvoidTunnel,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedAvoidDirtRoad,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedAvoidRailFerry,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedAvoidPark,
    /// Route uses roads blocked by traffic events. Severity: [NoticeSeverity.critical].
    violatedBlockedRoad,
    /// Start direction of the route is not as requested. Severity: [NoticeSeverity.critical].
    violatedStartDirection,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedCarpool,
    /// Route uses a time-restricted turn. Severity: [NoticeSeverity.critical].
    violatedTurnRestriction,
    /// Route uses a road which is forbidden for the given vehicle profile. Severity: [NoticeSeverity.critical].
    violatedVehicleRestriction,
    /// Route uses a road which is part of restricted routing zones. Severity: [NoticeSeverity.critical].
    violatedZoneRestriction,
    /// Route did not manage to avoid user preference. Severity: [NoticeSeverity.critical].
    violatedAvoidDifficultTurns,
    /// Route goes through an emergency gate. Severity: [NoticeSeverity.critical].
    violatedEmergencyGate,
    /// This transit section violates a pedestrian option setting.
    /// Severity: [NoticeSeverity.info].
    violatedPedestrianOption,
    /// No schedule information is available for a transit section. As a result, departure/arrival times are approximated.
    /// Severity: [NoticeSeverity.info].
    noSchedule,
    /// Information about intermediate stops is not available for a transit section.
    /// Severity: [NoticeSeverity.info].
    noIntermediate,
    /// This transit section contains a transport mode that was explictly disabled.
    /// Mode filtering is not available in this area.
    /// Severity: [NoticeSeverity.info].
    unwantedMode,
    /// This transit section returned times which are scheduled times, even though delay information is available.
    /// Severity: [NoticeSeverity.info].
    scheduledTimes,
    /// An accurate polyline is not available for a transit section. For a pedestrian transit section, the returned
    /// polyline connects the departure and arrival places. Otherwise, the returned polyline connects consecutive stops
    /// with straight lines.
    /// Severity: [NoticeSeverity.info].
    simplePolyline
}

// SectionNoticeCode "private" section, not exported.

int sdk_routing_SectionNoticeCode_toFfi(SectionNoticeCode value) {
  switch (value) {
  case SectionNoticeCode.violatedCriticalRule:
    return 0;
  break;
  case SectionNoticeCode.violatedAvoidControlledAccessHighway:
    return 1;
  break;
  case SectionNoticeCode.violatedAvoidTollRoad:
    return 2;
  break;
  case SectionNoticeCode.violatedAvoidFerry:
    return 3;
  break;
  case SectionNoticeCode.violatedAvoidTunnel:
    return 4;
  break;
  case SectionNoticeCode.violatedAvoidDirtRoad:
    return 5;
  break;
  case SectionNoticeCode.violatedAvoidRailFerry:
    return 6;
  break;
  case SectionNoticeCode.violatedAvoidPark:
    return 7;
  break;
  case SectionNoticeCode.violatedBlockedRoad:
    return 8;
  break;
  case SectionNoticeCode.violatedStartDirection:
    return 9;
  break;
  case SectionNoticeCode.violatedCarpool:
    return 10;
  break;
  case SectionNoticeCode.violatedTurnRestriction:
    return 11;
  break;
  case SectionNoticeCode.violatedVehicleRestriction:
    return 12;
  break;
  case SectionNoticeCode.violatedZoneRestriction:
    return 13;
  break;
  case SectionNoticeCode.violatedAvoidDifficultTurns:
    return 14;
  break;
  case SectionNoticeCode.violatedEmergencyGate:
    return 15;
  break;
  case SectionNoticeCode.violatedPedestrianOption:
    return 16;
  break;
  case SectionNoticeCode.noSchedule:
    return 17;
  break;
  case SectionNoticeCode.noIntermediate:
    return 18;
  break;
  case SectionNoticeCode.unwantedMode:
    return 19;
  break;
  case SectionNoticeCode.scheduledTimes:
    return 20;
  break;
  case SectionNoticeCode.simplePolyline:
    return 21;
  break;
  default:
    throw StateError("Invalid enum value $value for SectionNoticeCode enum.");
  }
}

SectionNoticeCode sdk_routing_SectionNoticeCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return SectionNoticeCode.violatedCriticalRule;
  break;
  case 1:
    return SectionNoticeCode.violatedAvoidControlledAccessHighway;
  break;
  case 2:
    return SectionNoticeCode.violatedAvoidTollRoad;
  break;
  case 3:
    return SectionNoticeCode.violatedAvoidFerry;
  break;
  case 4:
    return SectionNoticeCode.violatedAvoidTunnel;
  break;
  case 5:
    return SectionNoticeCode.violatedAvoidDirtRoad;
  break;
  case 6:
    return SectionNoticeCode.violatedAvoidRailFerry;
  break;
  case 7:
    return SectionNoticeCode.violatedAvoidPark;
  break;
  case 8:
    return SectionNoticeCode.violatedBlockedRoad;
  break;
  case 9:
    return SectionNoticeCode.violatedStartDirection;
  break;
  case 10:
    return SectionNoticeCode.violatedCarpool;
  break;
  case 11:
    return SectionNoticeCode.violatedTurnRestriction;
  break;
  case 12:
    return SectionNoticeCode.violatedVehicleRestriction;
  break;
  case 13:
    return SectionNoticeCode.violatedZoneRestriction;
  break;
  case 14:
    return SectionNoticeCode.violatedAvoidDifficultTurns;
  break;
  case 15:
    return SectionNoticeCode.violatedEmergencyGate;
  break;
  case 16:
    return SectionNoticeCode.violatedPedestrianOption;
  break;
  case 17:
    return SectionNoticeCode.noSchedule;
  break;
  case 18:
    return SectionNoticeCode.noIntermediate;
  break;
  case 19:
    return SectionNoticeCode.unwantedMode;
  break;
  case 20:
    return SectionNoticeCode.scheduledTimes;
  break;
  case 21:
    return SectionNoticeCode.simplePolyline;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SectionNoticeCode enum.");
  }
}

void sdk_routing_SectionNoticeCode_releaseFfiHandle(int handle) {}

final _sdk_routing_SectionNoticeCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_SectionNoticeCode_create_handle_nullable'));
final _sdk_routing_SectionNoticeCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNoticeCode_release_handle_nullable'));
final _sdk_routing_SectionNoticeCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNoticeCode_get_value_nullable'));

Pointer<Void> sdk_routing_SectionNoticeCode_toFfi_nullable(SectionNoticeCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_SectionNoticeCode_toFfi(value);
  final result = _sdk_routing_SectionNoticeCode_create_handle_nullable(_handle);
  sdk_routing_SectionNoticeCode_releaseFfiHandle(_handle);
  return result;
}

SectionNoticeCode sdk_routing_SectionNoticeCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_SectionNoticeCode_get_value_nullable(handle);
  final result = sdk_routing_SectionNoticeCode_fromFfi(_handle);
  sdk_routing_SectionNoticeCode_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_SectionNoticeCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_SectionNoticeCode_release_handle_nullable(handle);

// End of SectionNoticeCode "private" section.

