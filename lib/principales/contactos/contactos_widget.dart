import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/components/crear_nota_widget.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'contactos_model.dart';
export 'contactos_model.dart';

class ContactosWidget extends StatefulWidget {
  const ContactosWidget({
    super.key,
    required this.idusuarioactual,
  });

  final String? idusuarioactual;

  @override
  State<ContactosWidget> createState() => _ContactosWidgetState();
}

class _ContactosWidgetState extends State<ContactosWidget> {
  late ContactosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactosModel());

    _model.inputBuscarTextController ??= TextEditingController();
    _model.inputBuscarFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          title: FutureBuilder<int>(
            future: queryMiscontactosRecordCount(
              queryBuilder: (miscontactosRecord) => miscontactosRecord.where(
                'propietario',
                isEqualTo: currentUserReference,
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
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Contactos ',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'PT Sans',
                              color: Colors.white,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      TextSpan(
                        text: '(${valueOrDefault<String>(
                          containerCount.toString(),
                          '0',
                        )})',
                        style: const TextStyle(
                          fontSize: 14.0,
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
              );
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: StreamBuilder<List<MiscontactosRecord>>(
                stream: queryMiscontactosRecord(
                  queryBuilder: (miscontactosRecord) =>
                      miscontactosRecord.where(
                    'propietario',
                    isEqualTo: currentUserReference,
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
                  List<MiscontactosRecord> containerMiscontactosRecordList =
                      snapshot.data!;

                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 10.0),
                            child: TextFormField(
                              controller: _model.inputBuscarTextController,
                              focusNode: _model.inputBuscarFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.inputBuscarTextController',
                                const Duration(milliseconds: 500),
                                () => safeSetState(() {}),
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Buscar...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'PT Sans',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'PT Sans',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFF071B34),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                suffixIcon: _model.inputBuscarTextController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.inputBuscarTextController
                                              ?.clear();
                                          safeSetState(() {});
                                        },
                                        child: const Icon(
                                          Icons.clear,
                                          color: Color(0xFF071B34),
                                          size: 20.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'PT Sans',
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .inputBuscarTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    'Ordenar por:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'PT Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.nameOrder = !_model.nameOrder;
                                      _model.nombreAsc = !_model.nombreAsc;
                                      safeSetState(() {});
                                    },
                                    text: 'A-z / Z-a',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFF071B34),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'PT Sans',
                                            color: FlutterFlowTheme.of(context)
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.fechaOrder = !_model.fechaOrder;
                                    _model.fechaAsc = !_model.fechaAsc;
                                    safeSetState(() {});
                                  },
                                  text: 'FECHA',
                                  options: FFButtonOptions(
                                    height: 30.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF071B34),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'PT Sans',
                                          color: FlutterFlowTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final contacto = functions
                                    .sortNombreFechaMisContactos(
                                        containerMiscontactosRecordList
                                            .toList(),
                                        _model.nameOrder,
                                        _model.fechaOrder,
                                        _model.nombreAsc,
                                        _model.fechaAsc)
                                    .toList();
                                if (contacto.isEmpty) {
                                  return const Center(
                                    child: EmptyStateSimpleWidget(
                                      icon: Icon(
                                        Icons.people_sharp,
                                        color: Color(0xFF071B34),
                                        size: 100.0,
                                      ),
                                      title: 'Contactos',
                                      body: 'Aún no tienes contactos.',
                                    ),
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: contacto.length,
                                  itemBuilder: (context, contactoIndex) {
                                    final contactoItem =
                                        contacto[contactoIndex];
                                    return StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'uid',
                                          isEqualTo: contactoItem.idcontacto,
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFF071B34),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord>
                                            containerUsersRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerUsersRecord =
                                            containerUsersRecordList.isNotEmpty
                                                ? containerUsersRecordList.first
                                                : null;

                                        return Container(
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible: functions
                                                    .mostrarResultadosBusqueda(
                                                        _model
                                                            .inputBuscarTextController
                                                            .text,
                                                        containerUsersRecord
                                                            ?.nombrecompleto) ??
                                                true,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Cardincontacto',
                                                  queryParameters: {
                                                    'idcontacto':
                                                        serializeParam(
                                                      containerUsersRecord.uid,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: 60.0,
                                                        height: 70.0,
                                                        child: Stack(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          children: [
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFF071B34),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFF071B34),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                containerUsersRecord?.photoUrl !=
                                                                            null &&
                                                                        containerUsersRecord?.photoUrl !=
                                                                            ''
                                                                    ? containerUsersRecord!
                                                                        .photoUrl
                                                                    : 'https://firebasestorage.googleapis.com/v0/b/cardin2024-bf084.appspot.com/o/profiledefault.jpg?alt=media&token=81733ccf-6cb4-425e-b4ef-e9eb86cfa3c3',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                containerUsersRecord!
                                                                    .displayName,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'PT Sans',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      lineHeight:
                                                                          1.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                containerUsersRecord
                                                                    .ocupacion,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'PT Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'AgregarContactoLista',
                                                                              queryParameters: {
                                                                                'contactoid': serializeParam(
                                                                                  containerUsersRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/listas_contacto.png',
                                                                              width: 30.0,
                                                                              height: 30.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).unfocus(),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: CrearNotaWidget(
                                                                                      refcontacto: containerUsersRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/crear_notas_contacto.png',
                                                                              width: 30.0,
                                                                              height: 30.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.verificaSiExisteChat =
                                                                                await queryChatsRecordCount(
                                                                              queryBuilder: (chatsRecord) => chatsRecord.where(Filter.or(
                                                                                Filter(
                                                                                  'parejas',
                                                                                  isEqualTo: functions.creaParejasChats(currentUserUid, containerUsersRecord.uid),
                                                                                ),
                                                                                Filter(
                                                                                  'parejas',
                                                                                  isEqualTo: functions.creaParejasChats(containerUsersRecord.uid, currentUserUid),
                                                                                ),
                                                                              )),
                                                                            );
                                                                            if (_model.verificaSiExisteChat !=
                                                                                0) {
                                                                              _model.chatObtenido = await queryChatsRecordOnce(
                                                                                queryBuilder: (chatsRecord) => chatsRecord.where(Filter.or(
                                                                                  Filter(
                                                                                    'parejas',
                                                                                    isEqualTo: functions.creaParejasChats(currentUserUid, containerUsersRecord.uid),
                                                                                  ),
                                                                                  Filter(
                                                                                    'parejas',
                                                                                    isEqualTo: functions.creaParejasChats(containerUsersRecord.uid, currentUserUid),
                                                                                  ),
                                                                                )),
                                                                                singleRecord: true,
                                                                              ).then((s) => s.firstOrNull);
                                                                              if (Navigator.of(context).canPop()) {
                                                                                context.pop();
                                                                              }
                                                                              context.pushNamed(
                                                                                'chat_2_Details',
                                                                                queryParameters: {
                                                                                  'chatRef': serializeParam(
                                                                                    _model.chatObtenido,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'chatRef': _model.chatObtenido,
                                                                                },
                                                                              );
                                                                            } else {
                                                                              // newChat

                                                                              var chatsRecordReference = ChatsRecord.collection.doc();
                                                                              await chatsRecordReference.set({
                                                                                ...createChatsRecordData(
                                                                                  userA: currentUserReference,
                                                                                  userB: containerUsersRecord.reference,
                                                                                  lastMessage: '',
                                                                                  lastMessageTime: getCurrentTimestamp,
                                                                                  lastMessageSentBy: currentUserReference,
                                                                                  groupChatId: random_data.randomInteger(1000000, 9999999),
                                                                                  parejas: functions.creaParejasChats(currentUserUid, containerUsersRecord.uid),
                                                                                ),
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'users': functions.combinarUsuarios(currentUserReference!, containerUsersRecord.reference),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              _model.newChatThread = ChatsRecord.getDocumentFromData({
                                                                                ...createChatsRecordData(
                                                                                  userA: currentUserReference,
                                                                                  userB: containerUsersRecord.reference,
                                                                                  lastMessage: '',
                                                                                  lastMessageTime: getCurrentTimestamp,
                                                                                  lastMessageSentBy: currentUserReference,
                                                                                  groupChatId: random_data.randomInteger(1000000, 9999999),
                                                                                  parejas: functions.creaParejasChats(currentUserUid, containerUsersRecord.uid),
                                                                                ),
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'users': functions.combinarUsuarios(currentUserReference!, containerUsersRecord.reference),
                                                                                  },
                                                                                ),
                                                                              }, chatsRecordReference);
                                                                              if (Navigator.of(context).canPop()) {
                                                                                context.pop();
                                                                              }
                                                                              context.pushNamed(
                                                                                'chat_2_Details',
                                                                                queryParameters: {
                                                                                  'chatRef': serializeParam(
                                                                                    _model.newChatThread,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'chatRef': _model.newChatThread,
                                                                                },
                                                                              );
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/chats_contacto.png',
                                                                              width: 30.0,
                                                                              height: 30.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: Color(
                                                                      0xFF071B34),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
    );
  }
}
