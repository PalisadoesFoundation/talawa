import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:talawa/utils/uidata.dart';

class ImageService {
  static Future<File> fetchImageFromCamera() async {
    try {
      final PickedFile selectedImage =
          await ImagePicker().getImage(source: ImageSource.camera);
      if (selectedImage != null) {
        return File(selectedImage.path);
      }
      return null;
    } catch (exception) {
      print('Error getting Camera Image, exception: $exception');
      return null;
    }
  }

  static Future<File> fetchImageFromGallery() async {
    try {
      final PickedFile selectedImage =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        return File(selectedImage.path);
      }
      return null;
    } catch (exception) {
      print('Error getting Image from gallery, exception: $exception');
      return null;
    }
  }

  static Future<File> cropImage(File image) async {
    try {
      final File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        androidUiSettings: const AndroidUiSettings(
          toolbarColor: UIData.primaryColor,
        ),
      );
      if (croppedImage != null) {
        return File(croppedImage.path);
      }
      return null;
    } catch (exception) {
      print('Error cropping Image, exception: $exception');
      return null;
    }
  }
}
