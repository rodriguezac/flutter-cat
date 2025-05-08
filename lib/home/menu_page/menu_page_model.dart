import '/components/appbar/appbar_widget.dart';
import '/components/listnotificatiion_model/listnotificatiion_model_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'menu_page_widget.dart' show MenuPageWidget;
import 'package:flutter/material.dart';

class MenuPageModel extends FlutterFlowModel<MenuPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Model for ListnotificatiionModel component.
  late ListnotificatiionModelModel listnotificatiionModelModel1;
  // Model for ListnotificatiionModel component.
  late ListnotificatiionModelModel listnotificatiionModelModel2;
  // Model for ListnotificatiionModel component.
  late ListnotificatiionModelModel listnotificatiionModelModel3;
  // Model for ListnotificatiionModel component.
  late ListnotificatiionModelModel listnotificatiionModelModel4;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    listnotificatiionModelModel1 =
        createModel(context, () => ListnotificatiionModelModel());
    listnotificatiionModelModel2 =
        createModel(context, () => ListnotificatiionModelModel());
    listnotificatiionModelModel3 =
        createModel(context, () => ListnotificatiionModelModel());
    listnotificatiionModelModel4 =
        createModel(context, () => ListnotificatiionModelModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    listnotificatiionModelModel1.dispose();
    listnotificatiionModelModel2.dispose();
    listnotificatiionModelModel3.dispose();
    listnotificatiionModelModel4.dispose();
  }
}
