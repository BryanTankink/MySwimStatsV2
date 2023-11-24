// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivePageInfoStruct extends BaseStruct {
  ActivePageInfoStruct({
    PageId? activePage,
  }) : _activePage = activePage;

  // "activePage" field.
  PageId? _activePage;
  PageId? get activePage => _activePage;
  set activePage(PageId? val) => _activePage = val;
  bool hasActivePage() => _activePage != null;

  static ActivePageInfoStruct fromMap(Map<String, dynamic> data) =>
      ActivePageInfoStruct(
        activePage: deserializeEnum<PageId>(data['activePage']),
      );

  static ActivePageInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ActivePageInfoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'activePage': _activePage?.toString(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'activePage': serializeParam(
          _activePage,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static ActivePageInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ActivePageInfoStruct(
        activePage: deserializeParam<PageId>(
          data['activePage'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'ActivePageInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActivePageInfoStruct && activePage == other.activePage;
  }

  @override
  int get hashCode => const ListEquality().hash([activePage]);
}

ActivePageInfoStruct createActivePageInfoStruct({
  PageId? activePage,
}) =>
    ActivePageInfoStruct(
      activePage: activePage,
    );
