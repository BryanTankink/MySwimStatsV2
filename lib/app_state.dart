import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _idGenerated =
          await secureStorage.getBool('ff_idGenerated') ?? _idGenerated;
    });
    await _safeInitAsync(() async {
      _deviceIdentifier =
          await secureStorage.getString('ff_deviceIdentifier') ??
              _deviceIdentifier;
    });
    await _safeInitAsync(() async {
      _activeUserId =
          await secureStorage.getString('ff_activeUserId') ?? _activeUserId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _idGenerated = false;
  bool get idGenerated => _idGenerated;
  set idGenerated(bool value) {
    _idGenerated = value;
    secureStorage.setBool('ff_idGenerated', value);
  }

  void deleteIdGenerated() {
    secureStorage.delete(key: 'ff_idGenerated');
  }

  String _deviceIdentifier = '';
  String get deviceIdentifier => _deviceIdentifier;
  set deviceIdentifier(String value) {
    _deviceIdentifier = value;
    secureStorage.setString('ff_deviceIdentifier', value);
  }

  void deleteDeviceIdentifier() {
    secureStorage.delete(key: 'ff_deviceIdentifier');
  }

  dynamic _user;
  dynamic get user => _user;
  set user(dynamic value) {
    _user = value;
  }

  String _activeUserId = '';
  String get activeUserId => _activeUserId;
  set activeUserId(String value) {
    _activeUserId = value;
    secureStorage.setString('ff_activeUserId', value);
  }

  void deleteActiveUserId() {
    secureStorage.delete(key: 'ff_activeUserId');
  }

  int _recommendationsCount = 0;
  int get recommendationsCount => _recommendationsCount;
  set recommendationsCount(int value) {
    _recommendationsCount = value;
  }

  bool _premium = false;
  bool get premium => _premium;
  set premium(bool value) {
    _premium = value;
  }

  ActivePageInfoStruct _activePageInfo =
      ActivePageInfoStruct.fromSerializableMap(
          jsonDecode('{"activePage":"zbad0"}'));
  ActivePageInfoStruct get activePageInfo => _activePageInfo;
  set activePageInfo(ActivePageInfoStruct value) {
    _activePageInfo = value;
  }

  void updateActivePageInfoStruct(Function(ActivePageInfoStruct) updateFn) {
    updateFn(_activePageInfo);
  }

  bool _isPremiumAllowed = true;
  bool get isPremiumAllowed => _isPremiumAllowed;
  set isPremiumAllowed(bool value) {
    _isPremiumAllowed = value;
  }

  final _dashboardManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> dashboard({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _dashboardManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDashboardCache() => _dashboardManager.clear();
  void clearDashboardCacheKey(String? uniqueKey) =>
      _dashboardManager.clearRequest(uniqueKey);

  final _rankingManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> ranking({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _rankingManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRankingCache() => _rankingManager.clear();
  void clearRankingCacheKey(String? uniqueKey) =>
      _rankingManager.clearRequest(uniqueKey);

  final _raceListManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> raceList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _raceListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRaceListCache() => _raceListManager.clear();
  void clearRaceListCacheKey(String? uniqueKey) =>
      _raceListManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
