import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomMealRecord extends FirestoreRecord {
  CustomMealRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "qty" field.
  double? _qty;
  double get qty => _qty ?? 0.0;
  bool hasQty() => _qty != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "phosphorus" field.
  double? _phosphorus;
  double get phosphorus => _phosphorus ?? 0.0;
  bool hasPhosphorus() => _phosphorus != null;

  // "potassium" field.
  double? _potassium;
  double get potassium => _potassium ?? 0.0;
  bool hasPotassium() => _potassium != null;

  // "sodium" field.
  double? _sodium;
  double get sodium => _sodium ?? 0.0;
  bool hasSodium() => _sodium != null;

  // "fluid" field.
  double? _fluid;
  double get fluid => _fluid ?? 0.0;
  bool hasFluid() => _fluid != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "protein" field.
  double? _protein;
  double get protein => _protein ?? 0.0;
  bool hasProtein() => _protein != null;

  // "wasted" field.
  double? _wasted;
  double get wasted => _wasted ?? 0.0;
  bool hasWasted() => _wasted != null;

  // "fat" field.
  double? _fat;
  double get fat => _fat ?? 0.0;
  bool hasFat() => _fat != null;

  // "carbohydrate" field.
  double? _carbohydrate;
  double get carbohydrate => _carbohydrate ?? 0.0;
  bool hasCarbohydrate() => _carbohydrate != null;

  // "fiber" field.
  double? _fiber;
  double get fiber => _fiber ?? 0.0;
  bool hasFiber() => _fiber != null;

  // "iron" field.
  double? _iron;
  double get iron => _iron ?? 0.0;
  bool hasIron() => _iron != null;

  // "vitaminA" field.
  double? _vitaminA;
  double get vitaminA => _vitaminA ?? 0.0;
  bool hasVitaminA() => _vitaminA != null;

  // "vitaminB1" field.
  double? _vitaminB1;
  double get vitaminB1 => _vitaminB1 ?? 0.0;
  bool hasVitaminB1() => _vitaminB1 != null;

  // "vitaminC" field.
  double? _vitaminC;
  double get vitaminC => _vitaminC ?? 0.0;
  bool hasVitaminC() => _vitaminC != null;

  // "betacaroteen" field.
  double? _betacaroteen;
  double get betacaroteen => _betacaroteen ?? 0.0;
  bool hasBetacaroteen() => _betacaroteen != null;

  // "canxi" field.
  double? _canxi;
  double get canxi => _canxi ?? 0.0;
  bool hasCanxi() => _canxi != null;

  // "cholesterone" field.
  double? _cholesterone;
  double get cholesterone => _cholesterone ?? 0.0;
  bool hasCholesterone() => _cholesterone != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _qty = castToType<double>(snapshotData['qty']);
    _unit = snapshotData['unit'] as String?;
    _phosphorus = castToType<double>(snapshotData['phosphorus']);
    _potassium = castToType<double>(snapshotData['potassium']);
    _sodium = castToType<double>(snapshotData['sodium']);
    _fluid = castToType<double>(snapshotData['fluid']);
    _photo = snapshotData['photo'] as String?;
    _protein = castToType<double>(snapshotData['protein']);
    _wasted = castToType<double>(snapshotData['wasted']);
    _fat = castToType<double>(snapshotData['fat']);
    _carbohydrate = castToType<double>(snapshotData['carbohydrate']);
    _fiber = castToType<double>(snapshotData['fiber']);
    _iron = castToType<double>(snapshotData['iron']);
    _vitaminA = castToType<double>(snapshotData['vitaminA']);
    _vitaminB1 = castToType<double>(snapshotData['vitaminB1']);
    _vitaminC = castToType<double>(snapshotData['vitaminC']);
    _betacaroteen = castToType<double>(snapshotData['betacaroteen']);
    _canxi = castToType<double>(snapshotData['canxi']);
    _cholesterone = castToType<double>(snapshotData['cholesterone']);
    _calories = castToType<double>(snapshotData['calories']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customMeal');

  static Stream<CustomMealRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomMealRecord.fromSnapshot(s));

  static Future<CustomMealRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomMealRecord.fromSnapshot(s));

  static CustomMealRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomMealRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomMealRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomMealRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomMealRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomMealRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomMealRecordData({
  String? name,
  double? qty,
  String? unit,
  double? phosphorus,
  double? potassium,
  double? sodium,
  double? fluid,
  String? photo,
  double? protein,
  double? wasted,
  double? fat,
  double? carbohydrate,
  double? fiber,
  double? iron,
  double? vitaminA,
  double? vitaminB1,
  double? vitaminC,
  double? betacaroteen,
  double? canxi,
  double? cholesterone,
  double? calories,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'qty': qty,
      'unit': unit,
      'phosphorus': phosphorus,
      'potassium': potassium,
      'sodium': sodium,
      'fluid': fluid,
      'photo': photo,
      'protein': protein,
      'wasted': wasted,
      'fat': fat,
      'carbohydrate': carbohydrate,
      'fiber': fiber,
      'iron': iron,
      'vitaminA': vitaminA,
      'vitaminB1': vitaminB1,
      'vitaminC': vitaminC,
      'betacaroteen': betacaroteen,
      'canxi': canxi,
      'cholesterone': cholesterone,
      'calories': calories,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomMealRecordDocumentEquality implements Equality<CustomMealRecord> {
  const CustomMealRecordDocumentEquality();

  @override
  bool equals(CustomMealRecord? e1, CustomMealRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.qty == e2?.qty &&
        e1?.unit == e2?.unit &&
        e1?.phosphorus == e2?.phosphorus &&
        e1?.potassium == e2?.potassium &&
        e1?.sodium == e2?.sodium &&
        e1?.fluid == e2?.fluid &&
        e1?.photo == e2?.photo &&
        e1?.protein == e2?.protein &&
        e1?.wasted == e2?.wasted &&
        e1?.fat == e2?.fat &&
        e1?.carbohydrate == e2?.carbohydrate &&
        e1?.fiber == e2?.fiber &&
        e1?.iron == e2?.iron &&
        e1?.vitaminA == e2?.vitaminA &&
        e1?.vitaminB1 == e2?.vitaminB1 &&
        e1?.vitaminC == e2?.vitaminC &&
        e1?.betacaroteen == e2?.betacaroteen &&
        e1?.canxi == e2?.canxi &&
        e1?.cholesterone == e2?.cholesterone &&
        e1?.calories == e2?.calories;
  }

  @override
  int hash(CustomMealRecord? e) => const ListEquality().hash([
        e?.name,
        e?.qty,
        e?.unit,
        e?.phosphorus,
        e?.potassium,
        e?.sodium,
        e?.fluid,
        e?.photo,
        e?.protein,
        e?.wasted,
        e?.fat,
        e?.carbohydrate,
        e?.fiber,
        e?.iron,
        e?.vitaminA,
        e?.vitaminB1,
        e?.vitaminC,
        e?.betacaroteen,
        e?.canxi,
        e?.cholesterone,
        e?.calories
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomMealRecord;
}
