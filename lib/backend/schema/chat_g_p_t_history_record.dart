import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatGPTHistoryRecord extends FirestoreRecord {
  ChatGPTHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "history" field.
  List<String>? _history;
  List<String> get history => _history ?? const [];
  bool hasHistory() => _history != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _history = getDataList(snapshotData['history']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatGPTHistory');

  static Stream<ChatGPTHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatGPTHistoryRecord.fromSnapshot(s));

  static Future<ChatGPTHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatGPTHistoryRecord.fromSnapshot(s));

  static ChatGPTHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatGPTHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatGPTHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatGPTHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatGPTHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatGPTHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatGPTHistoryRecordData({
  DocumentReference? userRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatGPTHistoryRecordDocumentEquality
    implements Equality<ChatGPTHistoryRecord> {
  const ChatGPTHistoryRecordDocumentEquality();

  @override
  bool equals(ChatGPTHistoryRecord? e1, ChatGPTHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.history, e2?.history) &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ChatGPTHistoryRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.history, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is ChatGPTHistoryRecord;
}
