import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'main_business_widget.dart' show MainBusinessWidget;
import 'package:flutter/material.dart';

class MainBusinessModel extends FlutterFlowModel<MainBusinessWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for city_operations widget.
  String? cityOperationsValue;
  FormFieldController<String>? cityOperationsValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
