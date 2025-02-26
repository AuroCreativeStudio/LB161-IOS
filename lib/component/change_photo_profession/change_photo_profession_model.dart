import '/flutter_flow/flutter_flow_util.dart';
import 'change_photo_profession_widget.dart' show ChangePhotoProfessionWidget;
import 'package:flutter/material.dart';

class ChangePhotoProfessionModel
    extends FlutterFlowModel<ChangePhotoProfessionWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
