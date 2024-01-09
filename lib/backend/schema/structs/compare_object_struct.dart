// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompareObjectStruct extends BaseStruct {
  CompareObjectStruct({
    String? event,
    bool? aIsBest,
    AthleteBestStruct? athleteA,
    AthleteBestStruct? athleteB,
  })  : _event = event,
        _aIsBest = aIsBest,
        _athleteA = athleteA,
        _athleteB = athleteB;

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  set event(String? val) => _event = val;
  bool hasEvent() => _event != null;

  // "aIsBest" field.
  bool? _aIsBest;
  bool get aIsBest => _aIsBest ?? false;
  set aIsBest(bool? val) => _aIsBest = val;
  bool hasAIsBest() => _aIsBest != null;

  // "athleteA" field.
  AthleteBestStruct? _athleteA;
  AthleteBestStruct get athleteA => _athleteA ?? AthleteBestStruct();
  set athleteA(AthleteBestStruct? val) => _athleteA = val;
  void updateAthleteA(Function(AthleteBestStruct) updateFn) =>
      updateFn(_athleteA ??= AthleteBestStruct());
  bool hasAthleteA() => _athleteA != null;

  // "athleteB" field.
  AthleteBestStruct? _athleteB;
  AthleteBestStruct get athleteB => _athleteB ?? AthleteBestStruct();
  set athleteB(AthleteBestStruct? val) => _athleteB = val;
  void updateAthleteB(Function(AthleteBestStruct) updateFn) =>
      updateFn(_athleteB ??= AthleteBestStruct());
  bool hasAthleteB() => _athleteB != null;

  static CompareObjectStruct fromMap(Map<String, dynamic> data) =>
      CompareObjectStruct(
        event: data['event'] as String?,
        aIsBest: data['aIsBest'] as bool?,
        athleteA: AthleteBestStruct.maybeFromMap(data['athleteA']),
        athleteB: AthleteBestStruct.maybeFromMap(data['athleteB']),
      );

  static CompareObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? CompareObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'event': _event,
        'aIsBest': _aIsBest,
        'athleteA': _athleteA?.toMap(),
        'athleteB': _athleteB?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'event': serializeParam(
          _event,
          ParamType.String,
        ),
        'aIsBest': serializeParam(
          _aIsBest,
          ParamType.bool,
        ),
        'athleteA': serializeParam(
          _athleteA,
          ParamType.DataStruct,
        ),
        'athleteB': serializeParam(
          _athleteB,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CompareObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompareObjectStruct(
        event: deserializeParam(
          data['event'],
          ParamType.String,
          false,
        ),
        aIsBest: deserializeParam(
          data['aIsBest'],
          ParamType.bool,
          false,
        ),
        athleteA: deserializeStructParam(
          data['athleteA'],
          ParamType.DataStruct,
          false,
          structBuilder: AthleteBestStruct.fromSerializableMap,
        ),
        athleteB: deserializeStructParam(
          data['athleteB'],
          ParamType.DataStruct,
          false,
          structBuilder: AthleteBestStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CompareObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompareObjectStruct &&
        event == other.event &&
        aIsBest == other.aIsBest &&
        athleteA == other.athleteA &&
        athleteB == other.athleteB;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([event, aIsBest, athleteA, athleteB]);
}

CompareObjectStruct createCompareObjectStruct({
  String? event,
  bool? aIsBest,
  AthleteBestStruct? athleteA,
  AthleteBestStruct? athleteB,
}) =>
    CompareObjectStruct(
      event: event,
      aIsBest: aIsBest,
      athleteA: athleteA ?? AthleteBestStruct(),
      athleteB: athleteB ?? AthleteBestStruct(),
    );
