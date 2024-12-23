import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'image_component_bottom_sheet_model.dart';
export 'image_component_bottom_sheet_model.dart';

class ImageComponentBottomSheetWidget extends StatefulWidget {
  const ImageComponentBottomSheetWidget({
    super.key,
    required this.uploadedImage,
  });

  final FFUploadedFile? uploadedImage;

  @override
  State<ImageComponentBottomSheetWidget> createState() =>
      _ImageComponentBottomSheetWidgetState();
}

class _ImageComponentBottomSheetWidgetState
    extends State<ImageComponentBottomSheetWidget> {
  late ImageComponentBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageComponentBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF071B34),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: SizedBox(
          width: 400.0,
          height: 400.0,
          child: custom_widgets.ImageCropper(
            width: 400.0,
            height: 400.0,
            currentUserId: currentUserUid,
            imageFile: widget.uploadedImage,
            callBackAction: (url) async {
              Navigator.pop(context, url);
            },
          ),
        ),
      ),
    );
  }
}
