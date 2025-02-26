import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_bloodgroup_widget.dart' show HomeBloodgroupWidget;
import 'package:flutter/material.dart';

class HomeBloodgroupModel extends FlutterFlowModel<HomeBloodgroupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown_bloodgroup widget.
  String? dropDownBloodgroupValue;
  FormFieldController<String>? dropDownBloodgroupValueController;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
