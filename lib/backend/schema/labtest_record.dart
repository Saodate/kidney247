import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LabtestRecord extends FirestoreRecord {
  LabtestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eGFR" field.
  double? _eGFR;
  double get eGFR => _eGFR ?? 0.0;
  bool hasEGFR() => _eGFR != null;

  // "albumin" field.
  double? _albumin;
  double get albumin => _albumin ?? 0.0;
  bool hasAlbumin() => _albumin != null;

  // "blood_UN" field.
  double? _bloodUN;
  double get bloodUN => _bloodUN ?? 0.0;
  bool hasBloodUN() => _bloodUN != null;

  // "blood_glucose" field.
  double? _bloodGlucose;
  double get bloodGlucose => _bloodGlucose ?? 0.0;
  bool hasBloodGlucose() => _bloodGlucose != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _eGFR = castToType<double>(snapshotData['eGFR']);
    _albumin = castToType<double>(snapshotData['albumin']);
    _bloodUN = castToType<double>(snapshotData['blood_UN']);
    _bloodGlucose = castToType<double>(snapshotData['blood_glucose']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('labtest')
          : FirebaseFirestore.instance.collectionGroup('labtest');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('labtest').doc();

  static Stream<LabtestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabtestRecord.fromSnapshot(s));

  static Future<LabtestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabtestRecord.fromSnapshot(s));

  static LabtestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LabtestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabtestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabtestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabtestRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createLabtestRecordData({
  double? eGFR,
  double? albumin,
  double? bloodUN,
  double? bloodGlucose,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eGFR': eGFR,
      'albumin': albumin,
      'blood_UN': bloodUN,
      'blood_glucose': bloodGlucose,
    }.withoutNulls,
  );

  return firestoreData;
}
