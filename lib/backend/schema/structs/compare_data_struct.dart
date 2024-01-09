// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompareDataStruct extends BaseStruct {
  CompareDataStruct({
    UserStruct? athleteA,
    UserStruct? athleteB,
    List<CompareObjectStruct>? compareables,
  })  : _athleteA = athleteA,
        _athleteB = athleteB,
        _compareables = compareables;

  // "athleteA" field.
  UserStruct? _athleteA;
  UserStruct get athleteA => _athleteA ?? UserStruct();
  set athleteA(UserStruct? val) => _athleteA = val;
  void updateAthleteA(Function(UserStruct) updateFn) =>
      updateFn(_athleteA ??= UserStruct());
  bool hasAthleteA() => _athleteA != null;

  // "athleteB" field.
  UserStruct? _athleteB;
  UserStruct get athleteB => _athleteB ?? UserStruct();
  set athleteB(UserStruct? val) => _athleteB = val;
  void updateAthleteB(Function(UserStruct) updateFn) =>
      updateFn(_athleteB ??= UserStruct());
  bool hasAthleteB() => _athleteB != null;

  // "compareables" field.
  List<CompareObjectStruct>? _compareables;
  List<CompareObjectStruct> get compareables => _compareables ?? const [];
  set compareables(List<CompareObjectStruct>? val) => _compareables = val;
  void updateCompareables(Function(List<CompareObjectStruct>) updateFn) =>
      updateFn(_compareables ??= []);
  bool hasCompareables() => _compareables != null;

  static CompareDataStruct fromMap(Map<String, dynamic> data) =>
      CompareDataStruct(
        athleteA: UserStruct.maybeFromMap(data['athleteA']),
        athleteB: UserStruct.maybeFromMap(data['athleteB']),
        compareables: getStructList(
          data['compareables'],
          CompareObjectStruct.fromMap,
        ),
      );

  static CompareDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CompareDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'athleteA': _athleteA?.toMap(),
        'athleteB': _athleteB?.toMap(),
        'compareables': _compareables?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'athleteA': serializeParam(
          _athleteA,
          ParamType.DataStruct,
        ),
        'athleteB': serializeParam(
          _athleteB,
          ParamType.DataStruct,
        ),
        'compareables': serializeParam(
          _compareables,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CompareDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompareDataStruct(
        athleteA: deserializeStructParam(
          data['athleteA'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        athleteB: deserializeStructParam(
          data['athleteB'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        compareables: deserializeStructParam<CompareObjectStruct>(
          data['compareables'],
          ParamType.DataStruct,
          true,
          structBuilder: CompareObjectStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CompareDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CompareDataStruct &&
        athleteA == other.athleteA &&
        athleteB == other.athleteB &&
        listEquality.equals(compareables, other.compareables);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([athleteA, athleteB, compareables]);
}

CompareDataStruct createCompareDataStruct({
  UserStruct? athleteA,
  UserStruct? athleteB,
}) =>
    CompareDataStruct(
      athleteA: athleteA ?? UserStruct(),
      athleteB: athleteB ?? UserStruct(),
    );
