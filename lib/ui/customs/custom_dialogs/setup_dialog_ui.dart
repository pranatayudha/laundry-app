import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/enums/dialog_type.dart';
import 'base_custom_dialog.dart';
import 'error_custom_dialog.dart';
import 'image_expand_dialog.dart';
import 'maksima_image_expand_dialog.dart';
import 'success_dialog.dart';
import 'take_file_dialog.dart';
import 'take_photo_dialog.dart';
import 'unsuccess_dialog.dart';

void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.base: (context, sheetRequest, completer) => BaseCustomDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
    DialogType.error: (context, sheetRequest, completer) => ErrorCustomDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
    DialogType.imageFileExpand: (context, sheetRequest, completer) =>
        ImageExpandDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
    DialogType.success: (context, sheetRequest, completer) => SuccessDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
    DialogType.unsuccess: (context, sheetRequest, completer) =>
        UnsuccessSuccessDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
    DialogType.takePhoto: (context, sheetRequest, completer) => TakePhotoDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
    DialogType.takeFile: (context, sheetRequest, completer) => TakeFileDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
    DialogType.maksimaImageFileExpand: (context, sheetRequest, completer) =>
        MaksimaImageExpandDialog(
          request: sheetRequest as DialogRequest,
          completer: completer as Function(DialogResponse),
        ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
