import '/flutter_flow/flutter_flow_util.dart';
import 'change_photo_profile_widget.dart' show ChangePhotoProfileWidget;
import 'package:flutter/material.dart';

class ChangePhotoProfileModel
    extends FlutterFlowModel<ChangePhotoProfileWidget> {
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
