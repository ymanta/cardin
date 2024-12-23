import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'card_contactos_model.dart';
export 'card_contactos_model.dart';

class CardContactosWidget extends StatefulWidget {
  const CardContactosWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final String? parameter5;

  @override
  State<CardContactosWidget> createState() => _CardContactosWidgetState();
}

class _CardContactosWidgetState extends State<CardContactosWidget> {
  late CardContactosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardContactosModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 80.0,
              height: 80.0,
              child: Stack(
                alignment: const AlignmentDirectional(0.0, 0.0),
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF071B34),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF071B34),
                          ),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 78.0,
                      height: 78.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        widget.parameter1!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Text(
                        widget.parameter2!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'PT Sans',
                              color: Colors.black,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              lineHeight: 1.0,
                            ),
                      ),
                    ),
                    Text(
                      widget.parameter3!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'PT Sans',
                            color: const Color(0xFF071B34),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      widget.parameter4!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'PT Sans',
                            color: const Color(0xFF071B34),
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.person_add,
                  color: Color(0xFF071B34),
                  size: 30.0,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'Cardincontacto',
                      queryParameters: {
                        'idcontacto': serializeParam(
                          widget.parameter5,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Icon(
                    Icons.remove_red_eye,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
