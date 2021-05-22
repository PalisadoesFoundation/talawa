import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:talawa/utils/uidata.dart';

class ImageService {
  static Future<File> fetchImageFromCamera() async {
    try {
      final PickedFile selectedImage =
          await ImagePicker().getImage(source: ImageSource.camera);
      return File(selectedImage.path);
    } catch (exception) {
      print('Error getting Camera Image $exception');
      return null;
    }
  }

  static Future<File> fetchImageFromGallery() async {
    final PickedFile selectedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    return File(selectedImage.path);
  }

  static Future<File> cropImage(File image) async {
    final File croppedImage = await ImageCropper.cropImage(
      sourcePath: image.path,
      androidUiSettings: const AndroidUiSettings(
        toolbarColor: UIData.primaryColor,
      ),
    );
    return File(croppedImage.path);
  }
}
