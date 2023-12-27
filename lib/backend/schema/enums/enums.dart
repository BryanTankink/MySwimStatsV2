import 'package:collection/collection.dart';

enum PageId {
  Dashboard,
  Races,
  Profile,
  PersonalRecords,
}

enum UserAddState {
  SetActive,
  AsFavorite,
  AsViewOnly,
  AsReturn,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (PageId):
      return PageId.values.deserialize(value) as T?;
    case (UserAddState):
      return UserAddState.values.deserialize(value) as T?;
    default:
      return null;
  }
}
