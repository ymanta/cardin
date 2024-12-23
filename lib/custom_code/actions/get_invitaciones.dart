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

Future<List<InvitacionesRecord>> getInvitaciones(
  String? collectionName,
  DocumentReference? usuarioActual,
) async {
  // Add your function code here!
  collectionName ??= 'invitaciones';

  List<InvitacionesRecord> docs = [];

  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection(collectionName);

  Query query = collectionRef.where('users', arrayContains: usuarioActual);

  final querySnapshot = await query.get();

  for (var doc in querySnapshot.docs) {
    InvitacionesRecord invitacionesRecord =
        await InvitacionesRecord.getDocumentOnce(doc.reference);
    docs.add(invitacionesRecord);
  }
  return docs;
}
