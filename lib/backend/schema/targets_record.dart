import 'dart:async';

import 'package:collection/collection.dart';

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

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TargetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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

class TargetsRecordDocumentEquality implements Equality<TargetsRecord> {
  const TargetsRecordDocumentEquality();

  @override
  bool equals(TargetsRecord? e1, TargetsRecord? e2) {
    return e1?.createdAt == e2?.createdAt && e1?.userRef == e2?.userRef;
  }

  @override
  int hash(TargetsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is TargetsRecord;
}
