import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalRecord extends FirestoreRecord {
  VitalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "blood_pressure_from" field.
  int? _bloodPressureFrom;
  int get bloodPressureFrom => _bloodPressureFrom ?? 0;
  bool hasBloodPressureFrom() => _bloodPressureFrom != null;

  // "blood_pressure_to" field.
  int? _bloodPressureTo;
  int get bloodPressureTo => _bloodPressureTo ?? 0;
  bool hasBloodPressureTo() => _bloodPressureTo != null;

  // "blood_glucose" field.
  double? _bloodGlucose;
  double get bloodGlucose => _bloodGlucose ?? 0.0;
  bool hasBloodGlucose() => _bloodGlucose != null;

  // "fluid_output" field.
  double? _fluidOutput;
  double get fluidOutput => _fluidOutput ?? 0.0;
  bool hasFluidOutput() => _fluidOutput != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bloodPressureFrom = snapshotData['blood_pressure_from'] as int?;
    _bloodPressureTo = snapshotData['blood_pressure_to'] as int?;
    _bloodGlucose = castToType<double>(snapshotData['blood_glucose']);
    _fluidOutput = castToType<double>(snapshotData['fluid_output']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('vital')
          : FirebaseFirestore.instance.collectionGroup('vital');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('vital').doc();

  static Stream<VitalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VitalRecord.fromSnapshot(s));

  static Future<VitalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VitalRecord.fromSnapshot(s));

  static VitalRecord fromSnapshot(DocumentSnapshot snapshot) => VitalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VitalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VitalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VitalRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createVitalRecordData({
  int? bloodPressureFrom,
  int? bloodPressureTo,
  double? bloodGlucose,
  double? fluidOutput,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'blood_pressure_from': bloodPressureFrom,
      'blood_pressure_to': bloodPressureTo,
      'blood_glucose': bloodGlucose,
      'fluid_output': fluidOutput,
    }.withoutNulls,
  );

  return firestoreData;
}
