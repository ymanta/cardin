import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/detalles_descarga_qr_widget.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'compartir_model.dart';
export 'compartir_model.dart';

class CompartirWidget extends StatefulWidget {
  const CompartirWidget({super.key});

  @override
  State<CompartirWidget> createState() => _CompartirWidgetState();
}

class _CompartirWidgetState extends State<CompartirWidget> {
  late CompartirModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompartirModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF071B34),
        appBar: AppBar(
          backgroundColor: const Color(0xFF071B34),
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.goNamed('Inicio');
            },
            child: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30.0,
            ),
          ),
          title: Text(
            'Compartir',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'PT Sans',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Text(
                            'Tu QR es tu conexión con otros usuarios de Cardin. Puedes compartirlo para establecer conexiones fácilmente. ¡Descárgalo para tenerlo siempre contigo!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'PT Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Container(
                            width: 250.0,
                            height: 250.0,
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                if (valueOrDefault(
                                            currentUserDocument?.qr, '') !=
                                        '') {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault(
                                          currentUserDocument?.qr, ''),
                                      width: 250.0,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    width: 250.0,
                                    height: 250.0,
                                    child: custom_widgets.QrUsuario(
                                      width: 250.0,
                                      height: 250.0,
                                      idUsuarioQr: currentUserUid,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await actions.descargarQr(
                                  valueOrDefault(currentUserDocument?.qr, ''),
                                  true,
                                  true,
                                  false,
                                );
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: const DetallesDescargaQrWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              text: 'DESCARGAR QR',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF071B34),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'PT Sans',
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 1.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    50.0, 0.0, 50.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Agrega contactos a tu Cardin escaneando sus códigos QR.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'PT Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.valorQr =
                                await FlutterBarcodeScanner.scanBarcode(
                              '#C62828', // scanning line color
                              'Cancelar', // cancel button text
                              true, // whether to show the flash icon
                              ScanMode.QR,
                            );

                            if (_model.valorQr == '-1') {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('QR incorrecto'),
                                    content: const Text(
                                        'Hubo un problema al escanear el código QR. Intenta nuevamente.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              _model.existeEnMiscontactos =
                                  await queryMiscontactosRecordCount(
                                queryBuilder: (miscontactosRecord) =>
                                    miscontactosRecord
                                        .where(
                                          'propietario',
                                          isEqualTo: currentUserReference,
                                        )
                                        .where(
                                          'idcontacto',
                                          isEqualTo: _model.valorQr,
                                        ),
                              );
                              if (_model.existeEnMiscontactos.toString() ==
                                  '1') {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Ya es contacto'),
                                      content:
                                          const Text('El usuario ya es contacto.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                _model.infoContacto =
                                    await queryUsersRecordOnce(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'uid',
                                    isEqualTo: _model.valorQr,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.infoContacto?.email == null ||
                                    _model.infoContacto?.email == '') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('No se obtuvo QR'),
                                        content: const Text(
                                            'Hubo un problema al escanear el código QR. Intenta nuevamente.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  await MiscontactosRecord.collection
                                      .doc()
                                      .set({
                                    ...createMiscontactosRecordData(
                                      propietario: currentUserReference,
                                      bloqueado: false,
                                      idcontacto: _model.infoContacto?.uid,
                                      nombrecompleto:
                                          _model.infoContacto?.nombrecompleto,
                                      ocupacion: _model.infoContacto?.ocupacion,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'fecha': FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });

                                  await MiscontactosRecord.collection
                                      .doc()
                                      .set({
                                    ...createMiscontactosRecordData(
                                      propietario:
                                          _model.infoContacto?.reference,
                                      bloqueado: false,
                                      idcontacto: currentUserUid,
                                      nombrecompleto: valueOrDefault(
                                          currentUserDocument?.nombrecompleto,
                                          ''),
                                      ocupacion: valueOrDefault(
                                          currentUserDocument?.ocupacion, ''),
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'fecha': FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Contacto agregado'),
                                        content: const Text(
                                            'Se ha agregado el usuario a su lista de contactos.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            }

                            safeSetState(() {});
                          },
                          text: 'ESCANEAR QR',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF071B34),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'PT Sans',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 1.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: const BoxDecoration(),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navegadorModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavegadorWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
