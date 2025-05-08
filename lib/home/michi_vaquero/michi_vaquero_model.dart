import '/components/appbar/appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'michi_vaquero_widget.dart' show MichiVaqueroWidget;
import 'package:flutter/material.dart';

class MichiVaqueroModel extends FlutterFlowModel<MichiVaqueroWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Appbar component.
  late AppbarModel appbarModel;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
  }
}
