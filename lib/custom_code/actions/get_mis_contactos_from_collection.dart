// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MiscontactosRecord>> getMisContactosFromCollection(
  String? collectionName,
  int? limite,
  String orden,
  bool ordenAlfabetico,
  DocumentReference propietario,
) async {
  // Add your function code here!
  collectionName ??= 'miscontactos';
  limite ??= -1;

  List<MiscontactosRecord> docs = [];

  // Obtén una referencia a la base de datos de Firestore
  final firestore = FirebaseFirestore.instance;

  // Obtén una referencia a la colección especificada
  final collectionRef = firestore.collection(collectionName);

  // Construye la consulta ordenando por display_name, con el valor de descending especificado
  //Query query =
  //collectionRef.orderBy(orden, descending: ordenAlfabetico);
  // Query para filtrar por propietario y ordenar por fecha
  Query query =
      collectionRef.where('propietario', isEqualTo: propietario).orderBy(orden);

  // Aplica el límite si se especifica
  if (limite > 0) {
    query = query.limit(limite);
  }

  // Obtén los documentos de la colección
  final querySnapshot = await query.get();

  // Itera a través de los documentos y crea instancias de UsersRecord
  for (var doc in querySnapshot.docs) {
    MiscontactosRecord miscontactosRecord =
        await MiscontactosRecord.getDocumentOnce(doc.reference);
    docs.add(miscontactosRecord);
  }
  return docs;
}
