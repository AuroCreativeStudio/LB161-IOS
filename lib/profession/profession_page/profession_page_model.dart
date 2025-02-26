import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profession_page_widget.dart' show ProfessionPageWidget;
import 'package:flutter/material.dart';

class ProfessionPageModel extends FlutterFlowModel<ProfessionPageWidget> {
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
