import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _groupChatRef = (await secureStorage.getString('ff_groupChatRef'))?.ref ??
          _groupChatRef;
    });
    await _safeInitAsync(() async {
      _groupChat2Ref =
          (await secureStorage.getString('ff_groupChat2Ref'))?.ref ??
              _groupChat2Ref;
    });
    await _safeInitAsync(() async {
      _groupChatEnRef1 =
          (await secureStorage.getString('ff_groupChatEnRef1'))?.ref ??
              _groupChatEnRef1;
    });
    await _safeInitAsync(() async {
      _groupChatEnRef2 =
          (await secureStorage.getString('ff_groupChatEnRef2'))?.ref ??
              _groupChatEnRef2;
    });
    await _safeInitAsync(() async {
      _chatGPTKey =
          await secureStorage.getString('ff_chatGPTKey') ?? _chatGPTKey;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _fluid;
  DocumentReference? get fluid => _fluid;
  set fluid(DocumentReference? _value) {
    _fluid = _value;
  }

  DocumentReference? _editLabTest;
  DocumentReference? get editLabTest => _editLabTest;
  set editLabTest(DocumentReference? _value) {
    _editLabTest = _value;
  }

  DocumentReference? _editVital;
  DocumentReference? get editVital => _editVital;
  set editVital(DocumentReference? _value) {
    _editVital = _value;
  }

  DocumentReference? _groupChatRef =
      FirebaseFirestore.instance.doc('/chats/xtmGiySTJgqKlqSr9UVd');
  DocumentReference? get groupChatRef => _groupChatRef;
  set groupChatRef(DocumentReference? _value) {
    _groupChatRef = _value;
    _value != null
        ? secureStorage.setString('ff_groupChatRef', _value.path)
        : secureStorage.remove('ff_groupChatRef');
  }

  void deleteGroupChatRef() {
    secureStorage.delete(key: 'ff_groupChatRef');
  }

  DocumentReference? _groupChat2Ref =
      FirebaseFirestore.instance.doc('/chats/onphRgcqUEmVFDOV9ku9');
  DocumentReference? get groupChat2Ref => _groupChat2Ref;
  set groupChat2Ref(DocumentReference? _value) {
    _groupChat2Ref = _value;
    _value != null
        ? secureStorage.setString('ff_groupChat2Ref', _value.path)
        : secureStorage.remove('ff_groupChat2Ref');
  }

  void deleteGroupChat2Ref() {
    secureStorage.delete(key: 'ff_groupChat2Ref');
  }

  DocumentReference? _groupChatEnRef1 =
      FirebaseFirestore.instance.doc('/chats/nf4lk0tP9Q0Ruvld7VDl');
  DocumentReference? get groupChatEnRef1 => _groupChatEnRef1;
  set groupChatEnRef1(DocumentReference? _value) {
    _groupChatEnRef1 = _value;
    _value != null
        ? secureStorage.setString('ff_groupChatEnRef1', _value.path)
        : secureStorage.remove('ff_groupChatEnRef1');
  }

  void deleteGroupChatEnRef1() {
    secureStorage.delete(key: 'ff_groupChatEnRef1');
  }

  DocumentReference? _groupChatEnRef2 =
      FirebaseFirestore.instance.doc('/chats/PBuHCy4uzchCMlrufCNy');
  DocumentReference? get groupChatEnRef2 => _groupChatEnRef2;
  set groupChatEnRef2(DocumentReference? _value) {
    _groupChatEnRef2 = _value;
    _value != null
        ? secureStorage.setString('ff_groupChatEnRef2', _value.path)
        : secureStorage.remove('ff_groupChatEnRef2');
  }

  void deleteGroupChatEnRef2() {
    secureStorage.delete(key: 'ff_groupChatEnRef2');
  }

  DocumentReference? _appointmentRef;
  DocumentReference? get appointmentRef => _appointmentRef;
  set appointmentRef(DocumentReference? _value) {
    _appointmentRef = _value;
  }

  DocumentReference? _postCommentReply;
  DocumentReference? get postCommentReply => _postCommentReply;
  set postCommentReply(DocumentReference? _value) {
    _postCommentReply = _value;
  }

  DocumentReference? _videoCommentReply;
  DocumentReference? get videoCommentReply => _videoCommentReply;
  set videoCommentReply(DocumentReference? _value) {
    _videoCommentReply = _value;
  }

  String _chatGPTKey = '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';
  String get chatGPTKey => _chatGPTKey;
  set chatGPTKey(String _value) {
    _chatGPTKey = _value;
    secureStorage.setString('ff_chatGPTKey', _value);
  }

  void deleteChatGPTKey() {
    secureStorage.delete(key: 'ff_chatGPTKey');
  }

  bool _isBack = false;
  bool get isBack => _isBack;
  set isBack(bool _value) {
    _isBack = _value;
  }
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
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
