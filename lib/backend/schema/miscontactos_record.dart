import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MiscontactosRecord extends FirestoreRecord {
  MiscontactosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "propietario" field.
  DocumentReference? _propietario;
  DocumentReference? get propietario => _propietario;
  bool hasPropietario() => _propietario != null;

  // "bloqueado" field.
  bool? _bloqueado;
  bool get bloqueado => _bloqueado ?? false;
  bool hasBloqueado() => _bloqueado != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "idcontacto" field.
  String? _idcontacto;
  String get idcontacto => _idcontacto ?? '';
  bool hasIdcontacto() => _idcontacto != null;

  // "nombrecompleto" field.
  String? _nombrecompleto;
  String get nombrecompleto => _nombrecompleto ?? '';
  bool hasNombrecompleto() => _nombrecompleto != null;

  // "ocupacion" field.
  String? _ocupacion;
  String get ocupacion => _ocupacion ?? '';
  bool hasOcupacion() => _ocupacion != null;

  void _initializeFields() {
    _propietario = snapshotData['propietario'] as DocumentReference?;
    _bloqueado = snapshotData['bloqueado'] as bool?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _idcontacto = snapshotData['idcontacto'] as String?;
    _nombrecompleto = snapshotData['nombrecompleto'] as String?;
    _ocupacion = snapshotData['ocupacion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('miscontactos');

  static Stream<MiscontactosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MiscontactosRecord.fromSnapshot(s));

  static Future<MiscontactosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MiscontactosRecord.fromSnapshot(s));

  static MiscontactosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MiscontactosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MiscontactosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MiscontactosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MiscontactosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MiscontactosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMiscontactosRecordData({
  DocumentReference? propietario,
  bool? bloqueado,
  DateTime? fecha,
  String? idcontacto,
  String? nombrecompleto,
  String? ocupacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'propietario': propietario,
      'bloqueado': bloqueado,
      'fecha': fecha,
      'idcontacto': idcontacto,
      'nombrecompleto': nombrecompleto,
      'ocupacion': ocupacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class MiscontactosRecordDocumentEquality
    implements Equality<MiscontactosRecord> {
  const MiscontactosRecordDocumentEquality();

  @override
  bool equals(MiscontactosRecord? e1, MiscontactosRecord? e2) {
    return e1?.propietario == e2?.propietario &&
        e1?.bloqueado == e2?.bloqueado &&
        e1?.fecha == e2?.fecha &&
        e1?.idcontacto == e2?.idcontacto &&
        e1?.nombrecompleto == e2?.nombrecompleto &&
        e1?.ocupacion == e2?.ocupacion;
  }

  @override
  int hash(MiscontactosRecord? e) => const ListEquality().hash([
        e?.propietario,
        e?.bloqueado,
        e?.fecha,
        e?.idcontacto,
        e?.nombrecompleto,
        e?.ocupacion
      ]);

  @override
  bool isValidKey(Object? o) => o is MiscontactosRecord;
}
