import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for title widget.
  String? titleValue;
  FormFieldController<String>? titleValueController;
  // State field(s) for member_name widget.
  FocusNode? memberNameFocusNode;
  TextEditingController? memberNameTextController;
  String? Function(BuildContext, String?)? memberNameTextControllerValidator;
  String? _memberNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1yjtw2pu' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vmglqvg7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RegNo widget.
  FocusNode? regNoFocusNode;
  TextEditingController? regNoTextController;
  String? Function(BuildContext, String?)? regNoTextControllerValidator;
  // State field(s) for rgsli_id widget.
  FocusNode? rgsliIdFocusNode;
  TextEditingController? rgsliIdTextController;
  String? Function(BuildContext, String?)? rgsliIdTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i7pj50id' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for master_year widget.
  FocusNode? masterYearFocusNode;
  TextEditingController? masterYearTextController;
  String? Function(BuildContext, String?)? masterYearTextControllerValidator;
  // State field(s) for rg_rank widget.
  FocusNode? rgRankFocusNode;
  TextEditingController? rgRankTextController;
  String? Function(BuildContext, String?)? rgRankTextControllerValidator;
  // State field(s) for g_rank widget.
  FocusNode? gRankFocusNode;
  TextEditingController? gRankTextController;
  String? Function(BuildContext, String?)? gRankTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for blood_group widget.
  String? bloodGroupValue;
  FormFieldController<String>? bloodGroupValueController;
  // State field(s) for name_of_spouse widget.
  FocusNode? nameOfSpouseFocusNode;
  TextEditingController? nameOfSpouseTextController;
  String? Function(BuildContext, String?)? nameOfSpouseTextControllerValidator;
  DateTime? datePicked5;
  DateTime? datePicked6;
  // State field(s) for blood_group_spouse widget.
  String? bloodGroupSpouseValue;
  FormFieldController<String>? bloodGroupSpouseValueController;
  // State field(s) for children widget.
  FocusNode? childrenFocusNode;
  TextEditingController? childrenTextController;
  String? Function(BuildContext, String?)? childrenTextControllerValidator;
  // State field(s) for children2 widget.
  FocusNode? children2FocusNode;
  TextEditingController? children2TextController;
  String? Function(BuildContext, String?)? children2TextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;

  @override
  void initState(BuildContext context) {
    memberNameTextControllerValidator = _memberNameTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    memberNameFocusNode?.dispose();
    memberNameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    regNoFocusNode?.dispose();
    regNoTextController?.dispose();

    rgsliIdFocusNode?.dispose();
    rgsliIdTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    masterYearFocusNode?.dispose();
    masterYearTextController?.dispose();

    rgRankFocusNode?.dispose();
    rgRankTextController?.dispose();

    gRankFocusNode?.dispose();
    gRankTextController?.dispose();

    nameOfSpouseFocusNode?.dispose();
    nameOfSpouseTextController?.dispose();

    childrenFocusNode?.dispose();
    childrenTextController?.dispose();

    children2FocusNode?.dispose();
    children2TextController?.dispose();

    textFieldFocusNode?.dispose();
    textController13?.dispose();
  }
}
