import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'chapterlist_widget.dart' show ChapterlistWidget;
import 'package:flutter/material.dart';

class ChapterlistModel extends FlutterFlowModel<ChapterlistWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown1 widget.
  String? dropDown1Value;
  FormFieldController<String>? dropDown1ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
