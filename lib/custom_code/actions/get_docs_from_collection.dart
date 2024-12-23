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

Future<List<UsersRecord>> getDocsFromCollection(
  String? collectionName,
  int? limit,
  bool ordenAlfabetico,
) async {
  // Add your function code here!
  collectionName ??= 'users';
  limit ??= -1;

  List<UsersRecord> docs = [];

  // Obtén una referencia a la base de datos de Firestore
  final firestore = FirebaseFirestore.instance;

  // Obtén una referencia a la colección especificada
  final collectionRef = firestore.collection(collectionName);

  // Construye la consulta ordenando por display_name, con el valor de descending especificado
  Query query =
      collectionRef.orderBy('display_name', descending: ordenAlfabetico);

  // Aplica el límite si se especifica
  if (limit > 0) {
    query = query.limit(limit);
  }

  // Obtén los documentos de la colección
  final querySnapshot = await query.get();

  // Itera a través de los documentos y crea instancias de UsersRecord
  for (var doc in querySnapshot.docs) {
    UsersRecord usersRecord = await UsersRecord.getDocumentOnce(doc.reference);
    docs.add(usersRecord);
  }

  return docs;
}
