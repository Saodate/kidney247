import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationRemindRecord extends FirestoreRecord {
  MedicationRemindRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "medicationRef" field.
  DocumentReference? _medicationRef;
  DocumentReference? get medicationRef => _medicationRef;
  bool hasMedicationRef() => _medicationRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "session" field.
  List<String>? _session;
  List<String> get session => _session ?? const [];
  bool hasSession() => _session != null;

  // "remindTime" field.
  List<DateTime>? _remindTime;
  List<DateTime> get remindTime => _remindTime ?? const [];
  bool hasRemindTime() => _remindTime != null;

  void _initializeFields() {
    _medicationRef = snapshotData['medicationRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _note = snapshotData['note'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _session = getDataList(snapshotData['session']);
    _remindTime = getDataList(snapshotData['remindTime']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicationRemind');

  static Stream<MedicationRemindRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationRemindRecord.fromSnapshot(s));

  static Future<MedicationRemindRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MedicationRemindRecord.fromSnapshot(s));

  static MedicationRemindRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationRemindRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationRemindRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationRemindRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationRemindRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationRemindRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationRemindRecordData({
  DocumentReference? medicationRef,
  DocumentReference? userRef,
  String? note,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'medicationRef': medicationRef,
      'userRef': userRef,
      'note': note,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationRemindRecordDocumentEquality
    implements Equality<MedicationRemindRecord> {
  const MedicationRemindRecordDocumentEquality();

  @override
  bool equals(MedicationRemindRecord? e1, MedicationRemindRecord? e2) {
    const listEquality = ListEquality();
    return e1?.medicationRef == e2?.medicationRef &&
        e1?.userRef == e2?.userRef &&
        e1?.note == e2?.note &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.session, e2?.session) &&
        listEquality.equals(e1?.remindTime, e2?.remindTime);
  }

  @override
  int hash(MedicationRemindRecord? e) => const ListEquality().hash([
        e?.medicationRef,
        e?.userRef,
        e?.note,
        e?.createdAt,
        e?.session,
        e?.remindTime
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationRemindRecord;
}
