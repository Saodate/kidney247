import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutrientRecord extends FirestoreRecord {
  NutrientRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "phosphorus" field.
  double? _phosphorus;
  double get phosphorus => _phosphorus ?? 0.0;
  bool hasPhosphorus() => _phosphorus != null;

  // "protein" field.
  double? _protein;
  double get protein => _protein ?? 0.0;
  bool hasProtein() => _protein != null;

  // "potassium" field.
  double? _potassium;
  double get potassium => _potassium ?? 0.0;
  bool hasPotassium() => _potassium != null;

  // "sodium" field.
  double? _sodium;
  double get sodium => _sodium ?? 0.0;
  bool hasSodium() => _sodium != null;

  // "fluid_intake" field.
  double? _fluidIntake;
  double get fluidIntake => _fluidIntake ?? 0.0;
  bool hasFluidIntake() => _fluidIntake != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _phosphorus = castToType<double>(snapshotData['phosphorus']);
    _protein = castToType<double>(snapshotData['protein']);
    _potassium = castToType<double>(snapshotData['potassium']);
    _sodium = castToType<double>(snapshotData['sodium']);
    _fluidIntake = castToType<double>(snapshotData['fluid_intake']);
    _calories = castToType<double>(snapshotData['calories']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('nutrient')
          : FirebaseFirestore.instance.collectionGroup('nutrient');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('nutrient').doc();

  static Stream<NutrientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutrientRecord.fromSnapshot(s));

  static Future<NutrientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NutrientRecord.fromSnapshot(s));

  static NutrientRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NutrientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutrientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutrientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutrientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutrientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutrientRecordData({
  double? phosphorus,
  double? protein,
  double? potassium,
  double? sodium,
  double? fluidIntake,
  double? calories,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'phosphorus': phosphorus,
      'protein': protein,
      'potassium': potassium,
      'sodium': sodium,
      'fluid_intake': fluidIntake,
      'calories': calories,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutrientRecordDocumentEquality implements Equality<NutrientRecord> {
  const NutrientRecordDocumentEquality();

  @override
  bool equals(NutrientRecord? e1, NutrientRecord? e2) {
    return e1?.phosphorus == e2?.phosphorus &&
        e1?.protein == e2?.protein &&
        e1?.potassium == e2?.potassium &&
        e1?.sodium == e2?.sodium &&
        e1?.fluidIntake == e2?.fluidIntake &&
        e1?.calories == e2?.calories;
  }

  @override
  int hash(NutrientRecord? e) => const ListEquality().hash([
        e?.phosphorus,
        e?.protein,
        e?.potassium,
        e?.sodium,
        e?.fluidIntake,
        e?.calories
      ]);

  @override
  bool isValidKey(Object? o) => o is NutrientRecord;
}
