// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ListavaciainteresesStruct extends FFFirebaseStruct {
  ListavaciainteresesStruct({
    List<String>? cajaintereses,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cajaintereses = cajaintereses,
        super(firestoreUtilData);

  // "cajaintereses" field.
  List<String>? _cajaintereses;
  List<String> get cajaintereses => _cajaintereses ?? const [];
  set cajaintereses(List<String>? val) => _cajaintereses = val;

  void updateCajaintereses(Function(List<String>) updateFn) {
    updateFn(_cajaintereses ??= []);
  }

  bool hasCajaintereses() => _cajaintereses != null;

  static ListavaciainteresesStruct fromMap(Map<String, dynamic> data) =>
      ListavaciainteresesStruct(
        cajaintereses: getDataList(data['cajaintereses']),
      );

  static ListavaciainteresesStruct? maybeFromMap(dynamic data) => data is Map
      ? ListavaciainteresesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cajaintereses': _cajaintereses,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cajaintereses': serializeParam(
          _cajaintereses,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ListavaciainteresesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ListavaciainteresesStruct(
        cajaintereses: deserializeParam<String>(
          data['cajaintereses'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ListavaciainteresesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListavaciainteresesStruct &&
        listEquality.equals(cajaintereses, other.cajaintereses);
  }

  @override
  int get hashCode => const ListEquality().hash([cajaintereses]);
}

ListavaciainteresesStruct createListavaciainteresesStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ListavaciainteresesStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ListavaciainteresesStruct? updateListavaciainteresesStruct(
  ListavaciainteresesStruct? listavaciaintereses, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    listavaciaintereses
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addListavaciainteresesStructData(
  Map<String, dynamic> firestoreData,
  ListavaciainteresesStruct? listavaciaintereses,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (listavaciaintereses == null) {
    return;
  }
  if (listavaciaintereses.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && listavaciaintereses.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final listavaciainteresesData =
      getListavaciainteresesFirestoreData(listavaciaintereses, forFieldValue);
  final nestedData =
      listavaciainteresesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      listavaciaintereses.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getListavaciainteresesFirestoreData(
  ListavaciainteresesStruct? listavaciaintereses, [
  bool forFieldValue = false,
]) {
  if (listavaciaintereses == null) {
    return {};
  }
  final firestoreData = mapToFirestore(listavaciaintereses.toMap());

  // Add any Firestore field values
  listavaciaintereses.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getListavaciainteresesListFirestoreData(
  List<ListavaciainteresesStruct>? listavaciainteresess,
) =>
    listavaciainteresess
        ?.map((e) => getListavaciainteresesFirestoreData(e, true))
        .toList() ??
    [];
