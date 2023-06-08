import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostCommentsRecord extends FirestoreRecord {
  PostCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "postRef" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "likeBy" field.
  List<DocumentReference>? _likeBy;
  List<DocumentReference> get likeBy => _likeBy ?? const [];
  bool hasLikeBy() => _likeBy != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _postRef = snapshotData['postRef'] as DocumentReference?;
    _likeBy = getDataList(snapshotData['likeBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post_comments');

  static Stream<PostCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostCommentsRecord.fromSnapshot(s));

  static Future<PostCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostCommentsRecord.fromSnapshot(s));

  static PostCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostCommentsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPostCommentsRecordData({
  DocumentReference? userRef,
  String? comment,
  DateTime? createdAt,
  DocumentReference? postRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'comment': comment,
      'createdAt': createdAt,
      'postRef': postRef,
    }.withoutNulls,
  );

  return firestoreData;
}
