import '/components/appbar/appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'radio_group_widget.dart' show RadioGroupWidget;
import 'package:flutter/material.dart';

class RadioGroupModel extends FlutterFlowModel<RadioGroupWidget> {
  late AppbarModel appbarModel;

  FormFieldController<String>? radioGroupValueController;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
  }

  String? get selectedMichi => radioGroupValueController?.value;
}


