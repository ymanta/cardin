import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/busqueda_vacia_widget.dart';
import '/components/finalde_datos_widget.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'buscar_model.dart';
export 'buscar_model.dart';

class BuscarWidget extends StatefulWidget {
  const BuscarWidget({
    super.key,
    required this.idusuarioactual,
  });

  final String? idusuarioactual;

  @override
  State<BuscarWidget> createState() => _BuscarWidgetState();
}

class _BuscarWidgetState extends State<BuscarWidget> {
  late BuscarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscarModel());

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
          title: Text(
            'Buscar otros usuarios',
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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: Container(
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 20.0),
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
                            labelText: 'Buscar por nombre o evento...',
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
                            suffixIcon: _model
                                    .inputBuscarTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.inputBuscarTextController?.clear();
                                      safeSetState(() {});
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      size: 24.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'PT Sans',
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.inputBuscarTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Expanded(
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            UsersRecord>(
                          pagingController: _model.setListViewController(
                            UsersRecord.collection.where(
                              'uid',
                              isNotEqualTo: widget.idusuarioactual,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<UsersRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => const SizedBox(
                              height: 40.0,
                              child: FinaldeDatosWidget(),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => const SizedBox(
                              height: 40.0,
                              child: FinaldeDatosWidget(),
                            ),
                            noItemsFoundIndicatorBuilder: (_) =>
                                const BusquedaVaciaWidget(),
                            itemBuilder: (context, _, listViewIndex) {
                              final listViewUsersRecord = _model
                                  .listViewPagingController!
                                  .itemList![listViewIndex];
                              return StreamBuilder<List<MiscontactosRecord>>(
                                stream: queryMiscontactosRecord(
                                  queryBuilder: (miscontactosRecord) =>
                                      miscontactosRecord
                                          .where(
                                            'propietario',
                                            isEqualTo: currentUserReference,
                                          )
                                          .where(
                                            'idcontacto',
                                            isEqualTo: listViewUsersRecord.uid,
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
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFF071B34),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<MiscontactosRecord>
                                      containerMiscontactosRecordList =
                                      snapshot.data!;
                                  final containerMiscontactosRecord =
                                      containerMiscontactosRecordList.isNotEmpty
                                          ? containerMiscontactosRecordList
                                              .first
                                          : null;

                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        if (containerMiscontactosRecord
                                                ?.idcontacto ==
                                            listViewUsersRecord.uid) {
                                          return Visibility(
                                            visible: valueOrDefault<bool>(
                                              functions.mostrarResultadosBusquedaNombreEvento(
                                                  _model
                                                      .inputBuscarTextController
                                                      .text,
                                                  _model
                                                      .inputBuscarTextController
                                                      .text,
                                                  listViewUsersRecord
                                                      .nombrecompleto,
                                                  listViewUsersRecord.evento),
                                              false,
                                            ),
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
                                                      listViewUsersRecord.uid,
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
                                                      .fromSTEB(
                                                          10.0, 5.0, 10.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewUsersRecord
                                                                .photoUrl,
                                                            'https://firebasestorage.googleapis.com/v0/b/cardin2024-bf084.appspot.com/o/profiledefault.jpg?alt=media&token=81733ccf-6cb4-425e-b4ef-e9eb86cfa3c3',
                                                          ),
                                                          fit: BoxFit.cover,
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
                                                                listViewUsersRecord
                                                                    .nombrecompleto,
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
                                                                          16.0,
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
                                                                listViewUsersRecord
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
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.0,
                                                                    ),
                                                              ),
                                                              if (listViewUsersRecord
                                                                          .evento !=
                                                                      '')
                                                                Text(
                                                                  'Esta participando en: ${listViewUsersRecord.evento}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'PT Sans',
                                                                        fontSize:
                                                                            12.0,
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
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'Cardincontacto',
                                                                              queryParameters: {
                                                                                'idcontacto': serializeParam(
                                                                                  listViewUsersRecord.uid,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          text:
                                                                              'EN TUS CONTACTOS',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                25.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                const Color(0xFFE0E0E0),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'PT Sans',
                                                                                  color: const Color(0xFF071B34),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                            elevation:
                                                                                1.0,
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            hoverColor:
                                                                                const Color(0xFF071B34),
                                                                            hoverTextColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                                      const Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            Color(0xFF071B34),
                                                        size: 28.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Visibility(
                                            visible: functions
                                                    .mostrarResultadosBusquedaNombreEvento(
                                                        _model
                                                            .inputBuscarTextController
                                                            .text,
                                                        _model
                                                            .inputBuscarTextController
                                                            .text,
                                                        listViewUsersRecord
                                                            .nombrecompleto,
                                                        listViewUsersRecord
                                                            .evento) ??
                                                true,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'CardincontactoInvitado',
                                                  queryParameters: {
                                                    'idcontacto':
                                                        serializeParam(
                                                      listViewUsersRecord.uid,
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
                                                      .fromSTEB(
                                                          10.0, 5.0, 10.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewUsersRecord
                                                                .photoUrl,
                                                            'https://firebasestorage.googleapis.com/v0/b/cardin2024-bf084.appspot.com/o/profiledefault.jpg?alt=media&token=81733ccf-6cb4-425e-b4ef-e9eb86cfa3c3',
                                                          ),
                                                          fit: BoxFit.cover,
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
                                                                listViewUsersRecord
                                                                    .nombrecompleto,
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
                                                                          16.0,
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
                                                                listViewUsersRecord
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
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.0,
                                                                    ),
                                                              ),
                                                              if (listViewUsersRecord
                                                                          .evento !=
                                                                      '')
                                                                Text(
                                                                  'Esta participando en: ${listViewUsersRecord.evento}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'PT Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            12.0,
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
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'CardincontactoInvitado',
                                                                              queryParameters: {
                                                                                'idcontacto': serializeParam(
                                                                                  listViewUsersRecord.uid,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          text:
                                                                              'INFO',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                25.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                const Color(0xFFE0E0E0),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'PT Sans',
                                                                                  color: const Color(0xFF071B34),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                            elevation:
                                                                                1.0,
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            hoverColor:
                                                                                const Color(0xFF071B34),
                                                                            hoverTextColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: FutureBuilder<
                                                                          int>(
                                                                        future:
                                                                            queryInvitacionesRecordCount(
                                                                          queryBuilder: (invitacionesRecord) => invitacionesRecord
                                                                              .where(
                                                                                'user_a',
                                                                                isEqualTo: currentUserReference,
                                                                              )
                                                                              .where(
                                                                                'user_b',
                                                                                isEqualTo: listViewUsersRecord.reference,
                                                                              ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          int containerCount =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if (containerCount.toString() != '0') {
                                                                                  return Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed('Invitaciones');
                                                                                      },
                                                                                      text: 'INVITACIÓN ENVIADA',
                                                                                      options: FFButtonOptions(
                                                                                        height: 25.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: const Color(0xFFE0E0E0),
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'PT Sans',
                                                                                              color: const Color(0xFF071B34),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 0.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                        hoverColor: const Color(0xFF071B34),
                                                                                        hoverTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return FutureBuilder<int>(
                                                                                    future: queryInvitacionesRecordCount(
                                                                                      queryBuilder: (invitacionesRecord) => invitacionesRecord
                                                                                          .where(
                                                                                            'user_a',
                                                                                            isEqualTo: listViewUsersRecord.reference,
                                                                                          )
                                                                                          .where(
                                                                                            'user_b',
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
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            if (containerCount.toString() != '0') {
                                                                                              return Align(
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    context.pushNamed('Invitaciones');
                                                                                                  },
                                                                                                  text: 'INVITACIÓN RECIBIDA',
                                                                                                  options: FFButtonOptions(
                                                                                                    height: 25.0,
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: const Color(0xFFE0E0E0),
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'PT Sans',
                                                                                                          color: const Color(0xFF071B34),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                    elevation: 1.0,
                                                                                                    borderSide: const BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 0.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                    hoverColor: const Color(0xFF071B34),
                                                                                                    hoverTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              return Align(
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    _model.existeInvitacion = await queryInvitacionesRecordOnce(
                                                                                                      queryBuilder: (invitacionesRecord) => invitacionesRecord
                                                                                                          .where(
                                                                                                            'user_a',
                                                                                                            isEqualTo: currentUserReference,
                                                                                                          )
                                                                                                          .where(
                                                                                                            'user_b',
                                                                                                            isEqualTo: listViewUsersRecord.reference,
                                                                                                          ),
                                                                                                    );
                                                                                                    if (_model.existeInvitacion?.length.toString() == '0') {
                                                                                                      _model.existeInvitacionrecibida = await queryInvitacionesRecordOnce(
                                                                                                        queryBuilder: (invitacionesRecord) => invitacionesRecord
                                                                                                            .where(
                                                                                                              'user_a',
                                                                                                              isEqualTo: listViewUsersRecord.reference,
                                                                                                            )
                                                                                                            .where(
                                                                                                              'user_b',
                                                                                                              isEqualTo: currentUserReference,
                                                                                                            ),
                                                                                                      );
                                                                                                      if (_model.existeInvitacionrecibida?.length.toString() == '0') {
                                                                                                        await InvitacionesRecord.collection.doc().set({
                                                                                                          ...createInvitacionesRecordData(
                                                                                                            userA: currentUserReference,
                                                                                                            userB: listViewUsersRecord.reference,
                                                                                                            estatus: false,
                                                                                                          ),
                                                                                                          ...mapToFirestore(
                                                                                                            {
                                                                                                              'users': functions.combinarUsuarios(currentUserReference!, listViewUsersRecord.reference),
                                                                                                            },
                                                                                                          ),
                                                                                                        });
                                                                                                        triggerPushNotification(
                                                                                                          notificationTitle: 'Solicitud de contacto',
                                                                                                          notificationText: functions.combinarVariableTexto('te ha enviado una solicitud de contacto. Revisa la sección de invitaciones en tu C@rdin.', currentUserDisplayName)!,
                                                                                                          notificationSound: 'default',
                                                                                                          userRefs: [
                                                                                                            listViewUsersRecord.reference
                                                                                                          ],
                                                                                                          initialPageName: 'Inicio',
                                                                                                          parameterData: {},
                                                                                                        );
                                                                                                        await EnviarEmailConBrevoCall.call(
                                                                                                          nombre: listViewUsersRecord.nombrecompleto,
                                                                                                          email: listViewUsersRecord.email,
                                                                                                          nombreRemitente: currentUserDisplayName,
                                                                                                          contenido: functions.combinarVariableTexto('te ha enviado una solicitud de contacto. Revisa la sección de invitaciones en tu C@rdin.', currentUserDisplayName),
                                                                                                        );

                                                                                                        await showDialog(
                                                                                                          context: context,
                                                                                                          builder: (alertDialogContext) {
                                                                                                            return AlertDialog(
                                                                                                              title: const Text('Invitación enviada'),
                                                                                                              content: const Text('Invitación enviada con éxito. Por favor, espere a que el usuario acepte su invitación.'),
                                                                                                              actions: [
                                                                                                                TextButton(
                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                  child: const Text('OK'),
                                                                                                                ),
                                                                                                              ],
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      } else {
                                                                                                        await showDialog(
                                                                                                          context: context,
                                                                                                          builder: (alertDialogContext) {
                                                                                                            return AlertDialog(
                                                                                                              title: const Text('Ya existe una invitación'),
                                                                                                              content: const Text('Ya existe una invitación recibida de parte del usuario seleccionado.'),
                                                                                                              actions: [
                                                                                                                TextButton(
                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                  child: const Text('OK'),
                                                                                                                ),
                                                                                                              ],
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      }
                                                                                                    } else {
                                                                                                      await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return AlertDialog(
                                                                                                            title: const Text('Ya existe una invitación'),
                                                                                                            content: const Text('Ya existe una invitación enviada al usuario seleccionado.'),
                                                                                                            actions: [
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                child: const Text('OK'),
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    }

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  text: 'ENVIAR INVITACIÓN',
                                                                                                  options: FFButtonOptions(
                                                                                                    height: 25.0,
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: const Color(0xFFE0E0E0),
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'PT Sans',
                                                                                                          color: const Color(0xFF071B34),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                    elevation: 1.0,
                                                                                                    borderSide: const BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 0.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                    hoverColor: const Color(0xFF071B34),
                                                                                                    hoverTextColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            Color(0xFF071B34),
                                                        size: 28.0,
                                                      ),
                                                    ],
                                                  ),
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
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
