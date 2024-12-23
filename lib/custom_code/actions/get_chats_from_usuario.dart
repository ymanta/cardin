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

Future<List<ChatsRecord>?> getChatsFromUsuario(
  String? collectionName,
  DocumentReference? userA,
  DocumentReference? userB,
  int? limit,
) async {
  // Add your function code here!
  collectionName ??= 'chats';
  limit ??= -1;

  List<ChatsRecord> docs = [];

  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection(collectionName);

  // Construir la consulta para verificar que 'usuarios' contenga a ambos usuarios
  Query query = collectionRef
      .where('users', arrayContains: userA)
      .where('users', arrayContains: userB);

  // Aplicar el límite si se especifica
  if (limit > 0) {
    query = query.limit(limit);
  }

  // Obtener los documentos que coincidan con la consulta
  final querySnapshot = await query.get();

  // Iterar sobre los documentos y crear instancias de ChatsRecord
  for (var doc in querySnapshot.docs) {
    ChatsRecord chatsRecord = await ChatsRecord.getDocumentOnce(doc.reference);
    docs.add(chatsRecord);
  }

  return docs;
}
