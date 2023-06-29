import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FluidsRecord extends FirestoreRecord {
  FluidsRecord._(
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

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fluids');

  static Stream<FluidsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FluidsRecord.fromSnapshot(s));

  static Future<FluidsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FluidsRecord.fromSnapshot(s));

  static FluidsRecord fromSnapshot(DocumentSnapshot snapshot) => FluidsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FluidsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FluidsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FluidsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FluidsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFluidsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  double? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class FluidsRecordDocumentEquality implements Equality<FluidsRecord> {
  const FluidsRecordDocumentEquality();

  @override
  bool equals(FluidsRecord? e1, FluidsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(FluidsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.userRef, e?.amount]);

  @override
  bool isValidKey(Object? o) => o is FluidsRecord;
}
