import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';

void main() {
  late AddPostViewModel viewModel;
  late MockActionHandlerService mockActionHandlerService;

  setUpAll(() {
    testSetupLocator();
    registerServices();
    mockActionHandlerService = getAndRegisterLocalActionHandlerService();
  });

  setUp(() {
    // Register our local ActionHandlerService mock specifically for this test

    viewModel = AddPostViewModel();

    // Set up userConfig mocks
    final mockOrg = OrgInfo(
      id: 'org_123',
      name: 'Test Organization',
      userRegistrationRequired: false,
    );
    final mockUser = User(
      id: 'user_123',
      name: 'Test User',
    );

    when(userConfig.currentOrg).thenReturn(mockOrg);
    when(userConfig.currentUser).thenReturn(mockUser);
  });

  tearDownAll(() {
    // Clean up general services
    unregisterServices();

    // Ensure ActionHandlerService is unregistered
    if (locator.isRegistered<ActionHandlerService>()) {
      locator.unregister<ActionHandlerService>();
    }
  });

  group('AddPostViewModel Tests', () {
    group('Initialization', () {
      test('should initialize correctly', () {
        // Act
        viewModel.initialise();

        // Assert
        expect(viewModel.userName, equals('Test User'));
        expect(viewModel.userPic, null);
        expect(viewModel.orgName, equals('Test Organization'));
        expect(viewModel.imageFiles, isEmpty);
        expect(viewModel.captionController.text, isEmpty);
        expect(viewModel.imageCount, equals(0));
        expect(viewModel.imageFile, isNull);
      });

      test('should have correct maxImages constant', () {
        expect(AddPostViewModel.maxImages, equals(5));
      });
    });

    group('Image Management', () {
      test(
          'should add image when getImageFromGallery is called with valid image',
          () async {
        // Arrange
        viewModel.initialise();
        final mockFile = File('test_image.jpg');
        final mockCroppedFile = File('cropped_image.jpg');

        when(multimediaPickerService.getPhotoFromGallery(camera: false))
            .thenAnswer((_) async => mockFile);
        when(imageService.cropImage(imageFile: mockFile))
            .thenAnswer((_) async => mockCroppedFile);
        // Use a fake/mock CroppedFile as expected by cropImage

        // Act
        await viewModel.getImageFromGallery(camera: false);

        // Assert
        expect(viewModel.imageFiles.length, equals(1));
        expect(viewModel.imageFiles.first, equals(mockCroppedFile));
        expect(viewModel.imageFile, equals(mockCroppedFile));
        expect(viewModel.imageCount, equals(1));
        verify(multimediaPickerService.getPhotoFromGallery(camera: false))
            .called(1);
        verify(imageService.cropImage(imageFile: mockFile)).called(1);
      });

      test('should add image when getImageFromGallery is called with camera',
          () async {
        // Arrange
        viewModel.initialise();
        final mockFile = File('camera_image.jpg');
        final mockCroppedFile = File('cropped_camera_image.jpg');

        viewModel = AddPostViewModel();
        viewModel.initialise();
        when(multimediaPickerService.getPhotoFromGallery(camera: true))
            .thenAnswer((_) async => mockFile);
        when(imageService.cropImage(imageFile: mockFile))
            .thenAnswer((_) async => mockCroppedFile);

        // Act
        await viewModel.getImageFromGallery(camera: true);

        // Assert
        expect(viewModel.imageFiles.length, equals(1));
        verify(multimediaPickerService.getPhotoFromGallery(camera: true))
            .called(1);
      });

      test('should not add image when cropImage returns null', () async {
        // Arrange
        viewModel.initialise();
        final mockFile = File('test_image.jpg');

        when(multimediaPickerService.getPhotoFromGallery(camera: false))
            .thenAnswer((_) async => mockFile);
        when(imageService.cropImage(imageFile: mockFile))
            .thenAnswer((_) async => null);

        // Act
        await viewModel.getImageFromGallery(camera: false);

        // Assert
        expect(viewModel.imageFiles, isEmpty);
        expect(viewModel.imageFile, isNull);
      });

      test('should add multiple images up to maxImages limit', () {
        // Arrange
        viewModel.initialise();
        final mockFiles = List.generate(
          7,
          (index) => File('test_image_\$index.jpg'),
        ); // More than maxImages

        // Act & Assert
        for (int i = 0; i < mockFiles.length; i++) {
          viewModel.addImage(mockFiles[i]);
          if (i < AddPostViewModel.maxImages) {
            expect(viewModel.imageFiles.length, equals(i + 1));
            expect(viewModel.imageFiles.contains(mockFiles[i]), isTrue);
          } else {
            // Should not add more than maxImages
            expect(
              viewModel.imageFiles.length,
              equals(AddPostViewModel.maxImages),
            );
            expect(viewModel.imageFiles.contains(mockFiles[i]), isFalse);
          }
        }
      });

      test('should remove image at specific index', () {
        // Arrange
        viewModel.initialise();
        final mockFiles = [
          File('image1.jpg'),
          File('image2.jpg'),
          File('image3.jpg'),
        ];

        mockFiles.forEach(viewModel.addImage);
        expect(viewModel.imageFiles.length, equals(3));

        // Act
        viewModel.removeImageAt(1); // Remove middle image

        // Assert
        expect(viewModel.imageFiles.length, equals(2));
        expect(viewModel.imageFiles.contains(mockFiles[0]), isTrue);
        expect(viewModel.imageFiles.contains(mockFiles[1]), isFalse);
        expect(viewModel.imageFiles.contains(mockFiles[2]), isTrue);
      });

      test('should not remove image when index is out of bounds', () {
        // Arrange
        viewModel.initialise();
        final mockFile = File('test_image.jpg');
        viewModel.addImage(mockFile);
        expect(viewModel.imageFiles.length, equals(1));

        // Act
        viewModel.removeImageAt(-1); // Invalid negative index
        expect(viewModel.imageFiles.length, equals(1));

        viewModel.removeImageAt(5); // Invalid high index
        expect(viewModel.imageFiles.length, equals(1));
      });

      test('should remove all images when removeImage is called', () {
        // Arrange
        viewModel.initialise();
        final mockFiles = [
          File('image1.jpg'),
          File('image2.jpg'),
          File('image3.jpg'),
        ];

        mockFiles.forEach(viewModel.addImage);
        expect(viewModel.imageFiles.length, equals(3));

        // Act
        viewModel.removeImage();

        // Assert
        expect(viewModel.imageFiles, isEmpty);
        expect(viewModel.imageFile, isNull);
        expect(viewModel.imageCount, equals(0));
      });
    });

    group('Post Upload Validation', () {
      test('should return false for canUploadPost when no images selected', () {
        // Arrange
        viewModel.initialise();
        viewModel.captionController.text = 'Test caption';

        // Act & Assert
        expect(viewModel.canUploadPost(), isFalse);
      });

      test('should return false for canUploadPost when caption is empty', () {
        // Arrange
        viewModel.initialise();
        final mockFile = File('test_image.jpg');
        viewModel.addImage(mockFile);

        // Act & Assert
        expect(viewModel.canUploadPost(), isFalse);
      });

      test(
          'should return false for canUploadPost when caption is only whitespace',
          () {
        // Arrange
        viewModel.initialise();
        final mockFile = File('test_image.jpg');
        viewModel.addImage(mockFile);
        viewModel.captionController.text = '   ';

        // Act & Assert
        expect(viewModel.canUploadPost(), isFalse);
      });

      test(
          'should return true for canUploadPost when both image and caption exist',
          () {
        // Arrange
        viewModel.initialise();
        final mockFile = File('test_image.jpg');
        viewModel.addImage(mockFile);
        viewModel.captionController.text = 'Test caption';

        // Act & Assert
        expect(viewModel.canUploadPost(), isTrue);
      });

      test('should show error when uploading post without images', () async {
        // Arrange
        viewModel.initialise();
        viewModel.captionController.text = 'Test caption';

        // Act
        await viewModel.uploadPost();

        // Assert
        verify(
          navigationService.showTalawaErrorSnackBar(
            'At least one image is required to create a post',
            MessageType.error,
          ),
        ).called(1);
      });

      test('should show error when uploading post without caption', () async {
        // Arrange
        viewModel.initialise();
        final mockFile = File('test_image.jpg');
        viewModel.addImage(mockFile);

        // Act
        await viewModel.uploadPost();

        // Assert
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Caption cannot be empty',
            MessageType.error,
          ),
        ).called(1);
      });
    });

    group('MIME Type Detection', () {
      test('should return correct MIME type for AVIF files', () {
        expect(viewModel.getPostAttachmentMimeType('image.avif'), 'IMAGE_AVIF');
        expect(viewModel.getPostAttachmentMimeType('IMAGE.AVIF'), 'IMAGE_AVIF');
      });

      test('should return correct MIME type for JPEG files', () {
        expect(viewModel.getPostAttachmentMimeType('image.jpg'), 'IMAGE_JPEG');
        expect(viewModel.getPostAttachmentMimeType('image.jpeg'), 'IMAGE_JPEG');
        expect(viewModel.getPostAttachmentMimeType('IMAGE.JPG'), 'IMAGE_JPEG');
      });

      test('should return correct MIME type for PNG files', () {
        expect(viewModel.getPostAttachmentMimeType('image.png'), 'IMAGE_PNG');
        expect(viewModel.getPostAttachmentMimeType('IMAGE.PNG'), 'IMAGE_PNG');
      });

      test('should return correct MIME type for WebP files', () {
        expect(viewModel.getPostAttachmentMimeType('image.webp'), 'IMAGE_WEBP');
        expect(viewModel.getPostAttachmentMimeType('IMAGE.WEBP'), 'IMAGE_WEBP');
      });

      test('should return correct MIME type for MP4 files', () {
        expect(viewModel.getPostAttachmentMimeType('video.mp4'), 'VIDEO_MP4');
        expect(viewModel.getPostAttachmentMimeType('VIDEO.MP4'), 'VIDEO_MP4');
      });

      test('should return correct MIME type for WebM files', () {
        expect(viewModel.getPostAttachmentMimeType('video.webm'), 'VIDEO_WEBM');
        expect(viewModel.getPostAttachmentMimeType('VIDEO.WEBM'), 'VIDEO_WEBM');
      });

      test('should throw exception for unsupported file types', () {
        expect(
          () => viewModel.getPostAttachmentMimeType('file.txt'),
          throwsException,
        );
        expect(
          () => viewModel.getPostAttachmentMimeType('file.doc'),
          throwsException,
        );
        expect(
          () => viewModel.getPostAttachmentMimeType('file.pdf'),
          throwsException,
        );
        expect(
          () => viewModel.getPostAttachmentMimeType('file.unknown'),
          throwsException,
        );
      });
    });

    group('Attachment Data Preparation', () {
      test('should prepare attachment data correctly', () {
        // Arrange
        const objectName = 'test-object-name';
        const fileHash = 'abc123hash';
        const name = 'test-file.jpg';
        const mimeType = 'IMAGE_JPEG';

        // Act
        final result = viewModel.prepareAttachmentData(
          objectName,
          fileHash,
          name,
          mimeType,
        );

        // Assert
        expect(result, isA<Map<String, String>>());
        expect(result['objectName'], equals(objectName));
        expect(result['fileHash'], equals(fileHash));
        expect(result['name'], equals(name));
        expect(result['mimeType'], equals(mimeType));
        expect(result.length, equals(4));
      });
    });

    group('Getters', () {
      test('should return correct userName from current user', () {
        // Arrange
        viewModel.initialise();

        // Act & Assert
        expect(viewModel.userName, equals('Test User'));
      });

      test('should return correct userPic from current user', () {
        // Arrange
        viewModel.initialise();

        // Act & Assert
        expect(viewModel.userPic, null);
      });

      test('should return correct orgName from selected organization', () {
        // Arrange
        viewModel.initialise();

        // Act & Assert
        expect(viewModel.orgName, equals('Test Organization'));
      });

      test('should return correct imageFile (first image)', () {
        // Arrange
        viewModel.initialise();
        final mockFiles = [
          File('image1.jpg'),
          File('image2.jpg'),
          File('image3.jpg'),
        ];

        // Act
        mockFiles.forEach(viewModel.addImage);

        // Assert
        expect(viewModel.imageFile, equals(mockFiles.first));
      });

      test('should return null imageFile when no images', () {
        // Arrange
        viewModel.initialise();

        // Act & Assert
        expect(viewModel.imageFile, isNull);
      });

      test('should return correct imageCount', () {
        // Arrange
        viewModel.initialise();
        final mockFiles = [
          File('image1.jpg'),
          File('image2.jpg'),
        ];

        // Act
        mockFiles.forEach(viewModel.addImage);

        // Assert
        expect(viewModel.imageCount, equals(2));
      });
    });

    group('Notification Testing', () {
      test('should notify listeners when adding image', () {
        // Arrange
        viewModel.initialise();
        var notificationCount = 0;
        viewModel.addListener(() {
          notificationCount++;
        });

        final mockFile = File('test_image.jpg');

        // Act
        viewModel.addImage(mockFile);

        // Assert
        expect(notificationCount, equals(1));
      });

      test('should notify listeners when removing image', () {
        // Arrange
        viewModel.initialise();
        final mockFile = File('test_image.jpg');
        viewModel.addImage(mockFile);

        var notificationCount = 0;
        viewModel.addListener(() {
          notificationCount++;
        });

        // Act
        viewModel.removeImageAt(0);

        // Assert
        expect(notificationCount, equals(1));
      });

      test('should notify listeners when removing all images', () {
        // Arrange
        viewModel.initialise();
        final mockFiles = [
          File('image1.jpg'),
          File('image2.jpg'),
        ];
        mockFiles.forEach(viewModel.addImage);

        var notificationCount = 0;
        viewModel.addListener(() {
          notificationCount++;
        });

        // Act
        viewModel.removeImage();

        // Assert
        expect(notificationCount, equals(1));
      });
    });

    group('uploadPost Tests', () {
      test('should show error when no images are selected', () async {
        // Arrange
        viewModel.initialise();
        viewModel.captionController.text = 'Test caption';

        // Act
        await viewModel.uploadPost();

        // Assert
        verify(
          navigationService.showTalawaErrorSnackBar(
            "At least one image is required to create a post",
            MessageType.error,
          ),
        ).called(1);
      });

      test('should show error when caption is empty', () async {
        // Arrange
        viewModel.initialise();
        final mockFile = File('assets/images/talawa-logo-lite-200x200.png');
        viewModel.addImage(mockFile);

        // Act
        await viewModel.uploadPost();

        // Assert
        verify(
          navigationService.showTalawaErrorSnackBar(
            "Caption cannot be empty",
            MessageType.error,
          ),
        ).called(1);
      });

      test('should show error when caption is only whitespace', () async {
        // Arrange
        viewModel.initialise();
        final mockFile = File('assets/images/talawa-logo-lite-200x200.png');
        viewModel.addImage(mockFile);
        viewModel.captionController.text = '   ';

        // Act
        await viewModel.uploadPost();

        // Assert
        verify(
          navigationService.showTalawaErrorSnackBar(
            "Caption cannot be empty",
            MessageType.error,
          ),
        ).called(1);
      });

      test('should call ActionHandlerService with correct parameters',
          () async {
        // Arrange
        viewModel.initialise();
        final mockFile = File('assets/images/talawa-logo-lite-200x200.png');
        viewModel.addImage(mockFile);
        viewModel.captionController.text = 'Test post caption';

        // Act
        await viewModel.uploadPost();

        // Assert
        verify(
          mockActionHandlerService.performAction(
            actionType: ActionType.critical,
            criticalActionFailureMessage: TalawaErrors.postCreationFailed,
            action: anyNamed('action'),
            onValidResult: anyNamed('onValidResult'),
            apiCallSuccessUpdateUI: anyNamed('apiCallSuccessUpdateUI'),
            onActionException: anyNamed('onActionException'),
            onActionFinally: anyNamed('onActionFinally'),
          ),
        ).called(1);
      });

      test('should handle successful post upload flow', () async {
        // Arrange
        viewModel.initialise();
        final mockFile = File('assets/images/talawa-logo-lite-200x200.png');
        viewModel.addImage(mockFile);
        viewModel.captionController.text = 'Test post caption';

        // Act
        await viewModel.uploadPost();

        // Assert - Just verify that ActionHandlerService is called
        verify(
          mockActionHandlerService.performAction(
            actionType: ActionType.critical,
            criticalActionFailureMessage: TalawaErrors.postCreationFailed,
            action: anyNamed('action'),
            onValidResult: anyNamed('onValidResult'),
            apiCallSuccessUpdateUI: anyNamed('apiCallSuccessUpdateUI'),
            onActionException: anyNamed('onActionException'),
            onActionFinally: anyNamed('onActionFinally'),
          ),
        ).called(1);
      });
    });
  });
}
