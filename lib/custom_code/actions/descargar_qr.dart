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

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

Future descargarQr(
  String? imageURL,
  bool? platformIsiOS,
  bool? platformIsAndroid,
  bool? platformIsWeb,
) async {
  // Add your function code here!
  if (imageURL == null) return "url vacia";
  if (platformIsWeb == true) {
    //code for web
    final WebImageDownloader _webImageDownloader = WebImageDownloader();
    await _webImageDownloader.downloadImageFromWeb(imageURL!);
  }
  if (platformIsAndroid == true || platformIsiOS == true) {
    if (!FlutterDownloader.initialized)
      await FlutterDownloader.initialize(
          debug:
              true, // optional: set to false to disable printing logs to console (default: true)
          ignoreSsl:
              true // option: set to false to disable working with http links (default: false)
          );
    final directory = await getApplicationDocumentsDirectory();
    final imageName =
        'scanned_document_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedImagePath = '${directory.path}/$imageName';
    final taskId = await FlutterDownloader.enqueue(
      url: imageURL!,
      savedDir: directory.path,
      saveInPublicStorage: true,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          false, // click on notification to open downloaded file (for Android)
    );
    //code for Android and iOS
    try {} on PlatformException catch (error) {
      print(error);
    }
  }

  return "Descarga exitosa";
}
