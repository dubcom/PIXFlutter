import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PIXCreatedRecord extends FirestoreRecord {
  PIXCreatedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "authorId" field.
  DocumentReference? _authorId;
  DocumentReference? get authorId => _authorId;
  bool hasAuthorId() => _authorId != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "textId" field.
  String? _textId;
  String get textId => _textId ?? '';
  bool hasTextId() => _textId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "valuePIX" field.
  double? _valuePIX;
  double get valuePIX => _valuePIX ?? 0.0;
  bool hasValuePIX() => _valuePIX != null;

  void _initializeFields() {
    _authorId = snapshotData['authorId'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _textId = snapshotData['textId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _valuePIX = castToType<double>(snapshotData['valuePIX']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PIXCreated');

  static Stream<PIXCreatedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PIXCreatedRecord.fromSnapshot(s));

  static Future<PIXCreatedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PIXCreatedRecord.fromSnapshot(s));

  static PIXCreatedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PIXCreatedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PIXCreatedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PIXCreatedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PIXCreatedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PIXCreatedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPIXCreatedRecordData({
  DocumentReference? authorId,
  String? message,
  String? textId,
  DateTime? createdAt,
  double? valuePIX,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'authorId': authorId,
      'message': message,
      'textId': textId,
      'createdAt': createdAt,
      'valuePIX': valuePIX,
    }.withoutNulls,
  );

  return firestoreData;
}

class PIXCreatedRecordDocumentEquality implements Equality<PIXCreatedRecord> {
  const PIXCreatedRecordDocumentEquality();

  @override
  bool equals(PIXCreatedRecord? e1, PIXCreatedRecord? e2) {
    return e1?.authorId == e2?.authorId &&
        e1?.message == e2?.message &&
        e1?.textId == e2?.textId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.valuePIX == e2?.valuePIX;
  }

  @override
  int hash(PIXCreatedRecord? e) => const ListEquality()
      .hash([e?.authorId, e?.message, e?.textId, e?.createdAt, e?.valuePIX]);

  @override
  bool isValidKey(Object? o) => o is PIXCreatedRecord;
}
