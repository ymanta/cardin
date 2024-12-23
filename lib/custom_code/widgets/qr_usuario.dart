// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:firebase_storage/firebase_storage.dart';

class QrUsuario extends StatefulWidget {
  const QrUsuario({
    super.key,
    this.width,
    this.height,
    this.idUsuarioQr,
  });

  final double? width;
  final double? height;
  final String? idUsuarioQr;

  @override
  State<QrUsuario> createState() => _QrUsuarioState();
}

class _QrUsuarioState extends State<QrUsuario> {
  final ScreenshotController screenshotController = ScreenshotController();
  bool _isQrGenerated = false;

  @override
  void initState() {
    super.initState();
    if (!_isQrGenerated) {
      _generateAndUploadQR();
    }
  }

  Future<void> _generateAndUploadQR() async {
    await Future.delayed(Duration(milliseconds: 200));
    final Uint8List? uint8List = await screenshotController.capture();
    if (uint8List != null) {
      await _uploadToFirebase(uint8List);
    } else {
      print('Error capturing QR code');
    }
  }

  Future<void> _uploadToFirebase(Uint8List uint8List) async {
    try {
      final storagePath = _getStoragePath(null, 'qr.png', false);
      final storageRef = FirebaseStorage.instance.ref().child(storagePath);
      final metadata = SettableMetadata(contentType: 'image/png');
      final uploadTask = storageRef.putData(uint8List, metadata);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // Save the URL in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: widget.idUsuarioQr)
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          doc.reference.update({
            'qr': downloadUrl,
          });
        }
      });

      print('QR Code uploaded: $downloadUrl');
      setState(() {
        _isQrGenerated = true;
      });
    } catch (e) {
      print('Error uploading QR code to Firebase: $e');
    }
  }

  String _getStoragePath(
    String? pathPrefix,
    String filePath,
    bool isVideo, [
    int? index,
  ]) {
    pathPrefix ??= _firebasePathPrefix();
    pathPrefix = _removeTrailingSlash(pathPrefix);
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final prefix = 'qr-';
    final ext = filePath.split('.').last;
    final indexStr = index != null ? '_$index' : '';
    return '$pathPrefix/$prefix$timestamp$indexStr.$ext';
  }

  String? _removeTrailingSlash(String? path) =>
      path != null && path.endsWith('/')
          ? path.substring(0, path.length - 1)
          : path;

  String _firebasePathPrefix() => 'users/${widget.idUsuarioQr}/uploads';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Screenshot(
          controller: screenshotController,
          child: Container(
            color: Colors.white,
            child: QrImageView(
              data: widget.idUsuarioQr!,
              version: QrVersions.auto,
              size: 250.0,
            ),
          )),
    ]);
  }
}
