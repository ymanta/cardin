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

Future<List<String>> obtenerIdsDeRedContactos(
  DocumentReference? refContacto,
  DocumentReference? refUsuarioLogueado,
  String? idContacto,
) async {
  // Add your function code here!
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('miscontactos');

  // Consulta para obtener los IDs de contacto asociados a refContacto
  final query = collectionRef.where('propietario', isEqualTo: refContacto);
  final consulta = await query.get();

  // Extraer los valores de idcontacto de los documentos obtenidos de refContacto
  final idsContacto = <String>[];
  for (var doc in consulta.docs) {
    final data = doc.data() as Map<String,
        dynamic>?; // Asegurarse de que data() es un Map<String, dynamic>
    if (data != null && data.containsKey('idcontacto')) {
      final idcontacto = data['idcontacto'] as String?;
      if (idcontacto != null) {
        idsContacto.add(idcontacto);
      }
    }
  }

  // Consulta para obtener los IDs de contacto asociados a refUsuarioLogueado
  final queryIdsExcluidos =
      collectionRef.where('propietario', isEqualTo: refUsuarioLogueado);
  final consultaIdsExcluidos = await queryIdsExcluidos.get();

  // Extraer los valores de idcontacto de los documentos obtenidos de refUsuarioLogueado
  final idsExcluidos = <String>[];
  for (var doc in consultaIdsExcluidos.docs) {
    final data = doc.data() as Map<String,
        dynamic>?; // Asegurarse de que data() es un Map<String, dynamic>
    if (data != null && data.containsKey('idcontacto')) {
      final idcontacto = data['idcontacto'] as String?;
      if (idcontacto != null) {
        idsExcluidos.add(idcontacto);
      }
    }
  }

  // Eliminar de idsContacto aquellos IDs que también están en idsExcluidos
  idsContacto.removeWhere((id) => idsExcluidos.contains(id));
  // Eliminar el idContacto especificado si está presente en idsContacto
  if (idContacto != null) {
    idsContacto.remove(idContacto);
  }
  return idsContacto;
}
