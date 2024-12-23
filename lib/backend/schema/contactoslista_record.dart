import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContactoslistaRecord extends FirestoreRecord {
  ContactoslistaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "contactodelista" field.
  DocumentReference? _contactodelista;
  DocumentReference? get contactodelista => _contactodelista;
  bool hasContactodelista() => _contactodelista != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _contactodelista = snapshotData['contactodelista'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('contactoslista')
          : FirebaseFirestore.instance.collectionGroup('contactoslista');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('contactoslista').doc(id);

  static Stream<ContactoslistaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactoslistaRecord.fromSnapshot(s));

  static Future<ContactoslistaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactoslistaRecord.fromSnapshot(s));

  static ContactoslistaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactoslistaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactoslistaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactoslistaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactoslistaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactoslistaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactoslistaRecordData({
  DocumentReference? contactodelista,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contactodelista': contactodelista,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactoslistaRecordDocumentEquality
    implements Equality<ContactoslistaRecord> {
  const ContactoslistaRecordDocumentEquality();

  @override
  bool equals(ContactoslistaRecord? e1, ContactoslistaRecord? e2) {
    return e1?.contactodelista == e2?.contactodelista;
  }

  @override
  int hash(ContactoslistaRecord? e) =>
      const ListEquality().hash([e?.contactodelista]);

  @override
  bool isValidKey(Object? o) => o is ContactoslistaRecord;
}
