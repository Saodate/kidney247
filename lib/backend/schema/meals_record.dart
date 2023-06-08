import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealsRecord extends FirestoreRecord {
  MealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

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

  // "qty" field.
  double? _qty;
  double get qty => _qty ?? 0.0;
  bool hasQty() => _qty != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "fluid" field.
  double? _fluid;
  double get fluid => _fluid ?? 0.0;
  bool hasFluid() => _fluid != null;

  // "gram" field.
  double? _gram;
  double get gram => _gram ?? 0.0;
  bool hasGram() => _gram != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phosphorus = castToType<double>(snapshotData['phosphorus']);
    _protein = castToType<double>(snapshotData['protein']);
    _potassium = castToType<double>(snapshotData['potassium']);
    _sodium = castToType<double>(snapshotData['sodium']);
    _qty = castToType<double>(snapshotData['qty']);
    _unit = snapshotData['unit'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _photo = snapshotData['photo'] as String?;
    _fluid = castToType<double>(snapshotData['fluid']);
    _gram = castToType<double>(snapshotData['gram']);
    _calories = castToType<double>(snapshotData['calories']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meals');

  static Stream<MealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealsRecord.fromSnapshot(s));

  static Future<MealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealsRecord.fromSnapshot(s));

  static MealsRecord fromSnapshot(DocumentSnapshot snapshot) => MealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMealsRecordData({
  String? name,
  double? phosphorus,
  double? protein,
  double? potassium,
  double? sodium,
  double? qty,
  String? unit,
  DateTime? createdAt,
  DocumentReference? userRef,
  String? photo,
  double? fluid,
  double? gram,
  double? calories,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phosphorus': phosphorus,
      'protein': protein,
      'potassium': potassium,
      'sodium': sodium,
      'qty': qty,
      'unit': unit,
      'created_at': createdAt,
      'user_ref': userRef,
      'photo': photo,
      'fluid': fluid,
      'gram': gram,
      'calories': calories,
    }.withoutNulls,
  );

  return firestoreData;
}
