import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_businesinfo_widget.dart' show EditBusinesinfoWidget;
import 'package:flutter/material.dart';

class EditBusinesinfoModel extends FlutterFlowModel<EditBusinesinfoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for business_name widget.
  FocusNode? businessNameFocusNode;
  TextEditingController? businessNameTextController;
  String? Function(BuildContext, String?)? businessNameTextControllerValidator;
  // State field(s) for TextField_category widget.
  FocusNode? textFieldCategoryFocusNode;
  TextEditingController? textFieldCategoryTextController;
  String? Function(BuildContext, String?)?
      textFieldCategoryTextControllerValidator;
  // State field(s) for categoryselected widget.
  String? categoryselectedValue;
  FormFieldController<String>? categoryselectedValueController;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for address2 widget.
  FocusNode? address2FocusNode;
  TextEditingController? address2TextController;
  String? Function(BuildContext, String?)? address2TextControllerValidator;
  // State field(s) for operation_city widget.
  FocusNode? operationCityFocusNode;
  TextEditingController? operationCityTextController;
  String? Function(BuildContext, String?)? operationCityTextControllerValidator;
  // State field(s) for operation_city widget.
  String? operationCityValue;
  FormFieldController<String>? operationCityValueController;
  // State field(s) for selected_state widget.
  FocusNode? selectedStateFocusNode;
  TextEditingController? selectedStateTextController;
  String? Function(BuildContext, String?)? selectedStateTextControllerValidator;
  // State field(s) for state_DropDown widget.
  String? stateDropDownValue;
  FormFieldController<String>? stateDropDownValueController;
  // State field(s) for pincode widget.
  FocusNode? pincodeFocusNode;
  TextEditingController? pincodeTextController;
  String? Function(BuildContext, String?)? pincodeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    businessNameFocusNode?.dispose();
    businessNameTextController?.dispose();

    textFieldCategoryFocusNode?.dispose();
    textFieldCategoryTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    address2FocusNode?.dispose();
    address2TextController?.dispose();

    operationCityFocusNode?.dispose();
    operationCityTextController?.dispose();

    selectedStateFocusNode?.dispose();
    selectedStateTextController?.dispose();

    pincodeFocusNode?.dispose();
    pincodeTextController?.dispose();
  }
}
