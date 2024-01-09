// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AthleteBestStruct extends BaseStruct {
  AthleteBestStruct({
    int? styleId,
    int? eventType,
    int? distance,
    String? event,
    int? courseType,
    String? course,
    String? time,
    List<SplitTimeStruct>? splits,
    int? seconds,
    int? points,
    String? date,
    String? place,
    String? race,
    int? timeId,
  })  : _styleId = styleId,
        _eventType = eventType,
        _distance = distance,
        _event = event,
        _courseType = courseType,
        _course = course,
        _time = time,
        _splits = splits,
        _seconds = seconds,
        _points = points,
        _date = date,
        _place = place,
        _race = race,
        _timeId = timeId;

  // "styleId" field.
  int? _styleId;
  int get styleId => _styleId ?? 0;
  set styleId(int? val) => _styleId = val;
  void incrementStyleId(int amount) => _styleId = styleId + amount;
  bool hasStyleId() => _styleId != null;

  // "eventType" field.
  int? _eventType;
  int get eventType => _eventType ?? 0;
  set eventType(int? val) => _eventType = val;
  void incrementEventType(int amount) => _eventType = eventType + amount;
  bool hasEventType() => _eventType != null;

  // "distance" field.
  int? _distance;
  int get distance => _distance ?? 0;
  set distance(int? val) => _distance = val;
  void incrementDistance(int amount) => _distance = distance + amount;
  bool hasDistance() => _distance != null;

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  set event(String? val) => _event = val;
  bool hasEvent() => _event != null;

  // "courseType" field.
  int? _courseType;
  int get courseType => _courseType ?? 0;
  set courseType(int? val) => _courseType = val;
  void incrementCourseType(int amount) => _courseType = courseType + amount;
  bool hasCourseType() => _courseType != null;

  // "course" field.
  String? _course;
  String get course => _course ?? '';
  set course(String? val) => _course = val;
  bool hasCourse() => _course != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  // "splits" field.
  List<SplitTimeStruct>? _splits;
  List<SplitTimeStruct> get splits => _splits ?? const [];
  set splits(List<SplitTimeStruct>? val) => _splits = val;
  void updateSplits(Function(List<SplitTimeStruct>) updateFn) =>
      updateFn(_splits ??= []);
  bool hasSplits() => _splits != null;

  // "seconds" field.
  int? _seconds;
  int get seconds => _seconds ?? 0;
  set seconds(int? val) => _seconds = val;
  void incrementSeconds(int amount) => _seconds = seconds + amount;
  bool hasSeconds() => _seconds != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  set points(int? val) => _points = val;
  void incrementPoints(int amount) => _points = points + amount;
  bool hasPoints() => _points != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  set place(String? val) => _place = val;
  bool hasPlace() => _place != null;

  // "race" field.
  String? _race;
  String get race => _race ?? '';
  set race(String? val) => _race = val;
  bool hasRace() => _race != null;

  // "timeId" field.
  int? _timeId;
  int get timeId => _timeId ?? 0;
  set timeId(int? val) => _timeId = val;
  void incrementTimeId(int amount) => _timeId = timeId + amount;
  bool hasTimeId() => _timeId != null;

  static AthleteBestStruct fromMap(Map<String, dynamic> data) =>
      AthleteBestStruct(
        styleId: castToType<int>(data['styleId']),
        eventType: castToType<int>(data['eventType']),
        distance: castToType<int>(data['distance']),
        event: data['event'] as String?,
        courseType: castToType<int>(data['courseType']),
        course: data['course'] as String?,
        time: data['time'] as String?,
        splits: getStructList(
          data['splits'],
          SplitTimeStruct.fromMap,
        ),
        seconds: castToType<int>(data['seconds']),
        points: castToType<int>(data['points']),
        date: data['date'] as String?,
        place: data['place'] as String?,
        race: data['race'] as String?,
        timeId: castToType<int>(data['timeId']),
      );

  static AthleteBestStruct? maybeFromMap(dynamic data) => data is Map
      ? AthleteBestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'styleId': _styleId,
        'eventType': _eventType,
        'distance': _distance,
        'event': _event,
        'courseType': _courseType,
        'course': _course,
        'time': _time,
        'splits': _splits?.map((e) => e.toMap()).toList(),
        'seconds': _seconds,
        'points': _points,
        'date': _date,
        'place': _place,
        'race': _race,
        'timeId': _timeId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'styleId': serializeParam(
          _styleId,
          ParamType.int,
        ),
        'eventType': serializeParam(
          _eventType,
          ParamType.int,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.int,
        ),
        'event': serializeParam(
          _event,
          ParamType.String,
        ),
        'courseType': serializeParam(
          _courseType,
          ParamType.int,
        ),
        'course': serializeParam(
          _course,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'splits': serializeParam(
          _splits,
          ParamType.DataStruct,
          true,
        ),
        'seconds': serializeParam(
          _seconds,
          ParamType.int,
        ),
        'points': serializeParam(
          _points,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'place': serializeParam(
          _place,
          ParamType.String,
        ),
        'race': serializeParam(
          _race,
          ParamType.String,
        ),
        'timeId': serializeParam(
          _timeId,
          ParamType.int,
        ),
      }.withoutNulls;

  static AthleteBestStruct fromSerializableMap(Map<String, dynamic> data) =>
      AthleteBestStruct(
        styleId: deserializeParam(
          data['styleId'],
          ParamType.int,
          false,
        ),
        eventType: deserializeParam(
          data['eventType'],
          ParamType.int,
          false,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.int,
          false,
        ),
        event: deserializeParam(
          data['event'],
          ParamType.String,
          false,
        ),
        courseType: deserializeParam(
          data['courseType'],
          ParamType.int,
          false,
        ),
        course: deserializeParam(
          data['course'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        splits: deserializeStructParam<SplitTimeStruct>(
          data['splits'],
          ParamType.DataStruct,
          true,
          structBuilder: SplitTimeStruct.fromSerializableMap,
        ),
        seconds: deserializeParam(
          data['seconds'],
          ParamType.int,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        place: deserializeParam(
          data['place'],
          ParamType.String,
          false,
        ),
        race: deserializeParam(
          data['race'],
          ParamType.String,
          false,
        ),
        timeId: deserializeParam(
          data['timeId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AthleteBestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AthleteBestStruct &&
        styleId == other.styleId &&
        eventType == other.eventType &&
        distance == other.distance &&
        event == other.event &&
        courseType == other.courseType &&
        course == other.course &&
        time == other.time &&
        listEquality.equals(splits, other.splits) &&
        seconds == other.seconds &&
        points == other.points &&
        date == other.date &&
        place == other.place &&
        race == other.race &&
        timeId == other.timeId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        styleId,
        eventType,
        distance,
        event,
        courseType,
        course,
        time,
        splits,
        seconds,
        points,
        date,
        place,
        race,
        timeId
      ]);
}

AthleteBestStruct createAthleteBestStruct({
  int? styleId,
  int? eventType,
  int? distance,
  String? event,
  int? courseType,
  String? course,
  String? time,
  int? seconds,
  int? points,
  String? date,
  String? place,
  String? race,
  int? timeId,
}) =>
    AthleteBestStruct(
      styleId: styleId,
      eventType: eventType,
      distance: distance,
      event: event,
      courseType: courseType,
      course: course,
      time: time,
      seconds: seconds,
      points: points,
      date: date,
      place: place,
      race: race,
      timeId: timeId,
    );
