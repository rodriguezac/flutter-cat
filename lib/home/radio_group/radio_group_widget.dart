import '/components/appbar/appbar_widget.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'radio_group_model.dart';
export 'radio_group_model.dart';

class RadioGroupWidget extends StatefulWidget {
  const RadioGroupWidget({super.key});

  static String routeName = 'RadioGroup';
  static String routePath = '/RadioGroup';

  @override
  State<RadioGroupWidget> createState() => _RadioGroupWidgetState();
}

class _RadioGroupWidgetState extends State<RadioGroupWidget> {
  late RadioGroupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioGroupModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              wrapWithModel(
                model: _model.appbarModel,
                updateCallback: () => safeSetState(() {}),
                child: AppbarWidget(title: 'Radio Button'),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Text(
                      'Escoge tu multiverso de michis',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'SF UI Text',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 16),
                    FlutterFlowRadioButton(
                      options: ['rockero', 'vaquero', 'pan'],
                      onChanged: (val) => setState(() {}),
                      controller: _model.radioGroupValueController ??=
                          FormFieldController<String>(null),
                      optionHeight: 48.0,
                      textStyle: FlutterFlowTheme.of(context).labelMedium,
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).titleLarge,
                      buttonPosition: RadioButtonPosition.right,
                      direction: Axis.vertical,
                      radioButtonColor: FlutterFlowTheme.of(context).primary,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final selected = _model.selectedMichi;

                    if (selected == 'rockero') {
                      context.pushNamed(MichiRockeroWidget.routeName);
                    } else if (selected == 'vaquero') {
                      context.pushNamed(MichiVaqueroWidget.routeName);
                    } else if (selected == 'pan') {
                      context.pushNamed(MichiPanWidget.routeName);
                    } else {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Advertencia'),
                          content:
                              const Text('Por favor, escoja una de las opciones.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  text: 'Confirmar',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context)
                        .titleLarge
                        .override(
                          fontFamily: 'SF UI Text',
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
