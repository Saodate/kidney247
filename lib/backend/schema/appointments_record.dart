import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "doctor_name" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  // "doctor_address" field.
  String? _doctorAddress;
  String get doctorAddress => _doctorAddress ?? '';
  bool hasDoctorAddress() => _doctorAddress != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "appointment_dateTime" field.
  DateTime? _appointmentDateTime;
  DateTime? get appointmentDateTime => _appointmentDateTime;
  bool hasAppointmentDateTime() => _appointmentDateTime != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _doctorName = snapshotData['doctor_name'] as String?;
    _doctorAddress = snapshotData['doctor_address'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _appointmentDateTime = snapshotData['appointment_dateTime'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsRecordData({
  String? doctorName,
  String? doctorAddress,
  String? description,
  DateTime? createdAt,
  DateTime? appointmentDateTime,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doctor_name': doctorName,
      'doctor_address': doctorAddress,
      'description': description,
      'created_at': createdAt,
      'appointment_dateTime': appointmentDateTime,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.doctorName == e2?.doctorName &&
        e1?.doctorAddress == e2?.doctorAddress &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.appointmentDateTime == e2?.appointmentDateTime &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.doctorName,
        e?.doctorAddress,
        e?.description,
        e?.createdAt,
        e?.appointmentDateTime,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
