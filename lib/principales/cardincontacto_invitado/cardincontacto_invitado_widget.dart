import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'cardincontacto_invitado_model.dart';
export 'cardincontacto_invitado_model.dart';

class CardincontactoInvitadoWidget extends StatefulWidget {
  const CardincontactoInvitadoWidget({
    super.key,
    required this.idcontacto,
  });

  final String? idcontacto;

  @override
  State<CardincontactoInvitadoWidget> createState() =>
      _CardincontactoInvitadoWidgetState();
}

class _CardincontactoInvitadoWidgetState
    extends State<CardincontactoInvitadoWidget> {
  late CardincontactoInvitadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardincontactoInvitadoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.idcontacto,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xFF071B34),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF071B34),
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> cardincontactoInvitadoUsersRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final cardincontactoInvitadoUsersRecord =
            cardincontactoInvitadoUsersRecordList.isNotEmpty
                ? cardincontactoInvitadoUsersRecordList.first
                : null;

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
                  context.safePop();
                },
                child: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 50.0,
                ),
              ),
              title: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cardin ',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'PT Sans',
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'PT Sans',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
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
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF61E9F1), Color(0xFF5A1DA5)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          30.0, 30.0, 30.0, 30.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: const CircleBorder(),
                                    child: Container(
                                      width: 126.0,
                                      height: 126.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 0.0, 0.0),
                                  child: Container(
                                    width: 120.0,
                                    height: 120.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      cardincontactoInvitadoUsersRecord
                                                      ?.photoUrl !=
                                                  null &&
                                              cardincontactoInvitadoUsersRecord
                                                      ?.photoUrl !=
                                                  ''
                                          ? cardincontactoInvitadoUsersRecord!
                                              .photoUrl
                                          : 'https://firebasestorage.googleapis.com/v0/b/cardin2024-bf084.appspot.com/o/profiledefault.jpg?alt=media&token=81733ccf-6cb4-425e-b4ef-e9eb86cfa3c3',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                cardincontactoInvitadoUsersRecord
                                    ?.nombrecompleto,
                                'contacto_nombre',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'PT Sans',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Text(
                              cardincontactoInvitadoUsersRecord!.ocupacion,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'PT Sans',
                                    color: const Color(0xFF071B34),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Text(
                              cardincontactoInvitadoUsersRecord.empresa,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'PT Sans',
                                    color: const Color(0xFF071B34),
                                    letterSpacing: 0.0,
                                    lineHeight: 1.0,
                                  ),
                            ),
                          ),
                          if (cardincontactoInvitadoUsersRecord.contactos
                                  .contains(cardincontactoInvitadoUsersRecord
                                      .reference) ==
                              true)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Text(
                                cardincontactoInvitadoUsersRecord.direccion,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'PT Sans',
                                      color: const Color(0xFF071B34),
                                      letterSpacing: 0.0,
                                      lineHeight: 1.0,
                                    ),
                              ),
                            ),
                          if (cardincontactoInvitadoUsersRecord.pais != '')
                            Text(
                              cardincontactoInvitadoUsersRecord.pais,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'PT Sans',
                                    color: const Color(0xFF071B34),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          if (cardincontactoInvitadoUsersRecord.resumen != '')
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 30.0, 30.0, 10.0),
                                child: Text(
                                  'Resumen profesional',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'PT Sans',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 0.0),
                            child: Text(
                              cardincontactoInvitadoUsersRecord.resumen,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'PT Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ),
                          if ((cardincontactoInvitadoUsersRecord.intereses)
                                  .isNotEmpty)
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 30.0, 30.0, 10.0),
                                child: Text(
                                  'Intereses',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'PT Sans',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          FlutterFlowChoiceChips(
                            options: cardincontactoInvitadoUsersRecord
                                .intereses
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) => safeSetState(() =>
                                _model.choiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'PT Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18.0,
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'PT Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            chipSpacing: 12.0,
                            rowSpacing: 12.0,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                            controller: _model.choiceChipsValueController ??=
                                FormFieldController<List<String>>(
                              [],
                            ),
                            wrapped: true,
                          ),
                          FutureBuilder<int>(
                            future: queryInvitacionesRecordCount(
                              queryBuilder: (invitacionesRecord) =>
                                  invitacionesRecord
                                      .where(
                                        'user_a',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'user_b',
                                        isEqualTo:
                                            cardincontactoInvitadoUsersRecord
                                                .reference,
                                      ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFF071B34),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              int containerCount = snapshot.data!;

                              return Container(
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    if (containerCount.toString() != '0') {
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed('Invitaciones');
                                            },
                                            text: 'INVITACIÓN ENVIADA',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFF071B34),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'PT Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return FutureBuilder<int>(
                                        future: queryInvitacionesRecordCount(
                                          queryBuilder: (invitacionesRecord) =>
                                              invitacionesRecord
                                                  .where(
                                                    'user_a',
                                                    isEqualTo:
                                                        cardincontactoInvitadoUsersRecord
                                                            .reference,
                                                  )
                                                  .where(
                                                    'user_b',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Color(0xFF071B34),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          int containerCount = snapshot.data!;

                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: Builder(
                                              builder: (context) {
                                                if (containerCount.toString() !=
                                                    '0') {
                                                  return Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              'Invitaciones');
                                                        },
                                                        text:
                                                            'INVITACIÓN RECIBIDA',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              const Color(0xFF071B34),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'PT Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.existeInvitacion =
                                                              await queryInvitacionesRecordOnce(
                                                            queryBuilder:
                                                                (invitacionesRecord) =>
                                                                    invitacionesRecord
                                                                        .where(
                                                                          'user_a',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        )
                                                                        .where(
                                                                          'user_b',
                                                                          isEqualTo:
                                                                              cardincontactoInvitadoUsersRecord.reference,
                                                                        ),
                                                          );
                                                          if (_model
                                                                  .existeInvitacion
                                                                  ?.length
                                                                  .toString() ==
                                                              '0') {
                                                            _model.existeInvitacionrecibida =
                                                                await queryInvitacionesRecordOnce(
                                                              queryBuilder:
                                                                  (invitacionesRecord) =>
                                                                      invitacionesRecord
                                                                          .where(
                                                                            'user_a',
                                                                            isEqualTo:
                                                                                cardincontactoInvitadoUsersRecord.reference,
                                                                          )
                                                                          .where(
                                                                            'user_b',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          ),
                                                            );
                                                            if (_model
                                                                    .existeInvitacionrecibida
                                                                    ?.length
                                                                    .toString() ==
                                                                '0') {
                                                              await InvitacionesRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set({
                                                                ...createInvitacionesRecordData(
                                                                  userA:
                                                                      currentUserReference,
                                                                  userB: cardincontactoInvitadoUsersRecord
                                                                      .reference,
                                                                  estatus:
                                                                      false,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': functions.combinarUsuarios(
                                                                        currentUserReference!,
                                                                        cardincontactoInvitadoUsersRecord
                                                                            .reference),
                                                                  },
                                                                ),
                                                              });
                                                              triggerPushNotification(
                                                                notificationTitle:
                                                                    'Solicitud de contacto',
                                                                notificationText:
                                                                    functions.combinarVariableTexto(
                                                                        'te ha enviado una solicitud de contacto. Revisa la sección de invitaciones en tu C@rdin.',
                                                                        currentUserDisplayName)!,
                                                                notificationSound:
                                                                    'default',
                                                                userRefs: [
                                                                  cardincontactoInvitadoUsersRecord
                                                                      .reference
                                                                ],
                                                                initialPageName:
                                                                    'Inicio',
                                                                parameterData: {},
                                                              );
                                                              await EnviarEmailConBrevoCall
                                                                  .call(
                                                                nombre: cardincontactoInvitadoUsersRecord
                                                                    .nombrecompleto,
                                                                email:
                                                                    cardincontactoInvitadoUsersRecord
                                                                        .email,
                                                                nombreRemitente:
                                                                    currentUserDisplayName,
                                                                contenido: functions
                                                                    .combinarVariableTexto(
                                                                        'te ha enviado una solicitud de contacto. Revisa la sección de invitaciones en tu C@rdin.',
                                                                        currentUserDisplayName),
                                                              );

                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'Invitación enviada'),
                                                                    content: const Text(
                                                                        'Invitación enviada con éxito. Por favor, espere a que el usuario acepte su invitación.'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'OK'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'Ya existe una invitación'),
                                                                    content: const Text(
                                                                        'Ya existe una invitación recibida de parte del usuario seleccionado.'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'OK'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Ya existe una invitación'),
                                                                  content: const Text(
                                                                      'Ya existe una invitación enviada al usuario seleccionado.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            'ENVIAR INVITACIÓN',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              const Color(0xFF071B34),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'PT Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                          Container(
                            width: double.infinity,
                            height: 150.0,
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
      },
    );
  }
}
