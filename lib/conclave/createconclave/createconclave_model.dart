import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'createconclave_widget.dart' show CreateconclaveWidget;
import 'package:flutter/material.dart';

class CreateconclaveModel extends FlutterFlowModel<CreateconclaveWidget> {
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
  // State field(s) for year1 widget.
  FocusNode? year1FocusNode;
  TextEditingController? year1TextController;
  String? Function(BuildContext, String?)? year1TextControllerValidator;
  // State field(s) for regionalranks widget.
  FocusNode? regionalranksFocusNode;
  TextEditingController? regionalranksTextController;
  String? Function(BuildContext, String?)? regionalranksTextControllerValidator;
  // State field(s) for year2 widget.
  FocusNode? year2FocusNode;
  TextEditingController? year2TextController;
  String? Function(BuildContext, String?)? year2TextControllerValidator;

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

    year1FocusNode?.dispose();
    year1TextController?.dispose();

    regionalranksFocusNode?.dispose();
    regionalranksTextController?.dispose();

    year2FocusNode?.dispose();
    year2TextController?.dispose();
  }
}
