import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_r_a_m_widget.dart' show CreateRAMWidget;
import 'package:flutter/material.dart';

class CreateRAMModel extends FlutterFlowModel<CreateRAMWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for member_name widget.
  FocusNode? memberNameFocusNode;
  TextEditingController? memberNameTextController;
  String? Function(BuildContext, String?)? memberNameTextControllerValidator;
  // State field(s) for regno widget.
  FocusNode? regnoFocusNode;
  TextEditingController? regnoTextController;
  String? Function(BuildContext, String?)? regnoTextControllerValidator;
  // State field(s) for grandranks widget.
  FocusNode? grandranksFocusNode;
  TextEditingController? grandranksTextController;
  String? Function(BuildContext, String?)? grandranksTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for regionalranks widget.
  FocusNode? regionalranksFocusNode;
  TextEditingController? regionalranksTextController;
  String? Function(BuildContext, String?)? regionalranksTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    memberNameFocusNode?.dispose();
    memberNameTextController?.dispose();

    regnoFocusNode?.dispose();
    regnoTextController?.dispose();

    grandranksFocusNode?.dispose();
    grandranksTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController4?.dispose();

    regionalranksFocusNode?.dispose();
    regionalranksTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();
  }
}
