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

Future<int> chatsPendientes(DocumentReference? usuarioActual) async {
  // Add your function code here!
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('chats');

  final querySnapshot =
      await collectionRef.where('users', arrayContains: usuarioActual).get();

  // Filtra los documentos donde el usuario no está en 'last_message_seen_by'
  final filteredDocs = querySnapshot.docs.where((doc) {
    final data = doc.data() as Map<String, dynamic>;
    final lastMessageSeenBy =
        List<DocumentReference>.from(data['last_message_seen_by'] ?? []);
    return !lastMessageSeenBy.contains(usuarioActual);
  }).toList();

  //return querySnapshot.docs.length;
  return filteredDocs.length;
}
