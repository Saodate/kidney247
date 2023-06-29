import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "userSex" field.
  String? _userSex;
  String get userSex => _userSex ?? '';
  bool hasUserSex() => _userSex != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  // "todayfluidOutput" field.
  double? _todayfluidOutput;
  double get todayfluidOutput => _todayfluidOutput ?? 0.0;
  bool hasTodayfluidOutput() => _todayfluidOutput != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  bool hasHeight() => _height != null;

  // "creatinine" field.
  double? _creatinine;
  double get creatinine => _creatinine ?? 0.0;
  bool hasCreatinine() => _creatinine != null;

  // "age" field.
  double? _age;
  double get age => _age ?? 0.0;
  bool hasAge() => _age != null;

  // "ageUnit" field.
  String? _ageUnit;
  String get ageUnit => _ageUnit ?? '';
  bool hasAgeUnit() => _ageUnit != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _password = snapshotData['password'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userSex = snapshotData['userSex'] as String?;
    _stage = snapshotData['stage'] as String?;
    _todayfluidOutput = castToType<double>(snapshotData['todayfluidOutput']);
    _weight = castToType<double>(snapshotData['weight']);
    _status = snapshotData['status'] as String?;
    _height = castToType<int>(snapshotData['height']);
    _creatinine = castToType<double>(snapshotData['creatinine']);
    _age = castToType<double>(snapshotData['age']);
    _ageUnit = snapshotData['ageUnit'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? email,
  String? password,
  String? uid,
  String? phoneNumber,
  String? photoUrl,
  DateTime? createdTime,
  String? userSex,
  String? stage,
  double? todayfluidOutput,
  double? weight,
  String? status,
  int? height,
  double? creatinine,
  double? age,
  String? ageUnit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'email': email,
      'password': password,
      'uid': uid,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'userSex': userSex,
      'stage': stage,
      'todayfluidOutput': todayfluidOutput,
      'weight': weight,
      'status': status,
      'height': height,
      'creatinine': creatinine,
      'age': age,
      'ageUnit': ageUnit,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        e1?.password == e2?.password &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.userSex == e2?.userSex &&
        e1?.stage == e2?.stage &&
        e1?.todayfluidOutput == e2?.todayfluidOutput &&
        e1?.weight == e2?.weight &&
        e1?.status == e2?.status &&
        e1?.height == e2?.height &&
        e1?.creatinine == e2?.creatinine &&
        e1?.age == e2?.age &&
        e1?.ageUnit == e2?.ageUnit;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.email,
        e?.password,
        e?.uid,
        e?.phoneNumber,
        e?.photoUrl,
        e?.createdTime,
        e?.userSex,
        e?.stage,
        e?.todayfluidOutput,
        e?.weight,
        e?.status,
        e?.height,
        e?.creatinine,
        e?.age,
        e?.ageUnit
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
