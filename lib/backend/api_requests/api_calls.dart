import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EnviarEmailConBrevoCall {
  static Future<ApiCallResponse> call({
    String? nombre = '',
    String? email = '',
    String? contenido = '',
    String? nombreRemitente = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sender": {
    "name": "Cardin",
    "email": "datospersonales@cardinteligente.com"
  },
  "to": [
    {
      "email": "$email",
      "name": "$nombre"
    }
  ],
  "htmlContent": "<!DOCTYPE html><html><body><h1>Invitación</h1><p>$contenido</p></body></html>",
  "textContent": "$contenido",
  "subject": "$nombreRemitente te ha enviado una invitación en Cardin.",
  "replyTo": {
    "email": "datospersonales@cardinteligente.com",
    "name": "Cardin"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarEmailConBrevo',
      apiUrl: 'https://api.brevo.com/v3/smtp/email',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'api-key':
            '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',
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
