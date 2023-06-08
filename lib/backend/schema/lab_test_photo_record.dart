import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LabTestPhotoRecord extends FirestoreRecord {
  LabTestPhotoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _photoUrl = snapshotData['photoUrl'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('labTestPhoto');

  static Stream<LabTestPhotoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabTestPhotoRecord.fromSnapshot(s));

  static Future<LabTestPhotoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabTestPhotoRecord.fromSnapshot(s));

  static LabTestPhotoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LabTestPhotoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabTestPhotoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabTestPhotoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabTestPhotoRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createLabTestPhotoRecordData({
  String? photoUrl,
  DocumentReference? userRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photoUrl': photoUrl,
      'user_ref': userRef,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}
