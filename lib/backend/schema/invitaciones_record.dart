import 'dart:async';

import 'package:cardin_tarjeta_digital/backend/schema/util/schema_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InvitacionesRecord extends FirestoreRecord {
  InvitacionesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "estatus" field.
  bool? _estatus;
  bool get estatus => _estatus ?? false;
  bool hasEstatus() => _estatus != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _userA = snapshotData['user_a'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _estatus = snapshotData['estatus'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invitaciones');

  static Stream<InvitacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvitacionesRecord.fromSnapshot(s));

  static Future<InvitacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvitacionesRecord.fromSnapshot(s));

  static InvitacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvitacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvitacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvitacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvitacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvitacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvitacionesRecordData({
  DocumentReference? userA,
  DocumentReference? userB,
  bool? estatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_a': userA,
      'user_b': userB,
      'estatus': estatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvitacionesRecordDocumentEquality
    implements Equality<InvitacionesRecord> {
  const InvitacionesRecordDocumentEquality();

  @override
  bool equals(InvitacionesRecord? e1, InvitacionesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.userA == e2?.userA &&
        e1?.userB == e2?.userB &&
        e1?.estatus == e2?.estatus;
  }

  @override
  int hash(InvitacionesRecord? e) =>
      const ListEquality().hash([e?.users, e?.userA, e?.userB, e?.estatus]);

  @override
  bool isValidKey(Object? o) => o is InvitacionesRecord;
}
