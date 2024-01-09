// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompareStruct extends BaseStruct {
  CompareStruct({
    CompareDataStruct? compare,
  }) : _compare = compare;

  // "compare" field.
  CompareDataStruct? _compare;
  CompareDataStruct get compare => _compare ?? CompareDataStruct();
  set compare(CompareDataStruct? val) => _compare = val;
  void updateCompare(Function(CompareDataStruct) updateFn) =>
      updateFn(_compare ??= CompareDataStruct());
  bool hasCompare() => _compare != null;

  static CompareStruct fromMap(Map<String, dynamic> data) => CompareStruct(
        compare: CompareDataStruct.maybeFromMap(data['compare']),
      );

  static CompareStruct? maybeFromMap(dynamic data) =>
      data is Map ? CompareStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'compare': _compare?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'compare': serializeParam(
          _compare,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CompareStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompareStruct(
        compare: deserializeStructParam(
          data['compare'],
          ParamType.DataStruct,
          false,
          structBuilder: CompareDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CompareStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompareStruct && compare == other.compare;
  }

  @override
  int get hashCode => const ListEquality().hash([compare]);
}

CompareStruct createCompareStruct({
  CompareDataStruct? compare,
}) =>
    CompareStruct(
      compare: compare ?? CompareDataStruct(),
    );
