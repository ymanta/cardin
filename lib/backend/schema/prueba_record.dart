import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PruebaRecord extends FirestoreRecord {
  PruebaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prueba');

  static Stream<PruebaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PruebaRecord.fromSnapshot(s));

  static Future<PruebaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PruebaRecord.fromSnapshot(s));

  static PruebaRecord fromSnapshot(DocumentSnapshot snapshot) => PruebaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PruebaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PruebaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PruebaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PruebaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPruebaRecordData({
  String? name,
  String? description,
  double? price,
  DateTime? createdAt,
  DateTime? modifiedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'created_at': createdAt,
      'modified_at': modifiedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PruebaRecordDocumentEquality implements Equality<PruebaRecord> {
  const PruebaRecordDocumentEquality();

  @override
  bool equals(PruebaRecord? e1, PruebaRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt;
  }

  @override
  int hash(PruebaRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.price, e?.createdAt, e?.modifiedAt]);

  @override
  bool isValidKey(Object? o) => o is PruebaRecord;
}
