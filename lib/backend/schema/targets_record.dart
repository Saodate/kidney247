import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TargetsRecord extends FirestoreRecord {
  TargetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('targets');

  static Stream<TargetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TargetsRecord.fromSnapshot(s));

  static Future<TargetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TargetsRecord.fromSnapshot(s));

  static TargetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TargetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TargetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TargetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TargetsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTargetsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}
