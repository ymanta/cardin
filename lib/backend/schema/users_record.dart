import 'dart:async';

import 'package:cardin_tarjeta_digital/backend/schema/util/schema_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "nombrecompleto" field.
  String? _nombrecompleto;
  String get nombrecompleto => _nombrecompleto ?? '';
  bool hasNombrecompleto() => _nombrecompleto != null;

  // "ocupacion" field.
  String? _ocupacion;
  String get ocupacion => _ocupacion ?? '';
  bool hasOcupacion() => _ocupacion != null;

  // "empresa" field.
  String? _empresa;
  String get empresa => _empresa ?? '';
  bool hasEmpresa() => _empresa != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  bool hasPais() => _pais != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "fechanacimiento" field.
  DateTime? _fechanacimiento;
  DateTime? get fechanacimiento => _fechanacimiento;
  bool hasFechanacimiento() => _fechanacimiento != null;

  // "resumen" field.
  String? _resumen;
  String get resumen => _resumen ?? '';
  bool hasResumen() => _resumen != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "twitter" field.
  String? _twitter;
  String get twitter => _twitter ?? '';
  bool hasTwitter() => _twitter != null;

  // "web" field.
  String? _web;
  String get web => _web ?? '';
  bool hasWeb() => _web != null;

  // "contactos" field.
  List<DocumentReference>? _contactos;
  List<DocumentReference> get contactos => _contactos ?? const [];
  bool hasContactos() => _contactos != null;

  // "intereses" field.
  List<String>? _intereses;
  List<String> get intereses => _intereses ?? const [];
  bool hasIntereses() => _intereses != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "qr" field.
  String? _qr;
  String get qr => _qr ?? '';
  bool hasQr() => _qr != null;

  // "evento" field.
  String? _evento;
  String get evento => _evento ?? '';
  bool hasEvento() => _evento != null;

  // "tipodoc" field.
  String? _tipodoc;
  String get tipodoc => _tipodoc ?? '';
  bool hasTipodoc() => _tipodoc != null;

  // "numdoc" field.
  String? _numdoc;
  String get numdoc => _numdoc ?? '';
  bool hasNumdoc() => _numdoc != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _nombrecompleto = snapshotData['nombrecompleto'] as String?;
    _ocupacion = snapshotData['ocupacion'] as String?;
    _empresa = snapshotData['empresa'] as String?;
    _pais = snapshotData['pais'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _fechanacimiento = snapshotData['fechanacimiento'] as DateTime?;
    _resumen = snapshotData['resumen'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _linkedin = snapshotData['linkedin'] as String?;
    _whatsapp = snapshotData['whatsapp'] as String?;
    _twitter = snapshotData['twitter'] as String?;
    _web = snapshotData['web'] as String?;
    _contactos = getDataList(snapshotData['contactos']);
    _intereses = getDataList(snapshotData['intereses']);
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _qr = snapshotData['qr'] as String?;
    _evento = snapshotData['evento'] as String?;
    _tipodoc = snapshotData['tipodoc'] as String?;
    _numdoc = snapshotData['numdoc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? nombrecompleto,
  String? ocupacion,
  String? empresa,
  String? pais,
  String? direccion,
  DateTime? fechanacimiento,
  String? resumen,
  String? facebook,
  String? instagram,
  String? linkedin,
  String? whatsapp,
  String? twitter,
  String? web,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? qr,
  String? evento,
  String? tipodoc,
  String? numdoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'nombrecompleto': nombrecompleto,
      'ocupacion': ocupacion,
      'empresa': empresa,
      'pais': pais,
      'direccion': direccion,
      'fechanacimiento': fechanacimiento,
      'resumen': resumen,
      'facebook': facebook,
      'instagram': instagram,
      'linkedin': linkedin,
      'whatsapp': whatsapp,
      'twitter': twitter,
      'web': web,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'qr': qr,
      'evento': evento,
      'tipodoc': tipodoc,
      'numdoc': numdoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.nombrecompleto == e2?.nombrecompleto &&
        e1?.ocupacion == e2?.ocupacion &&
        e1?.empresa == e2?.empresa &&
        e1?.pais == e2?.pais &&
        e1?.direccion == e2?.direccion &&
        e1?.fechanacimiento == e2?.fechanacimiento &&
        e1?.resumen == e2?.resumen &&
        e1?.facebook == e2?.facebook &&
        e1?.instagram == e2?.instagram &&
        e1?.linkedin == e2?.linkedin &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.twitter == e2?.twitter &&
        e1?.web == e2?.web &&
        listEquality.equals(e1?.contactos, e2?.contactos) &&
        listEquality.equals(e1?.intereses, e2?.intereses) &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.qr == e2?.qr &&
        e1?.evento == e2?.evento &&
        e1?.tipodoc == e2?.tipodoc &&
        e1?.numdoc == e2?.numdoc;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.nombrecompleto,
        e?.ocupacion,
        e?.empresa,
        e?.pais,
        e?.direccion,
        e?.fechanacimiento,
        e?.resumen,
        e?.facebook,
        e?.instagram,
        e?.linkedin,
        e?.whatsapp,
        e?.twitter,
        e?.web,
        e?.contactos,
        e?.intereses,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.qr,
        e?.evento,
        e?.tipodoc,
        e?.numdoc
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
