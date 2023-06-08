import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LabtestResultsRecord extends FirestoreRecord {
  LabtestResultsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "albumin" field.
  double? _albumin;
  double get albumin => _albumin ?? 0.0;
  bool hasAlbumin() => _albumin != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "albuminTime" field.
  DateTime? _albuminTime;
  DateTime? get albuminTime => _albuminTime;
  bool hasAlbuminTime() => _albuminTime != null;

  // "GFRTime" field.
  DateTime? _gFRTime;
  DateTime? get gFRTime => _gFRTime;
  bool hasGFRTime() => _gFRTime != null;

  // "BUNTime" field.
  DateTime? _bUNTime;
  DateTime? get bUNTime => _bUNTime;
  bool hasBUNTime() => _bUNTime != null;

  // "gfr" field.
  double? _gfr;
  double get gfr => _gfr ?? 0.0;
  bool hasGfr() => _gfr != null;

  // "bun" field.
  double? _bun;
  double get bun => _bun ?? 0.0;
  bool hasBun() => _bun != null;

  // "bloodGlucose" field.
  double? _bloodGlucose;
  double get bloodGlucose => _bloodGlucose ?? 0.0;
  bool hasBloodGlucose() => _bloodGlucose != null;

  // "bloodGlucoseTime" field.
  DateTime? _bloodGlucoseTime;
  DateTime? get bloodGlucoseTime => _bloodGlucoseTime;
  bool hasBloodGlucoseTime() => _bloodGlucoseTime != null;

  void _initializeFields() {
    _albumin = castToType<double>(snapshotData['albumin']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _albuminTime = snapshotData['albuminTime'] as DateTime?;
    _gFRTime = snapshotData['GFRTime'] as DateTime?;
    _bUNTime = snapshotData['BUNTime'] as DateTime?;
    _gfr = castToType<double>(snapshotData['gfr']);
    _bun = castToType<double>(snapshotData['bun']);
    _bloodGlucose = castToType<double>(snapshotData['bloodGlucose']);
    _bloodGlucoseTime = snapshotData['bloodGlucoseTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('labtestResults');

  static Stream<LabtestResultsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabtestResultsRecord.fromSnapshot(s));

  static Future<LabtestResultsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabtestResultsRecord.fromSnapshot(s));

  static LabtestResultsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LabtestResultsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabtestResultsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabtestResultsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabtestResultsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createLabtestResultsRecordData({
  double? albumin,
  DocumentReference? userRef,
  DateTime? createdAt,
  DateTime? albuminTime,
  DateTime? gFRTime,
  DateTime? bUNTime,
  double? gfr,
  double? bun,
  double? bloodGlucose,
  DateTime? bloodGlucoseTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'albumin': albumin,
      'user_ref': userRef,
      'created_at': createdAt,
      'albuminTime': albuminTime,
      'GFRTime': gFRTime,
      'BUNTime': bUNTime,
      'gfr': gfr,
      'bun': bun,
      'bloodGlucose': bloodGlucose,
      'bloodGlucoseTime': bloodGlucoseTime,
    }.withoutNulls,
  );

  return firestoreData;
}
