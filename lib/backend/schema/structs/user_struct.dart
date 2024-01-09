// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? fullName,
    String? athleteId,
    String? birthYear,
  })  : _fullName = fullName,
        _athleteId = athleteId,
        _birthYear = birthYear;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;
  bool hasFullName() => _fullName != null;

  // "athleteId" field.
  String? _athleteId;
  String get athleteId => _athleteId ?? '';
  set athleteId(String? val) => _athleteId = val;
  bool hasAthleteId() => _athleteId != null;

  // "birthYear" field.
  String? _birthYear;
  String get birthYear => _birthYear ?? '';
  set birthYear(String? val) => _birthYear = val;
  bool hasBirthYear() => _birthYear != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        fullName: data['fullName'] as String?,
        athleteId: data['athleteId'] as String?,
        birthYear: data['birthYear'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'fullName': _fullName,
        'athleteId': _athleteId,
        'birthYear': _birthYear,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'athleteId': serializeParam(
          _athleteId,
          ParamType.String,
        ),
        'birthYear': serializeParam(
          _birthYear,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        fullName: deserializeParam(
          data['fullName'],
          ParamType.String,
          false,
        ),
        athleteId: deserializeParam(
          data['athleteId'],
          ParamType.String,
          false,
        ),
        birthYear: deserializeParam(
          data['birthYear'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        fullName == other.fullName &&
        athleteId == other.athleteId &&
        birthYear == other.birthYear;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fullName, athleteId, birthYear]);
}

UserStruct createUserStruct({
  String? fullName,
  String? athleteId,
  String? birthYear,
}) =>
    UserStruct(
      fullName: fullName,
      athleteId: athleteId,
      birthYear: birthYear,
    );
