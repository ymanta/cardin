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

Future<int> getUnreadChatsCount(String? currentUserId) async {
  // Add your function code here!
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('chats');
  final querySnapshot =
      await collectionRef.where('users', arrayContains: currentUserId).get();

  // Filtra los documentos donde el usuario no está en 'last_message_seen_by'
  final unreadChatsCount = querySnapshot.docs.where((doc) {
    final data = doc.data() as Map<String, dynamic>;
    final lastMessageSeenBy =
        List<String>.from(data['last_message_seen_by'] ?? []);
    return !lastMessageSeenBy.contains(currentUserId);
  }).length;

  //return unreadChatsCount;
  return querySnapshot.docs.length;
}
