import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profession_info_widget.dart' show ProfessionInfoWidget;
import 'package:flutter/material.dart';

class ProfessionInfoModel extends FlutterFlowModel<ProfessionInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for profession_name widget.
  FocusNode? professionNameFocusNode;
  TextEditingController? professionNameTextController;
  String? Function(BuildContext, String?)?
      professionNameTextControllerValidator;
  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for DropDown_city_operations widget.
  String? dropDownCityOperationsValue;
  FormFieldController<String>? dropDownCityOperationsValueController;
  // State field(s) for profession_address widget.
  FocusNode? professionAddressFocusNode;
  TextEditingController? professionAddressTextController;
  String? Function(BuildContext, String?)?
      professionAddressTextControllerValidator;
  // State field(s) for address2 widget.
  FocusNode? address2FocusNode;
  TextEditingController? address2TextController;
  String? Function(BuildContext, String?)? address2TextControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for profession_pin_code widget.
  FocusNode? professionPinCodeFocusNode;
  TextEditingController? professionPinCodeTextController;
  String? Function(BuildContext, String?)?
      professionPinCodeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    professionNameFocusNode?.dispose();
    professionNameTextController?.dispose();

    professionAddressFocusNode?.dispose();
    professionAddressTextController?.dispose();

    address2FocusNode?.dispose();
    address2TextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    professionPinCodeFocusNode?.dispose();
    professionPinCodeTextController?.dispose();
  }
}
