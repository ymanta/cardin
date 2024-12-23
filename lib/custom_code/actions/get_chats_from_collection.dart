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

Future<List<ChatsRecord>> getChatsFromCollection(
  String? collectionName,
  int? limit,
  int? groupChatId,
) async {
  // Add your function code here!
  collectionName ??= 'chats';
  limit ??= -1;
  groupChatId ??= 150110355;

  List<ChatsRecord> docs = [];

  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection(collectionName);

  Query query = collectionRef;

  // Agregar la condición para 'group_chat_id' si se especifica
  query = query.where('group_chat_id', isEqualTo: groupChatId);

  // Apply the limit if specified
  if (limit > 0) {
    query = query.limit(limit);
  }

  final querySnapshot = await query.get();

  // Iterate through the documents and create CarsRecord instances
  for (var doc in querySnapshot.docs) {
    // TODO 2 x with capipital letter and 1 x lower letter
    ChatsRecord chatsRecord = await ChatsRecord.getDocumentOnce(doc.reference);
    // TODO 1 x lower letter
    docs.add(chatsRecord);
  }

  return docs;
}
