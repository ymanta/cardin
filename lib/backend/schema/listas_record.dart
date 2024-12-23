import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ListasRecord extends FirestoreRecord {
  ListasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "propietario" field.
  DocumentReference? _propietario;
  DocumentReference? get propietario => _propietario;
  bool hasPropietario() => _propietario != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _propietario = snapshotData['propietario'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listas');

  static Stream<ListasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListasRecord.fromSnapshot(s));

  static Future<ListasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListasRecord.fromSnapshot(s));

  static ListasRecord fromSnapshot(DocumentSnapshot snapshot) => ListasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListasRecordData({
  String? nombre,
  DocumentReference? propietario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'propietario': propietario,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListasRecordDocumentEquality implements Equality<ListasRecord> {
  const ListasRecordDocumentEquality();

  @override
  bool equals(ListasRecord? e1, ListasRecord? e2) {
    return e1?.nombre == e2?.nombre && e1?.propietario == e2?.propietario;
  }

  @override
  int hash(ListasRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.propietario]);

  @override
  bool isValidKey(Object? o) => o is ListasRecord;
}
