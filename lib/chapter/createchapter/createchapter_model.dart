import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'createchapter_widget.dart' show CreatechapterWidget;
import 'package:flutter/material.dart';

class CreatechapterModel extends FlutterFlowModel<CreatechapterWidget> {
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
  // State field(s) for grand_rank widget.
  FocusNode? grandRankFocusNode;
  TextEditingController? grandRankTextController;
  String? Function(BuildContext, String?)? grandRankTextControllerValidator;
  // State field(s) for year1 widget.
  FocusNode? year1FocusNode;
  TextEditingController? year1TextController;
  String? Function(BuildContext, String?)? year1TextControllerValidator;
  // State field(s) for regional_rank widget.
  FocusNode? regionalRankFocusNode;
  TextEditingController? regionalRankTextController;
  String? Function(BuildContext, String?)? regionalRankTextControllerValidator;
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

    grandRankFocusNode?.dispose();
    grandRankTextController?.dispose();

    year1FocusNode?.dispose();
    year1TextController?.dispose();

    regionalRankFocusNode?.dispose();
    regionalRankTextController?.dispose();

    year2FocusNode?.dispose();
    year2TextController?.dispose();
  }
}
