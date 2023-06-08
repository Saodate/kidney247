import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationRecord extends FirestoreRecord {
  MedicationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  // "shape" field.
  String? _shape;
  String get shape => _shape ?? '';
  bool hasShape() => _shape != null;

  // "dissolutionRate" field.
  String? _dissolutionRate;
  String get dissolutionRate => _dissolutionRate ?? '';
  bool hasDissolutionRate() => _dissolutionRate != null;

  // "dosage" field.
  String? _dosage;
  String get dosage => _dosage ?? '';
  bool hasDosage() => _dosage != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _ingredients = snapshotData['ingredients'] as String?;
    _shape = snapshotData['shape'] as String?;
    _dissolutionRate = snapshotData['dissolutionRate'] as String?;
    _dosage = snapshotData['dosage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medication');

  static Stream<MedicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationRecord.fromSnapshot(s));

  static Future<MedicationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationRecord.fromSnapshot(s));

  static MedicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMedicationRecordData({
  String? name,
  String? image,
  String? ingredients,
  String? shape,
  String? dissolutionRate,
  String? dosage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'ingredients': ingredients,
      'shape': shape,
      'dissolutionRate': dissolutionRate,
      'dosage': dosage,
    }.withoutNulls,
  );

  return firestoreData;
}
