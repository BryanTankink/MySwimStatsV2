// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SplitTimeStruct extends BaseStruct {
  SplitTimeStruct({
    String? distance,
    String? timeTotal,
    String? splitTime,
  })  : _distance = distance,
        _timeTotal = timeTotal,
        _splitTime = splitTime;

  // "distance" field.
  String? _distance;
  String get distance => _distance ?? '';
  set distance(String? val) => _distance = val;
  bool hasDistance() => _distance != null;

  // "timeTotal" field.
  String? _timeTotal;
  String get timeTotal => _timeTotal ?? '';
  set timeTotal(String? val) => _timeTotal = val;
  bool hasTimeTotal() => _timeTotal != null;

  // "splitTime" field.
  String? _splitTime;
  String get splitTime => _splitTime ?? '';
  set splitTime(String? val) => _splitTime = val;
  bool hasSplitTime() => _splitTime != null;

  static SplitTimeStruct fromMap(Map<String, dynamic> data) => SplitTimeStruct(
        distance: data['distance'] as String?,
        timeTotal: data['timeTotal'] as String?,
        splitTime: data['splitTime'] as String?,
      );

  static SplitTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? SplitTimeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'distance': _distance,
        'timeTotal': _timeTotal,
        'splitTime': _splitTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'distance': serializeParam(
          _distance,
          ParamType.String,
        ),
        'timeTotal': serializeParam(
          _timeTotal,
          ParamType.String,
        ),
        'splitTime': serializeParam(
          _splitTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static SplitTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      SplitTimeStruct(
        distance: deserializeParam(
          data['distance'],
          ParamType.String,
          false,
        ),
        timeTotal: deserializeParam(
          data['timeTotal'],
          ParamType.String,
          false,
        ),
        splitTime: deserializeParam(
          data['splitTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SplitTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SplitTimeStruct &&
        distance == other.distance &&
        timeTotal == other.timeTotal &&
        splitTime == other.splitTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([distance, timeTotal, splitTime]);
}

SplitTimeStruct createSplitTimeStruct({
  String? distance,
  String? timeTotal,
  String? splitTime,
}) =>
    SplitTimeStruct(
      distance: distance,
      timeTotal: timeTotal,
      splitTime: splitTime,
    );
