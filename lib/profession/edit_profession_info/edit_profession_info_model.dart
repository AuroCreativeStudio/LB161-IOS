import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_profession_info_widget.dart' show EditProfessionInfoWidget;
import 'package:flutter/material.dart';

class EditProfessionInfoModel
    extends FlutterFlowModel<EditProfessionInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_cityoperations widget.
  FocusNode? textFieldCityoperationsFocusNode;
  TextEditingController? textFieldCityoperationsTextController;
  String? Function(BuildContext, String?)?
      textFieldCityoperationsTextControllerValidator;
  // State field(s) for DropDown_city_operations widget.
  String? dropDownCityOperationsValue;
  FormFieldController<String>? dropDownCityOperationsValueController;
  // State field(s) for TextField_category widget.
  FocusNode? textFieldCategoryFocusNode;
  TextEditingController? textFieldCategoryTextController;
  String? Function(BuildContext, String?)?
      textFieldCategoryTextControllerValidator;
  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for profession_name widget.
  FocusNode? professionNameFocusNode;
  TextEditingController? professionNameTextController;
  String? Function(BuildContext, String?)?
      professionNameTextControllerValidator;
  // State field(s) for profession_address widget.
  FocusNode? professionAddressFocusNode;
  TextEditingController? professionAddressTextController;
  String? Function(BuildContext, String?)?
      professionAddressTextControllerValidator;
  // State field(s) for TextField_state widget.
  FocusNode? textFieldStateFocusNode;
  TextEditingController? textFieldStateTextController;
  String? Function(BuildContext, String?)?
      textFieldStateTextControllerValidator;
  // State field(s) for state_DropDown widget.
  String? stateDropDownValue;
  FormFieldController<String>? stateDropDownValueController;
  // State field(s) for profession_pin_code widget.
  FocusNode? professionPinCodeFocusNode;
  TextEditingController? professionPinCodeTextController;
  String? Function(BuildContext, String?)?
      professionPinCodeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldCityoperationsFocusNode?.dispose();
    textFieldCityoperationsTextController?.dispose();

    textFieldCategoryFocusNode?.dispose();
    textFieldCategoryTextController?.dispose();

    professionNameFocusNode?.dispose();
    professionNameTextController?.dispose();

    professionAddressFocusNode?.dispose();
    professionAddressTextController?.dispose();

    textFieldStateFocusNode?.dispose();
    textFieldStateTextController?.dispose();

    professionPinCodeFocusNode?.dispose();
    professionPinCodeTextController?.dispose();
  }
}
