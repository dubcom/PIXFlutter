import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeyUserRecord extends FirestoreRecord {
  KeyUserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cityPIX" field.
  String? _cityPIX;
  String get cityPIX => _cityPIX ?? '';
  bool hasCityPIX() => _cityPIX != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "namePIX" field.
  String? _namePIX;
  String get namePIX => _namePIX ?? '';
  bool hasNamePIX() => _namePIX != null;

  // "authoID" field.
  DocumentReference? _authoID;
  DocumentReference? get authoID => _authoID;
  bool hasAuthoID() => _authoID != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "keyPIX" field.
  String? _keyPIX;
  String get keyPIX => _keyPIX ?? '';
  bool hasKeyPIX() => _keyPIX != null;

  // "statusPIX" field.
  bool? _statusPIX;
  bool get statusPIX => _statusPIX ?? false;
  bool hasStatusPIX() => _statusPIX != null;

  void _initializeFields() {
    _cityPIX = snapshotData['cityPIX'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _namePIX = snapshotData['namePIX'] as String?;
    _authoID = snapshotData['authoID'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _keyPIX = snapshotData['keyPIX'] as String?;
    _statusPIX = snapshotData['statusPIX'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('keyUser');

  static Stream<KeyUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KeyUserRecord.fromSnapshot(s));

  static Future<KeyUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KeyUserRecord.fromSnapshot(s));

  static KeyUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KeyUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KeyUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KeyUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KeyUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KeyUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKeyUserRecordData({
  String? cityPIX,
  DateTime? createdAt,
  String? namePIX,
  DocumentReference? authoID,
  String? description,
  String? keyPIX,
  bool? statusPIX,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cityPIX': cityPIX,
      'createdAt': createdAt,
      'namePIX': namePIX,
      'authoID': authoID,
      'description': description,
      'keyPIX': keyPIX,
      'statusPIX': statusPIX,
    }.withoutNulls,
  );

  return firestoreData;
}

class KeyUserRecordDocumentEquality implements Equality<KeyUserRecord> {
  const KeyUserRecordDocumentEquality();

  @override
  bool equals(KeyUserRecord? e1, KeyUserRecord? e2) {
    return e1?.cityPIX == e2?.cityPIX &&
        e1?.createdAt == e2?.createdAt &&
        e1?.namePIX == e2?.namePIX &&
        e1?.authoID == e2?.authoID &&
        e1?.description == e2?.description &&
        e1?.keyPIX == e2?.keyPIX &&
        e1?.statusPIX == e2?.statusPIX;
  }

  @override
  int hash(KeyUserRecord? e) => const ListEquality().hash([
        e?.cityPIX,
        e?.createdAt,
        e?.namePIX,
        e?.authoID,
        e?.description,
        e?.keyPIX,
        e?.statusPIX
      ]);

  @override
  bool isValidKey(Object? o) => o is KeyUserRecord;
}
