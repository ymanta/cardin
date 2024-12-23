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

Future<List<MiscontactosRecord>> obtenerRedDeContactos(
  DocumentReference? refDelContacto,
  DocumentReference? refDelUsuarioActual,
) async {
  // Add your function code here!
  List<MiscontactosRecord> docs = [];

  // Obtén una referencia a la base de datos de Firestore
  final firestore = FirebaseFirestore.instance;
  // Obtén una referencia a la colección especificada
  final collectionRef = firestore.collection('miscontactos');

  final query = collectionRef.where('propietario', isEqualTo: refDelContacto);
  //.where('idcontacto', isNotEqualTo: 'dEkWHkwz8AMfCYAniNQwvEoRGmO2');

  // Ejecuta la segunda consulta y obtén los documentos
  final consulta = await query.get();

  // Itera a través de los documentos y crea instancias de MiscontactosRecord
  for (var doc in consulta.docs) {
    MiscontactosRecord miscontactosRecord =
        await MiscontactosRecord.getDocumentOnce(doc.reference);
    docs.add(miscontactosRecord);
  }

  return docs;
}
