import '/components/appbar/appbar_widget.dart';
import '/components/listnotificatiion_model/listnotificatiion_model_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'menu_page_model.dart';
export 'menu_page_model.dart';

class MenuPageWidget extends StatefulWidget {
  const MenuPageWidget({super.key});

  static String routeName = 'MenuPage';
  static String routePath = '/menuPage';

  @override
  State<MenuPageWidget> createState() => _MenuPageWidgetState();
}

class _MenuPageWidgetState extends State<MenuPageWidget> {
  late MenuPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appbarModel,
                updateCallback: () => safeSetState(() {}),
                child: AppbarWidget(
                  title: 'Menú',
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    16.0,
                    0,
                    16.0,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    wrapWithModel(
                      model: _model.listnotificatiionModelModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: ListnotificatiionModelWidget(
                        name: 'Date Picker',
                        txt1: '¿Qué michi eres según tu mes?',
                        tx2: 'Opción 1',
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(RadioGroupWidget.routeName);
                      },
                      child: wrapWithModel(
                        model: _model.listnotificatiionModelModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ListnotificatiionModelWidget(
                          name: 'RadioGroup',
                          txt1: 'Escoge tu multiverso de michis.',
                          tx2: 'Opción 2',
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(ListViewWidget.routeName);
                      },
                      child: wrapWithModel(
                        model: _model.listnotificatiionModelModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: ListnotificatiionModelWidget(
                          name: 'ListView',
                          txt1: 'Muro de memes de michis.',
                          tx2: 'Opción 3',
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.listnotificatiionModelModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: ListnotificatiionModelWidget(
                        name: 'Spinner',
                        txt1: 'Escoge tu yo felino hoy',
                        tx2: 'Opción 4',
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
