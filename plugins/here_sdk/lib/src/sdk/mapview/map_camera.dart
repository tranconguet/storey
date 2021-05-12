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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/core/rectangle2_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_limits.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_observer.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents the camera looking onto the map.
///
/// Each MapView instance has exactly one camera that is used to manipulate
/// the way the map is displayed.
///
/// Any method that modifies the state of the camera will be enqueued and the state
/// will only be updated after drawing the next frame.
abstract class MapCamera {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Cancels any ongoing camera animation
  ///
  cancelAnimation();
  /// Adds an observer to this camera that will be notified on the main thread
  /// every time the map is redrawn with new camera parameters.
  ///
  /// Adding the same observer multiple times has no effect.
  ///
  /// [observer] The observer to add.
  ///
  addObserver(MapCameraObserver observer);
  /// Removes the observer from the camera.
  ///
  /// Trying to remove an observer that is not
  /// currently registered has no effect.
  ///
  /// [observer] The observer to remove.
  ///
  removeObserver(MapCameraObserver observer);
  /// Orbits the camera around a specified view point by increasing tilt and bearing by specified
  /// delta values.
  ///
  /// This command will be enqueued and new position will be set only
  /// after drawing the next frame.
  ///
  /// [delta] Camera orientation change, containing tilt and bearing angle deltas.
  ///
  /// [origin] Point in view coordinates around which orbiting occurs
  ///
  orbitBy(MapCameraOrientationUpdate delta, Point2D origin);
  /// Zooms in or out by a specified factor.
  ///
  /// This effectively changes the distance from the camera to the [MapCameraState.targetCoordinates]
  /// by the specified factor, which changes [MapCameraState.zoomLevel] as well.
  ///
  /// Values above 1.0 will zoom in and values below will zoom out.
  ///
  /// The relation with [MapCameraState.distanceToTargetInMeters] is inversely linear,
  /// meaning that zooming by 4 will decrease distance to target by 4 while zooming by 0.5
  /// will increase distance to target by 2.
  ///
  /// The relation with zoom level is exponential. Meaning that zooming by a factor of 4 will
  /// increase zoom level by 2 (because sqrt(4) == 2). So to zoom in by X zoom levels, the zoom
  /// factor needs to be 2^X. To zoom out by X zoom levels, zoom factor needs to be 1/(2^X).
  ///
  /// The zooming occurs around the specified origin inside the view.
  ///
  /// This command will be enqueued and new position will be set only
  /// after drawing the next frame.
  ///
  /// [factor] The zoom factor. Values above 1.0 will zoom in and values below will zoom out.
  ///
  /// [origin] Point in view coordinates around which zooming occurs
  ///
  zoomBy(double factor, Point2D origin);
  /// Zooms to the specified zoom level.
  ///
  /// The supplied value will be clamped to the range
  /// of \[0, 22\], where 0 is a view of whole globe and 22 is street level.
  ///
  /// This effectively changes the distance from the camera to the target.
  /// The zooming occurs around the current target point.
  ///
  /// This command will be enqueued and new position will be set only
  /// after drawing the next frame.
  ///
  /// [zoomLevel] The zoom level to set, clamped to the range of \[0, 22\].
  ///
  zoomTo(double zoomLevel);
  /// Makes the camera look at a new geodetic target, while
  /// preserving the current orientation and distance to the target.
  ///
  /// [target] Geodetic coordinates at which the camera will point.
  ///
  lookAtPoint(GeoCoordinates target);
  /// Makes the camera look at the geodetic target from the given distance.
  ///
  /// [target] Geodetic coordinates at which the camera will point.
  ///
  /// [distanceInMeters] Distance in meters to the target point.
  ///
  lookAtPointWithDistance(GeoCoordinates target, double distanceInMeters);
  /// Makes the camera look at the geodetic target from the given distance and orientation.
  ///
  /// The supplied orientation is the orientation of the camera looking
  /// at the target, so the resulting camera state will have the
  /// same orientation as the one supplied to this method.
  ///
  /// [target] Geodetic coordinates at which the camera will point.
  ///
  /// [orientation] Desired orientation of the camera.
  ///
  /// [distanceInMeters] Distance in meters to the target point.
  ///
  lookAtPointWithOrientationAndDistance(GeoCoordinates target, MapCameraOrientationUpdate orientation, double distanceInMeters);
  /// Makes the camera look at the specified geodetic area.
  ///
  /// The supplied orientation is the orientation of the camera looking
  /// at the target, so the resulting camera state will have the
  /// same orientation as the one supplied to this method.
  ///
  /// [target] Geodetic area at which the camera will point
  ///
  /// [orientation] Desired orientation of the camera
  ///
  lookAtAreaWithOrientation(GeoBox target, MapCameraOrientationUpdate orientation);
  /// Makes the camera look at current target from certain distance
  ///
  /// This function neither modifies target coordinates nor target orientation.
  ///
  /// [distanceInMeters] Distance in meters to the target point.
  /// Minimal distance value is clamped to 100 meters.
  ///
  setDistanceToTarget(double distanceInMeters);
  /// Changes camera orientation in relation to target.
  ///
  /// This command will be enqueued and new position will be set only
  /// after drawing the next frame.
  ///
  /// [orientation] Desired orientation of the camera.
  ///
  setTargetOrientation(MapCameraOrientationUpdate orientation);
  /// Animates the camera to the new position along an adaptive ballistic curve.<br>
  /// The beginning and end of the animation will use the current [MapCameraState.distanceToTargetInMeters],
  /// and its value will change during the animation.
  ///
  /// Note: The animation can be interrupted by gestures or any programmatic change
  /// of the camera's position or orientation.
  ///
  /// [target] The coordinates of the new target point
  ///
  flyTo(GeoCoordinates target);
  /// Animates the camera to the new position along a configurable adaptive ballistic curve.<br>
  /// The beginning and end of the animation will use the current [MapCameraState.distanceToTargetInMeters],
  /// and its value will change during the animation.
  ///
  /// Note: The animation can be interrupted by gestures or any programmatic change
  /// of the camera's position or orientation.
  ///
  /// [target] The coordinates of the new target point
  ///
  /// [animationOptions] The options of the ballistic curve.
  ///
  flyToWithOptions(GeoCoordinates target, MapCameraFlyToOptions animationOptions);
  /// Animates the camera to the new position along a configurable adaptive ballistic curve.<br>
  /// Note: The animation can be interrupted by gestures or any programmatic change
  /// of the camera's position or orientation.
  ///
  /// [target] The coordinates of the destination point.
  ///
  /// [distanceInMeters] The distance to target at destination.
  ///
  /// [animationOptions] The options of the ballistic curve.
  ///
  flyToWithOptionsAndDistance(GeoCoordinates target, double distanceInMeters, MapCameraFlyToOptions animationOptions);
  /// Animates the camera to the new position along a configurable adaptive ballistic curve.<br>
  /// Note: The animation can be interrupted by gestures or any programmatic change
  /// of the camera's position or orientation.
  ///
  /// [target] The coordinates of the destination point.
  ///
  /// [orientation] The orientation at destination.
  ///
  /// [animationOptions] The options of the ballistic curve.
  ///
  flyToWithOptionsAndOrientation(GeoCoordinates target, MapCameraOrientationUpdate orientation, MapCameraFlyToOptions animationOptions);
  /// Animates the camera to the new position along a configurable adaptive ballistic curve.<br>
  /// Note: The animation can be interrupted by gestures or any programmatic change
  /// of the camera's position or orientation.
  ///
  /// [target] The coordinates of the destination point.
  ///
  /// [orientation] The orientation at destination.
  ///
  /// [distanceInMeters] The distance to target at destination.
  ///
  /// [animationOptions] The options of the ballistic curve.
  ///
  flyToWithOptionsAndOrientationAndDistance(GeoCoordinates target, MapCameraOrientationUpdate orientation, double distanceInMeters, MapCameraFlyToOptions animationOptions);
  /// Makes the camera look at the specified geodetic area and pass a rectangle which specifies
  /// where the area should appear inside of the map view.
  ///
  /// The supplied orientation is the orientation of the camera looking
  /// at the target, so the resulting camera state will have the
  /// same orientation as the one supplied to this method. Please note that
  /// the resulting orientation might deviate from the provided orientation.
  /// This is particularly the case if a large geobox on world level and a
  /// view rectangle which is relatively small was passed to the method.
  ///
  /// [target] Geodetic area which will be shown in the view_box
  ///
  /// [orientation] Desired orientation of the camera
  ///
  /// [viewRectangle] Defines the rectangle in view coordinates inside which the geographical target
  /// area is displayed.
  ///
  lookAtAreaWithOrientationAndViewRectangle(GeoBox target, MapCameraOrientationUpdate orientation, Rectangle2D viewRectangle);
  /// @nodoc
  ///
  /// [target] Geodetic area which will be shown in the view_box
  ///
  /// [orientation] Desired orientation of the camera
  ///
  /// [viewRectangle] Defines the rectangle in view coordinates inside which the geographical target
  /// area is displayed.
  ///
  /// [durationInMs] Duration of the animation in milliseconds.
  ///
  animateToAreaWithOrientationAndViewRectangle(GeoBox target, MapCameraOrientationUpdate orientation, Rectangle2D viewRectangle, int durationInMs);


  /// Gets state of the camera that reflects what is currently drawn inside the MapView.
  MapCameraState get state;





  /// Gets the current visible map area encompassed in a GeoBox.
  /// Note that this bounding box is always rectangular, and its sides are always
  /// parallel to the latitude and longitude. If the camera is rotated, the returned
  /// bounding box will be a circumscribed rectangle that is larger than the
  /// visible map area. Similarly, when the map is tilted (for example, if
  /// the map is tilted by 45 degrees), the visible map area represents
  /// a trapezoidal area in the world. Resulting value will then be a larger
  /// circumscribed rectangle that contains this trapezoid area.
  /// Because of this, corners of the resulting bounding box may be located
  /// outside of currently visible area.
  /// When the map area does not fully fill the viewport, `null` is returned.
  GeoBox get boundingBox;





  /// Gets a MapCameraLimits instance that controls limits for the camera settings.
  MapCameraLimits get limits;





  /// Gets the point that determines where the target is placed within the map view.
  /// By default, the principal point is located at the center of the map view.
  ///
  /// The value of the principal point is adjusted when the dimensions of the
  /// map view change, so that it stays in the same point relative to width
  /// and height. Meaning that when a principal point it set to bottom
  /// middle of the map view, it will stay in the bottom middle regardless
  /// of the changes to dimensions and orientation of the view.
  Point2D get principalPoint;


  /// Sets the point that determines where the target appears within the map view.
  /// This instantly moves the map to render the current target coordinates
  /// at the new principal point.
  ///
  /// By default, the principal point is located at the center of the map view.
  /// It is set in pixels relative to the map view's origin top-left (0, 0).
  /// Values outside the map view's dimensions (x < 0 || x > width, y < 0 || y > height)
  /// will be rejected silently and the current principal point is kept.
  ///
  /// The value of the principal point is adjusted when the dimensions of the
  /// map view change, so that it stays in the same point relative to width
  /// and height. Meaning that when a principal point it set to bottom
  /// middle of the map view, it will stay in the bottom middle regardless
  /// of the changes to dimensions and orientation of the view.
  ///
  /// Note: The principal point affects all programmatical map transformations (rotate, orbit, tilt and zoom)
  /// and the two-finger-pan gesture to tilt the map. Other gestures, like pinch-rotate,
  /// are not affected.
  set principalPoint(Point2D value);


}

/// Specifies camera parameters that can be used to update the camera's orientation in geodetic coordinate space.
///
/// All uninitialized values will be ignored when applying this update information to the camera.

class MapCameraOrientationUpdate {
  /// Bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to the ground.
  /// Value will remain unchanged if set to .
  double bearing;

  /// Tilt in degrees.
  /// Tilt axis is parallel to the ground.
  /// Value will remain unchanged if set to .
  double tilt;


  MapCameraOrientationUpdate(this.bearing, this.tilt);


  MapCameraOrientationUpdate.withDefaults()
    : bearing = null, tilt = null;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapCameraOrientationUpdate) return false;
    MapCameraOrientationUpdate _other = other;
    return bearing == _other.bearing &&
        tilt == _other.tilt;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + bearing.hashCode;
    result = 31 * result + tilt.hashCode;
    return result;
  }
}


// MapCameraOrientationUpdate "private" section, not exported.

final _sdk_mapview_MapCamera_OrientationUpdate_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_create_handle'));
final _sdk_mapview_MapCamera_OrientationUpdate_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_release_handle'));
final _sdk_mapview_MapCamera_OrientationUpdate_get_field_bearing = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_get_field_bearing'));
final _sdk_mapview_MapCamera_OrientationUpdate_get_field_tilt = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_get_field_tilt'));

Pointer<Void> sdk_mapview_MapCamera_OrientationUpdate_toFfi(MapCameraOrientationUpdate value) {
  final _bearing_handle = Double_toFfi_nullable(value.bearing);
  final _tilt_handle = Double_toFfi_nullable(value.tilt);
  final _result = _sdk_mapview_MapCamera_OrientationUpdate_create_handle(_bearing_handle, _tilt_handle);
  Double_releaseFfiHandle_nullable(_bearing_handle);
  Double_releaseFfiHandle_nullable(_tilt_handle);
  return _result;
}

MapCameraOrientationUpdate sdk_mapview_MapCamera_OrientationUpdate_fromFfi(Pointer<Void> handle) {
  final _bearing_handle = _sdk_mapview_MapCamera_OrientationUpdate_get_field_bearing(handle);
  final _tilt_handle = _sdk_mapview_MapCamera_OrientationUpdate_get_field_tilt(handle);
  try {
    return MapCameraOrientationUpdate(
      Double_fromFfi_nullable(_bearing_handle), 
      Double_fromFfi_nullable(_tilt_handle)
    );
  } finally {
    Double_releaseFfiHandle_nullable(_bearing_handle);
    Double_releaseFfiHandle_nullable(_tilt_handle);
  }
}

void sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_MapCamera_OrientationUpdate_release_handle(handle);

// Nullable MapCameraOrientationUpdate

final _sdk_mapview_MapCamera_OrientationUpdate_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_create_handle_nullable'));
final _sdk_mapview_MapCamera_OrientationUpdate_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_release_handle_nullable'));
final _sdk_mapview_MapCamera_OrientationUpdate_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_get_value_nullable'));

Pointer<Void> sdk_mapview_MapCamera_OrientationUpdate_toFfi_nullable(MapCameraOrientationUpdate value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(value);
  final result = _sdk_mapview_MapCamera_OrientationUpdate_create_handle_nullable(_handle);
  sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_handle);
  return result;
}

MapCameraOrientationUpdate sdk_mapview_MapCamera_OrientationUpdate_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapCamera_OrientationUpdate_get_value_nullable(handle);
  final result = sdk_mapview_MapCamera_OrientationUpdate_fromFfi(_handle);
  sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_OrientationUpdate_release_handle_nullable(handle);

// End of MapCameraOrientationUpdate "private" section.
/// Represents information on current camera orientation in geodetic coordinate space.
///
/// This data container is part of a [MapCameraState].

class MapCameraOrientation {
  /// Bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to the ground and passes through the target coordinate.
  double bearing;

  /// Tilt in degrees.
  /// Tilt axis is parallel to the ground and passes through the target coordinate.
  double tilt;


  MapCameraOrientation(this.bearing, this.tilt);


  MapCameraOrientation.withDefaults()
    : bearing = 0, tilt = 0;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapCameraOrientation) return false;
    MapCameraOrientation _other = other;
    return bearing == _other.bearing &&
        tilt == _other.tilt;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + bearing.hashCode;
    result = 31 * result + tilt.hashCode;
    return result;
  }
}


// MapCameraOrientation "private" section, not exported.

final _sdk_mapview_MapCamera_Orientation_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_create_handle'));
final _sdk_mapview_MapCamera_Orientation_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_release_handle'));
final _sdk_mapview_MapCamera_Orientation_get_field_bearing = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_get_field_bearing'));
final _sdk_mapview_MapCamera_Orientation_get_field_tilt = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_get_field_tilt'));

Pointer<Void> sdk_mapview_MapCamera_Orientation_toFfi(MapCameraOrientation value) {
  final _bearing_handle = (value.bearing);
  final _tilt_handle = (value.tilt);
  final _result = _sdk_mapview_MapCamera_Orientation_create_handle(_bearing_handle, _tilt_handle);
  (_bearing_handle);
  (_tilt_handle);
  return _result;
}

MapCameraOrientation sdk_mapview_MapCamera_Orientation_fromFfi(Pointer<Void> handle) {
  final _bearing_handle = _sdk_mapview_MapCamera_Orientation_get_field_bearing(handle);
  final _tilt_handle = _sdk_mapview_MapCamera_Orientation_get_field_tilt(handle);
  try {
    return MapCameraOrientation(
      (_bearing_handle), 
      (_tilt_handle)
    );
  } finally {
    (_bearing_handle);
    (_tilt_handle);
  }
}

void sdk_mapview_MapCamera_Orientation_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_MapCamera_Orientation_release_handle(handle);

// Nullable MapCameraOrientation

final _sdk_mapview_MapCamera_Orientation_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_create_handle_nullable'));
final _sdk_mapview_MapCamera_Orientation_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_release_handle_nullable'));
final _sdk_mapview_MapCamera_Orientation_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_get_value_nullable'));

Pointer<Void> sdk_mapview_MapCamera_Orientation_toFfi_nullable(MapCameraOrientation value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapCamera_Orientation_toFfi(value);
  final result = _sdk_mapview_MapCamera_Orientation_create_handle_nullable(_handle);
  sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_handle);
  return result;
}

MapCameraOrientation sdk_mapview_MapCamera_Orientation_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapCamera_Orientation_get_value_nullable(handle);
  final result = sdk_mapview_MapCamera_Orientation_fromFfi(_handle);
  sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapCamera_Orientation_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_Orientation_release_handle_nullable(handle);

// End of MapCameraOrientation "private" section.
/// Encapsulates state of the camera.

class MapCameraState {
  /// Camera's 'LookAt' target position in geodetic space.
  GeoCoordinates targetCoordinates;

  /// Camera's 'LookAt' target orientation in geodetic space.
  MapCameraOrientation targetOrientation;

  /// Distance from the camera to the target point in meters.
  double distanceToTargetInMeters;

  /// Zoom level corresponding to the current distance to target.
  double zoomLevel;


  MapCameraState(this.targetCoordinates, this.targetOrientation, this.distanceToTargetInMeters, this.zoomLevel);


}


// MapCameraState "private" section, not exported.

final _sdk_mapview_MapCamera_State_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Double, Double),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, double, double)
  >('here_sdk_sdk_mapview_MapCamera_State_create_handle'));
final _sdk_mapview_MapCamera_State_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_release_handle'));
final _sdk_mapview_MapCamera_State_get_field_targetCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_targetCoordinates'));
final _sdk_mapview_MapCamera_State_get_field_targetOrientation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_targetOrientation'));
final _sdk_mapview_MapCamera_State_get_field_distanceToTargetInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_distanceToTargetInMeters'));
final _sdk_mapview_MapCamera_State_get_field_zoomLevel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_zoomLevel'));

Pointer<Void> sdk_mapview_MapCamera_State_toFfi(MapCameraState value) {
  final _targetCoordinates_handle = sdk_core_GeoCoordinates_toFfi(value.targetCoordinates);
  final _targetOrientation_handle = sdk_mapview_MapCamera_Orientation_toFfi(value.targetOrientation);
  final _distanceToTargetInMeters_handle = (value.distanceToTargetInMeters);
  final _zoomLevel_handle = (value.zoomLevel);
  final _result = _sdk_mapview_MapCamera_State_create_handle(_targetCoordinates_handle, _targetOrientation_handle, _distanceToTargetInMeters_handle, _zoomLevel_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_targetCoordinates_handle);
  sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_targetOrientation_handle);
  (_distanceToTargetInMeters_handle);
  (_zoomLevel_handle);
  return _result;
}

MapCameraState sdk_mapview_MapCamera_State_fromFfi(Pointer<Void> handle) {
  final _targetCoordinates_handle = _sdk_mapview_MapCamera_State_get_field_targetCoordinates(handle);
  final _targetOrientation_handle = _sdk_mapview_MapCamera_State_get_field_targetOrientation(handle);
  final _distanceToTargetInMeters_handle = _sdk_mapview_MapCamera_State_get_field_distanceToTargetInMeters(handle);
  final _zoomLevel_handle = _sdk_mapview_MapCamera_State_get_field_zoomLevel(handle);
  try {
    return MapCameraState(
      sdk_core_GeoCoordinates_fromFfi(_targetCoordinates_handle), 
      sdk_mapview_MapCamera_Orientation_fromFfi(_targetOrientation_handle), 
      (_distanceToTargetInMeters_handle), 
      (_zoomLevel_handle)
    );
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_targetCoordinates_handle);
    sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_targetOrientation_handle);
    (_distanceToTargetInMeters_handle);
    (_zoomLevel_handle);
  }
}

void sdk_mapview_MapCamera_State_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_MapCamera_State_release_handle(handle);

// Nullable MapCameraState

final _sdk_mapview_MapCamera_State_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_create_handle_nullable'));
final _sdk_mapview_MapCamera_State_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_release_handle_nullable'));
final _sdk_mapview_MapCamera_State_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_value_nullable'));

Pointer<Void> sdk_mapview_MapCamera_State_toFfi_nullable(MapCameraState value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapCamera_State_toFfi(value);
  final result = _sdk_mapview_MapCamera_State_create_handle_nullable(_handle);
  sdk_mapview_MapCamera_State_releaseFfiHandle(_handle);
  return result;
}

MapCameraState sdk_mapview_MapCamera_State_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapCamera_State_get_value_nullable(handle);
  final result = sdk_mapview_MapCamera_State_fromFfi(_handle);
  sdk_mapview_MapCamera_State_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapCamera_State_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_State_release_handle_nullable(handle);

// End of MapCameraState "private" section.
/// Encapsulates options for flyTo animations.

class MapCameraFlyToOptions {
  /// Duration of animation in milliseconds. Defaults to 1750 milliseconds.
  int durationInMs;

  /// A bow factor that specifies how high ([MapCameraFlyToOptions.bowFactor] > 0) or low ([MapCameraFlyToOptions.bowFactor] < 0) the camera will fly.
  ///
  /// The highest ([MapCameraFlyToOptions.bowFactor] = 1) or lowest point ([MapCameraFlyToOptions.bowFactor] = -1) of the ballistic animation
  /// curve is relative to the travel distance between current camera target and destination target.
  ///
  /// A bow factor of 0 does not change the camera's [MapCameraState.distanceToTargetInMeters] over time.
  ///
  /// Values greater 0 result in a convex bow animation, values below 0 in a concave bowl animation.
  ///
  /// The bow factor is clamped to \[-1, +1\]. Defaults to 0.5.
  ///
  /// Note that the lowest possible camera distance to earth is 0 meters and that the animation
  /// curve will not go below this value.
  ///
  /// Note that currently, bow factor is ignored and assumed to be 1 if either start or end
  /// of animation has a non zero tilt.
  double bowFactor;


  MapCameraFlyToOptions(this.durationInMs, this.bowFactor);


  MapCameraFlyToOptions.withDefaults()
    : durationInMs = 1750, bowFactor = 0.5;

}


// MapCameraFlyToOptions "private" section, not exported.

final _sdk_mapview_MapCamera_FlyToOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Double),
    Pointer<Void> Function(int, double)
  >('here_sdk_sdk_mapview_MapCamera_FlyToOptions_create_handle'));
final _sdk_mapview_MapCamera_FlyToOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_FlyToOptions_release_handle'));
final _sdk_mapview_MapCamera_FlyToOptions_get_field_durationInMs = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_FlyToOptions_get_field_durationInMs'));
final _sdk_mapview_MapCamera_FlyToOptions_get_field_bowFactor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_FlyToOptions_get_field_bowFactor'));

Pointer<Void> sdk_mapview_MapCamera_FlyToOptions_toFfi(MapCameraFlyToOptions value) {
  final _durationInMs_handle = (value.durationInMs);
  final _bowFactor_handle = (value.bowFactor);
  final _result = _sdk_mapview_MapCamera_FlyToOptions_create_handle(_durationInMs_handle, _bowFactor_handle);
  (_durationInMs_handle);
  (_bowFactor_handle);
  return _result;
}

MapCameraFlyToOptions sdk_mapview_MapCamera_FlyToOptions_fromFfi(Pointer<Void> handle) {
  final _durationInMs_handle = _sdk_mapview_MapCamera_FlyToOptions_get_field_durationInMs(handle);
  final _bowFactor_handle = _sdk_mapview_MapCamera_FlyToOptions_get_field_bowFactor(handle);
  try {
    return MapCameraFlyToOptions(
      (_durationInMs_handle), 
      (_bowFactor_handle)
    );
  } finally {
    (_durationInMs_handle);
    (_bowFactor_handle);
  }
}

void sdk_mapview_MapCamera_FlyToOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_MapCamera_FlyToOptions_release_handle(handle);

// Nullable MapCameraFlyToOptions

final _sdk_mapview_MapCamera_FlyToOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_FlyToOptions_create_handle_nullable'));
final _sdk_mapview_MapCamera_FlyToOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_FlyToOptions_release_handle_nullable'));
final _sdk_mapview_MapCamera_FlyToOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_FlyToOptions_get_value_nullable'));

Pointer<Void> sdk_mapview_MapCamera_FlyToOptions_toFfi_nullable(MapCameraFlyToOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapCamera_FlyToOptions_toFfi(value);
  final result = _sdk_mapview_MapCamera_FlyToOptions_create_handle_nullable(_handle);
  sdk_mapview_MapCamera_FlyToOptions_releaseFfiHandle(_handle);
  return result;
}

MapCameraFlyToOptions sdk_mapview_MapCamera_FlyToOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapCamera_FlyToOptions_get_value_nullable(handle);
  final result = sdk_mapview_MapCamera_FlyToOptions_fromFfi(_handle);
  sdk_mapview_MapCamera_FlyToOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapCamera_FlyToOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_FlyToOptions_release_handle_nullable(handle);

// End of MapCameraFlyToOptions "private" section.

// MapCamera "private" section, not exported.

final _sdk_mapview_MapCamera_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_copy_handle'));
final _sdk_mapview_MapCamera_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_release_handle'));




















class MapCamera$Impl implements MapCamera {
  @protected
  Pointer<Void> handle;

  MapCamera$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _sdk_mapview_MapCamera_release_handle(handle);
    handle = null;
  }

  @override
  cancelAnimation() {
    final _cancelAnimation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_cancelAnimation'));
    final _handle = this.handle;
    final __result_handle = _cancelAnimation_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  addObserver(MapCameraObserver observer) {
    final _addObserver_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_addObserver__MapCameraObserver'));
    final _observer_handle = sdk_mapview_MapCameraObserver_toFfi(observer);
    final _handle = this.handle;
    final __result_handle = _addObserver_ffi(_handle, __lib.LibraryContext.isolateId, _observer_handle);
    sdk_mapview_MapCameraObserver_releaseFfiHandle(_observer_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  removeObserver(MapCameraObserver observer) {
    final _removeObserver_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_removeObserver__MapCameraObserver'));
    final _observer_handle = sdk_mapview_MapCameraObserver_toFfi(observer);
    final _handle = this.handle;
    final __result_handle = _removeObserver_ffi(_handle, __lib.LibraryContext.isolateId, _observer_handle);
    sdk_mapview_MapCameraObserver_releaseFfiHandle(_observer_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  orbitBy(MapCameraOrientationUpdate delta, Point2D origin) {
    final _orbitBy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_orbitBy__OrientationUpdate_Point2D'));
    final _delta_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(delta);
    final _origin_handle = sdk_core_Point2D_toFfi(origin);
    final _handle = this.handle;
    final __result_handle = _orbitBy_ffi(_handle, __lib.LibraryContext.isolateId, _delta_handle, _origin_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_delta_handle);
    sdk_core_Point2D_releaseFfiHandle(_origin_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  zoomBy(double factor, Point2D origin) {
    final _zoomBy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double, Pointer<Void>), void Function(Pointer<Void>, int, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_zoomBy__Double_Point2D'));
    final _factor_handle = (factor);
    final _origin_handle = sdk_core_Point2D_toFfi(origin);
    final _handle = this.handle;
    final __result_handle = _zoomBy_ffi(_handle, __lib.LibraryContext.isolateId, _factor_handle, _origin_handle);
    (_factor_handle);
    sdk_core_Point2D_releaseFfiHandle(_origin_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  zoomTo(double zoomLevel) {
    final _zoomTo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCamera_zoomTo__Double'));
    final _zoomLevel_handle = (zoomLevel);
    final _handle = this.handle;
    final __result_handle = _zoomTo_ffi(_handle, __lib.LibraryContext.isolateId, _zoomLevel_handle);
    (_zoomLevel_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtPoint(GeoCoordinates target) {
    final _lookAtPoint_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoCoordinates'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _handle = this.handle;
    final __result_handle = _lookAtPoint_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtPointWithDistance(GeoCoordinates target, double distanceInMeters) {
    final _lookAtPointWithDistance_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double), void Function(Pointer<Void>, int, Pointer<Void>, double)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoCoordinates_Double'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _distanceInMeters_handle = (distanceInMeters);
    final _handle = this.handle;
    final __result_handle = _lookAtPointWithDistance_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _distanceInMeters_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    (_distanceInMeters_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtPointWithOrientationAndDistance(GeoCoordinates target, MapCameraOrientationUpdate orientation, double distanceInMeters) {
    final _lookAtPointWithOrientationAndDistance_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Double), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoCoordinates_OrientationUpdate_Double'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _distanceInMeters_handle = (distanceInMeters);
    final _handle = this.handle;
    final __result_handle = _lookAtPointWithOrientationAndDistance_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _orientation_handle, _distanceInMeters_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    (_distanceInMeters_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtAreaWithOrientation(GeoBox target, MapCameraOrientationUpdate orientation) {
    final _lookAtAreaWithOrientation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoBox_OrientationUpdate'));
    final _target_handle = sdk_core_GeoBox_toFfi(target);
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _handle = this.handle;
    final __result_handle = _lookAtAreaWithOrientation_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _orientation_handle);
    sdk_core_GeoBox_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setDistanceToTarget(double distanceInMeters) {
    final _setDistanceToTarget_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCamera_setDistanceToTarget__Double'));
    final _distanceInMeters_handle = (distanceInMeters);
    final _handle = this.handle;
    final __result_handle = _setDistanceToTarget_ffi(_handle, __lib.LibraryContext.isolateId, _distanceInMeters_handle);
    (_distanceInMeters_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setTargetOrientation(MapCameraOrientationUpdate orientation) {
    final _setTargetOrientation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_setTargetOrientation__OrientationUpdate'));
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _handle = this.handle;
    final __result_handle = _setTargetOrientation_ffi(_handle, __lib.LibraryContext.isolateId, _orientation_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  flyTo(GeoCoordinates target) {
    final _flyTo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_flyTo__GeoCoordinates'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _handle = this.handle;
    final __result_handle = _flyTo_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  flyToWithOptions(GeoCoordinates target, MapCameraFlyToOptions animationOptions) {
    final _flyToWithOptions_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_flyTo__GeoCoordinates_FlyToOptions'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _animationOptions_handle = sdk_mapview_MapCamera_FlyToOptions_toFfi(animationOptions);
    final _handle = this.handle;
    final __result_handle = _flyToWithOptions_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _animationOptions_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_FlyToOptions_releaseFfiHandle(_animationOptions_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  flyToWithOptionsAndDistance(GeoCoordinates target, double distanceInMeters, MapCameraFlyToOptions animationOptions) {
    final _flyToWithOptionsAndDistance_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_flyTo__GeoCoordinates_Double_FlyToOptions'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _distanceInMeters_handle = (distanceInMeters);
    final _animationOptions_handle = sdk_mapview_MapCamera_FlyToOptions_toFfi(animationOptions);
    final _handle = this.handle;
    final __result_handle = _flyToWithOptionsAndDistance_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _distanceInMeters_handle, _animationOptions_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    (_distanceInMeters_handle);
    sdk_mapview_MapCamera_FlyToOptions_releaseFfiHandle(_animationOptions_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  flyToWithOptionsAndOrientation(GeoCoordinates target, MapCameraOrientationUpdate orientation, MapCameraFlyToOptions animationOptions) {
    final _flyToWithOptionsAndOrientation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_flyTo__GeoCoordinates_OrientationUpdate_FlyToOptions'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _animationOptions_handle = sdk_mapview_MapCamera_FlyToOptions_toFfi(animationOptions);
    final _handle = this.handle;
    final __result_handle = _flyToWithOptionsAndOrientation_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _orientation_handle, _animationOptions_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    sdk_mapview_MapCamera_FlyToOptions_releaseFfiHandle(_animationOptions_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  flyToWithOptionsAndOrientationAndDistance(GeoCoordinates target, MapCameraOrientationUpdate orientation, double distanceInMeters, MapCameraFlyToOptions animationOptions) {
    final _flyToWithOptionsAndOrientationAndDistance_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_flyTo__GeoCoordinates_OrientationUpdate_Double_FlyToOptions'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _distanceInMeters_handle = (distanceInMeters);
    final _animationOptions_handle = sdk_mapview_MapCamera_FlyToOptions_toFfi(animationOptions);
    final _handle = this.handle;
    final __result_handle = _flyToWithOptionsAndOrientationAndDistance_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _orientation_handle, _distanceInMeters_handle, _animationOptions_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    (_distanceInMeters_handle);
    sdk_mapview_MapCamera_FlyToOptions_releaseFfiHandle(_animationOptions_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtAreaWithOrientationAndViewRectangle(GeoBox target, MapCameraOrientationUpdate orientation, Rectangle2D viewRectangle) {
    final _lookAtAreaWithOrientationAndViewRectangle_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoBox_OrientationUpdate_Rectangle2D'));
    final _target_handle = sdk_core_GeoBox_toFfi(target);
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _viewRectangle_handle = sdk_core_Rectangle2D_toFfi(viewRectangle);
    final _handle = this.handle;
    final __result_handle = _lookAtAreaWithOrientationAndViewRectangle_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _orientation_handle, _viewRectangle_handle);
    sdk_core_GeoBox_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    sdk_core_Rectangle2D_releaseFfiHandle(_viewRectangle_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  animateToAreaWithOrientationAndViewRectangle(GeoBox target, MapCameraOrientationUpdate orientation, Rectangle2D viewRectangle, int durationInMs) {
    final _animateToAreaWithOrientationAndViewRectangle_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int32), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_animateTo__GeoBox_OrientationUpdate_Rectangle2D_Int'));
    final _target_handle = sdk_core_GeoBox_toFfi(target);
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _viewRectangle_handle = sdk_core_Rectangle2D_toFfi(viewRectangle);
    final _durationInMs_handle = (durationInMs);
    final _handle = this.handle;
    final __result_handle = _animateToAreaWithOrientationAndViewRectangle_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _orientation_handle, _viewRectangle_handle, _durationInMs_handle);
    sdk_core_GeoBox_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    sdk_core_Rectangle2D_releaseFfiHandle(_viewRectangle_handle);
    (_durationInMs_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  MapCameraState get state {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_state_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_mapview_MapCamera_State_fromFfi(__result_handle);
    } finally {
      sdk_mapview_MapCamera_State_releaseFfiHandle(__result_handle);
    }
  }


  @override
  GeoBox get boundingBox {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_boundingBox_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_GeoBox_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_GeoBox_releaseFfiHandle_nullable(__result_handle);
    }
  }


  @override
  MapCameraLimits get limits {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_limits_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_mapview_MapCameraLimits_fromFfi(__result_handle);
    } finally {
      sdk_mapview_MapCameraLimits_releaseFfiHandle(__result_handle);
    }
  }


  @override
  Point2D get principalPoint {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_principalPoint_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_Point2D_fromFfi(__result_handle);
    } finally {
      sdk_core_Point2D_releaseFfiHandle(__result_handle);
    }
  }

  @override
  set principalPoint(Point2D value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_principalPoint_set__Point2D'));
    final _value_handle = sdk_core_Point2D_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_core_Point2D_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

Pointer<Void> sdk_mapview_MapCamera_toFfi(MapCamera value) =>
  _sdk_mapview_MapCamera_copy_handle((value as MapCamera$Impl).handle);

MapCamera sdk_mapview_MapCamera_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapCamera;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapCamera_copy_handle(handle);
  final result = MapCamera$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}

void sdk_mapview_MapCamera_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_release_handle(handle);

Pointer<Void> sdk_mapview_MapCamera_toFfi_nullable(MapCamera value) =>
  value != null ? sdk_mapview_MapCamera_toFfi(value) : Pointer<Void>.fromAddress(0);

MapCamera sdk_mapview_MapCamera_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapCamera_fromFfi(handle) : null;

void sdk_mapview_MapCamera_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_release_handle(handle);

// End of MapCamera "private" section.

