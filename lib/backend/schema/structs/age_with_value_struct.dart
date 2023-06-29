// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgeWithValueStruct extends FFFirebaseStruct {
  AgeWithValueStruct({
    int? age,
    double? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _age = age,
        _value = value,
        super(firestoreUtilData);

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;
  void incrementAge(int amount) => _age = age + amount;
  bool hasAge() => _age != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;
  void incrementValue(double amount) => _value = value + amount;
  bool hasValue() => _value != null;

  static AgeWithValueStruct fromMap(Map<String, dynamic> data) =>
      AgeWithValueStruct(
        age: castToType<int>(data['age']),
        value: castToType<double>(data['value']),
      );

  static AgeWithValueStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AgeWithValueStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'age': _age,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static AgeWithValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      AgeWithValueStruct(
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'AgeWithValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgeWithValueStruct &&
        age == other.age &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([age, value]);
}

AgeWithValueStruct createAgeWithValueStruct({
  int? age,
  double? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgeWithValueStruct(
      age: age,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgeWithValueStruct? updateAgeWithValueStruct(
  AgeWithValueStruct? ageWithValue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ageWithValue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgeWithValueStructData(
  Map<String, dynamic> firestoreData,
  AgeWithValueStruct? ageWithValue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ageWithValue == null) {
    return;
  }
  if (ageWithValue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && ageWithValue.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ageWithValueData =
      getAgeWithValueFirestoreData(ageWithValue, forFieldValue);
  final nestedData =
      ageWithValueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = ageWithValue.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgeWithValueFirestoreData(
  AgeWithValueStruct? ageWithValue, [
  bool forFieldValue = false,
]) {
  if (ageWithValue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ageWithValue.toMap());

  // Add any Firestore field values
  ageWithValue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgeWithValueListFirestoreData(
  List<AgeWithValueStruct>? ageWithValues,
) =>
    ageWithValues?.map((e) => getAgeWithValueFirestoreData(e, true)).toList() ??
    [];
