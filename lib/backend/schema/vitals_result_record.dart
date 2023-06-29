import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalsResultRecord extends FirestoreRecord {
  VitalsResultRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "blood_pressure_from" field.
  double? _bloodPressureFrom;
  double get bloodPressureFrom => _bloodPressureFrom ?? 0.0;
  bool hasBloodPressureFrom() => _bloodPressureFrom != null;

  // "blood_pressure_to" field.
  double? _bloodPressureTo;
  double get bloodPressureTo => _bloodPressureTo ?? 0.0;
  bool hasBloodPressureTo() => _bloodPressureTo != null;

  // "fluid_output" field.
  double? _fluidOutput;
  double get fluidOutput => _fluidOutput ?? 0.0;
  bool hasFluidOutput() => _fluidOutput != null;

  // "blood_glucose" field.
  double? _bloodGlucose;
  double get bloodGlucose => _bloodGlucose ?? 0.0;
  bool hasBloodGlucose() => _bloodGlucose != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "blood_pressureTime" field.
  DateTime? _bloodPressureTime;
  DateTime? get bloodPressureTime => _bloodPressureTime;
  bool hasBloodPressureTime() => _bloodPressureTime != null;

  // "fluid_outputTime" field.
  DateTime? _fluidOutputTime;
  DateTime? get fluidOutputTime => _fluidOutputTime;
  bool hasFluidOutputTime() => _fluidOutputTime != null;

  // "blood_glucoseTime" field.
  DateTime? _bloodGlucoseTime;
  DateTime? get bloodGlucoseTime => _bloodGlucoseTime;
  bool hasBloodGlucoseTime() => _bloodGlucoseTime != null;

  void _initializeFields() {
    _bloodPressureFrom =
        castToType<double>(snapshotData['blood_pressure_from']);
    _bloodPressureTo = castToType<double>(snapshotData['blood_pressure_to']);
    _fluidOutput = castToType<double>(snapshotData['fluid_output']);
    _bloodGlucose = castToType<double>(snapshotData['blood_glucose']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _bloodPressureTime = snapshotData['blood_pressureTime'] as DateTime?;
    _fluidOutputTime = snapshotData['fluid_outputTime'] as DateTime?;
    _bloodGlucoseTime = snapshotData['blood_glucoseTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vitalsResult');

  static Stream<VitalsResultRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VitalsResultRecord.fromSnapshot(s));

  static Future<VitalsResultRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VitalsResultRecord.fromSnapshot(s));

  static VitalsResultRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VitalsResultRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VitalsResultRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VitalsResultRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VitalsResultRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VitalsResultRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVitalsResultRecordData({
  double? bloodPressureFrom,
  double? bloodPressureTo,
  double? fluidOutput,
  double? bloodGlucose,
  DocumentReference? userRef,
  DateTime? createdTime,
  DateTime? bloodPressureTime,
  DateTime? fluidOutputTime,
  DateTime? bloodGlucoseTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'blood_pressure_from': bloodPressureFrom,
      'blood_pressure_to': bloodPressureTo,
      'fluid_output': fluidOutput,
      'blood_glucose': bloodGlucose,
      'user_ref': userRef,
      'created_time': createdTime,
      'blood_pressureTime': bloodPressureTime,
      'fluid_outputTime': fluidOutputTime,
      'blood_glucoseTime': bloodGlucoseTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class VitalsResultRecordDocumentEquality
    implements Equality<VitalsResultRecord> {
  const VitalsResultRecordDocumentEquality();

  @override
  bool equals(VitalsResultRecord? e1, VitalsResultRecord? e2) {
    return e1?.bloodPressureFrom == e2?.bloodPressureFrom &&
        e1?.bloodPressureTo == e2?.bloodPressureTo &&
        e1?.fluidOutput == e2?.fluidOutput &&
        e1?.bloodGlucose == e2?.bloodGlucose &&
        e1?.userRef == e2?.userRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.bloodPressureTime == e2?.bloodPressureTime &&
        e1?.fluidOutputTime == e2?.fluidOutputTime &&
        e1?.bloodGlucoseTime == e2?.bloodGlucoseTime;
  }

  @override
  int hash(VitalsResultRecord? e) => const ListEquality().hash([
        e?.bloodPressureFrom,
        e?.bloodPressureTo,
        e?.fluidOutput,
        e?.bloodGlucose,
        e?.userRef,
        e?.createdTime,
        e?.bloodPressureTime,
        e?.fluidOutputTime,
        e?.bloodGlucoseTime
      ]);

  @override
  bool isValidKey(Object? o) => o is VitalsResultRecord;
}
