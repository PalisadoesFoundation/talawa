// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import '../helpers/test_helpers.dart';

void main() {
  setUp(() {
    registerServices();
  });
  group('MultiMediaPickerService test', () {
    test("test get fileStream", () async {
      final model = MultiMediaPickerService();
      expect(
        model.fileStream.toString(),
        "Instance of '_AsBroadcastStream<File>'",
      );
    });
    test("crop image method", () async {
      final mockImageCropper = imageCropper;
      final model = MultiMediaPickerService();

      const path = "test";
      final fakefile = File(path);
      final croppedFile = CroppedFile("fakeCropped");

      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
          ],
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((realInvocation) async => croppedFile);
      final file = await model.cropImage(imageFile: fakefile);
      // verify(mockImageCropper.cropImage(sourcePath: fakefile.path));
      expect(file?.path, croppedFile.path);
    });
    test("test get photo from gallery method if camera option is false",
        () async {
      final mockImageCropper = locator<ImageCropper>();
      final mockPicker = imagePicker;
      final model = MultiMediaPickerService();
      const path = 'test';
      final image = XFile(path);
      when(mockPicker.pickImage(source: ImageSource.gallery))
          .thenAnswer((realInvocation) async => image);
      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
          ],
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((realInvocation) async => CroppedFile(path));

      final result = await model.getPhotoFromGallery(camera: false);

      expect(result?.path, path);
    });
    test("test get photo from gallery method if camera option is true",
        () async {
      final mockImageCropper = locator<ImageCropper>();
      final mockPicker = locator<ImagePicker>();
      final model = MultiMediaPickerService();
      const path = 'test';
      final image = XFile(path);
      when(mockPicker.pickImage(source: ImageSource.camera))
          .thenAnswer((realInvocation) async => image);
      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
          ],
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((realInvocation) async => CroppedFile(path));

      final result = await model.getPhotoFromGallery(camera: true);

      expect(result?.path, path);
    });
    test("test no photo provided for the pick image", () async {
      final model = MultiMediaPickerService();
      final file = await model.getPhotoFromGallery(camera: false);
      expect(file?.path, null);
    });
    test("test no image provided for the image cropper", () async {
      final model = MultiMediaPickerService();
      const path = 'test';
      final file = await model.cropImage(imageFile: File(path));
      expect(file?.path, null);
    });
    test("camera access denied", () async {
      final mockPicker = locator<ImagePicker>();
      final model = MultiMediaPickerService();
      final printed = <String>[];

      final error = PlatformException(code: 'camera_access_denied');
      when(mockPicker.pickImage(source: ImageSource.camera)).thenThrow(error);
      runZoned(
        () async {
          await model.getPhotoFromGallery(camera: true);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            printed.add(line);
          },
        ),
      );
      expect(
        printed[0],
        "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $error",
      );
    });
    test("error in crop image", () async {
      final mockImageCropper = locator<ImageCropper>();
      final model = MultiMediaPickerService();
      const path = "test";
      final fakefile = File(path);
      final printed = <String>[];
      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
          ],
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenThrow(Exception());
      runZoned(
        () async {
          await model.cropImage(imageFile: fakefile);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            printed.add(line);
          },
        ),
      );
      expect(
        printed[0],
        "MultiMediaPickerService : Exception occurred while cropping Image",
      );
    });
  });
}
