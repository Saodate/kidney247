import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoCommentsRecord extends FirestoreRecord {
  VideoCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "video_ref" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  // "likedBy" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _comment = snapshotData['comment'] as String?;
    _videoRef = snapshotData['video_ref'] as DocumentReference?;
    _likedBy = getDataList(snapshotData['likedBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video_comments');

  static Stream<VideoCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoCommentsRecord.fromSnapshot(s));

  static Future<VideoCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoCommentsRecord.fromSnapshot(s));

  static VideoCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoCommentsRecordData({
  DocumentReference? userRef,
  DateTime? createdAt,
  String? comment,
  DocumentReference? videoRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'created_at': createdAt,
      'comment': comment,
      'video_ref': videoRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoCommentsRecordDocumentEquality
    implements Equality<VideoCommentsRecord> {
  const VideoCommentsRecordDocumentEquality();

  @override
  bool equals(VideoCommentsRecord? e1, VideoCommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.comment == e2?.comment &&
        e1?.videoRef == e2?.videoRef &&
        listEquality.equals(e1?.likedBy, e2?.likedBy);
  }

  @override
  int hash(VideoCommentsRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.createdAt, e?.comment, e?.videoRef, e?.likedBy]);

  @override
  bool isValidKey(Object? o) => o is VideoCommentsRecord;
}
