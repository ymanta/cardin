import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NotasRecord extends FirestoreRecord {
  NotasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "propietario" field.
  DocumentReference? _propietario;
  DocumentReference? get propietario => _propietario;
  bool hasPropietario() => _propietario != null;

  // "contacto" field.
  DocumentReference? _contacto;
  DocumentReference? get contacto => _contacto;
  bool hasContacto() => _contacto != null;

  // "nota" field.
  String? _nota;
  String get nota => _nota ?? '';
  bool hasNota() => _nota != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  void _initializeFields() {
    _propietario = snapshotData['propietario'] as DocumentReference?;
    _contacto = snapshotData['contacto'] as DocumentReference?;
    _nota = snapshotData['nota'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notas');

  static Stream<NotasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotasRecord.fromSnapshot(s));

  static Future<NotasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotasRecord.fromSnapshot(s));

  static NotasRecord fromSnapshot(DocumentSnapshot snapshot) => NotasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotasRecordData({
  DocumentReference? propietario,
  DocumentReference? contacto,
  String? nota,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'propietario': propietario,
      'contacto': contacto,
      'nota': nota,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotasRecordDocumentEquality implements Equality<NotasRecord> {
  const NotasRecordDocumentEquality();

  @override
  bool equals(NotasRecord? e1, NotasRecord? e2) {
    return e1?.propietario == e2?.propietario &&
        e1?.contacto == e2?.contacto &&
        e1?.nota == e2?.nota &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(NotasRecord? e) => const ListEquality()
      .hash([e?.propietario, e?.contacto, e?.nota, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is NotasRecord;
}
