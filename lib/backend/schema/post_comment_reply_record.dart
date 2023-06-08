import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostCommentReplyRecord extends FirestoreRecord {
  PostCommentReplyRecord._(
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

  // "likeBy" field.
  List<DocumentReference>? _likeBy;
  List<DocumentReference> get likeBy => _likeBy ?? const [];
  bool hasLikeBy() => _likeBy != null;

  // "postRef" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _likeBy = getDataList(snapshotData['likeBy']);
    _postRef = snapshotData['postRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('post_comment_reply')
          : FirebaseFirestore.instance.collectionGroup('post_comment_reply');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('post_comment_reply').doc();

  static Stream<PostCommentReplyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostCommentReplyRecord.fromSnapshot(s));

  static Future<PostCommentReplyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PostCommentReplyRecord.fromSnapshot(s));

  static PostCommentReplyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostCommentReplyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostCommentReplyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostCommentReplyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostCommentReplyRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPostCommentReplyRecordData({
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
