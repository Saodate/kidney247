import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoCommentReplyRecord extends FirestoreRecord {
  VideoCommentReplyRecord._(
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

  // "videoRef" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _likeBy = getDataList(snapshotData['likeBy']);
    _videoRef = snapshotData['videoRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('video_comment_reply')
          : FirebaseFirestore.instance.collectionGroup('video_comment_reply');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('video_comment_reply').doc();

  static Stream<VideoCommentReplyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoCommentReplyRecord.fromSnapshot(s));

  static Future<VideoCommentReplyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VideoCommentReplyRecord.fromSnapshot(s));

  static VideoCommentReplyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoCommentReplyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoCommentReplyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoCommentReplyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoCommentReplyRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createVideoCommentReplyRecordData({
  DocumentReference? userRef,
  String? comment,
  DateTime? createdAt,
  DocumentReference? videoRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'comment': comment,
      'createdAt': createdAt,
      'videoRef': videoRef,
    }.withoutNulls,
  );

  return firestoreData;
}
