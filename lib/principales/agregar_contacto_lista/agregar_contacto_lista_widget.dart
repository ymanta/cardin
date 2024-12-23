import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/finalde_datos_widget.dart';
import '/components/navegador_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/principales/empty_state_listas_contactos/empty_state_listas_contactos_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'agregar_contacto_lista_model.dart';
export 'agregar_contacto_lista_model.dart';

class AgregarContactoListaWidget extends StatefulWidget {
  const AgregarContactoListaWidget({
    super.key,
    required this.contactoid,
  });

  final DocumentReference? contactoid;

  @override
  State<AgregarContactoListaWidget> createState() =>
      _AgregarContactoListaWidgetState();
}

class _AgregarContactoListaWidgetState
    extends State<AgregarContactoListaWidget> {
  late AgregarContactoListaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgregarContactoListaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            context.safePop();
          },
          child: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 30.0,
          ),
        ),
        title: Text(
          'Agregar a lista',
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
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    PagedListView<DocumentSnapshot<Object?>?, ListasRecord>(
                      pagingController: _model.setListViewController(
                        ListasRecord.collection.where(
                          'propietario',
                          isEqualTo: currentUserReference,
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<ListasRecord>(
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
                            EmptyStateListasContactosWidget(
                          title: 'Listas',
                          body:
                              'Aún no has creado listas para ordenar tus contactos.',
                          uiContacto: widget.contactoid!,
                        ),
                        itemBuilder: (context, _, listViewIndex) {
                          final listViewListasRecord = _model
                              .listViewPagingController!
                              .itemList![listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.versiExisteContactoenLista =
                                    await queryContactoslistaRecordOnce(
                                  parent: listViewListasRecord.reference,
                                  queryBuilder: (contactoslistaRecord) =>
                                      contactoslistaRecord.where(
                                    'contactodelista',
                                    isEqualTo: widget.contactoid,
                                  ),
                                );
                                if (_model.versiExisteContactoenLista != null &&
                                    (_model.versiExisteContactoenLista)!
                                        .isNotEmpty) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title:
                                            const Text('Contacto ya esta agregado'),
                                        content: const Text(
                                            'El contacto que desea agregar, ya se encuentra en la lista.'),
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
                                  await ContactoslistaRecord.createDoc(
                                          listViewListasRecord.reference)
                                      .set(createContactoslistaRecordData(
                                    contactodelista: widget.contactoid,
                                  ));
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Contacto agregado'),
                                        content: const Text(
                                            'Se agrego con éxito al contacto.'),
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

                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Agregar a: ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'PT Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                functions.capitalizarPalabras(
                                                    listViewListasRecord
                                                        .nombre),
                                                'No hay listas disponibles',
                                              ),
                                              style: const TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'PT Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.add_circle,
                                        color: Color(0xFF071B34),
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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
    );
  }
}
