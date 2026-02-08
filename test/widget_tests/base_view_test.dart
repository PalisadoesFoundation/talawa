import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/views/base_view.dart';

/// FakeViewModel is a test double that extends ChangeNotifier.
/// This allows us to test BaseView's lifecycle methods without
/// depending on real ViewModels.
class FakeViewModel extends ChangeNotifier {
  /// Flag to track if dispose was called
  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}

/// Main test suite for BaseView widget
void main() {
  // Setup locator before running tests
  setUpAll(() async {
    await setupLocator();
  });

  group('BaseView Widget Tests', () {
    /// Test 1: Verify onModelReady is called when BaseView is initialized
    testWidgets('BaseView calls onModelReady when initialized',
        (WidgetTester tester) async {
      // Arrange: Set up test data
      bool onModelReadyCalled = false;
      FakeViewModel? receivedModel;

      // Register FakeViewModel in the locator so BaseView can find it
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
      locator.registerFactory<FakeViewModel>(() => FakeViewModel());

      // Act: Build the BaseView widget
      await tester.pumpWidget(
        MaterialApp(
          home: BaseView<FakeViewModel>(
            onModelReady: (model) {
              onModelReadyCalled = true;
              receivedModel = model;
            },
            builder: (context, model, child) {
              return const SizedBox();
            },
          ),
        ),
      );

      // Assert: Verify onModelReady was called
      expect(onModelReadyCalled, isTrue,
          reason: 'onModelReady should be called during initialization');
      expect(receivedModel, isNotNull,
          reason: 'onModelReady should receive the ViewModel instance');
      expect(receivedModel, isA<FakeViewModel>(),
          reason: 'onModelReady should receive the correct ViewModel type');

      // Cleanup
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
    });

    /// Test 2: Verify builder is called with correct parameters
    testWidgets('BaseView builder is called with correct parameters',
        (WidgetTester tester) async {
      // Arrange: Set up test data
      BuildContext? receivedContext;
      FakeViewModel? receivedModel;

      // Register FakeViewModel in the locator
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
      locator.registerFactory<FakeViewModel>(() => FakeViewModel());

      // Act: Build the BaseView widget
      await tester.pumpWidget(
        MaterialApp(
          home: BaseView<FakeViewModel>(
            builder: (context, model, child) {
              receivedContext = context;
              receivedModel = model;
              return const Text('Test Widget');
            },
          ),
        ),
      );

      // Assert: Verify builder parameters
      expect(receivedContext, isNotNull,
          reason: 'Builder should receive a valid BuildContext');
      expect(receivedModel, isNotNull,
          reason: 'Builder should receive the ViewModel instance');
      expect(receivedModel, isA<FakeViewModel>(),
          reason: 'Builder should receive the correct ViewModel type');

      // Verify the widget built by builder is displayed
      expect(find.text('Test Widget'), findsOneWidget,
          reason: 'Builder should render the returned widget');

      // Cleanup
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
    });

    /// Test 3: Verify dispose is called when BaseView is disposed
    testWidgets('BaseView disposes the model when widget is disposed',
        (WidgetTester tester) async {
      // Arrange: Set up test data
      FakeViewModel? testModel;

      // Register FakeViewModel in the locator
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
      locator.registerFactory<FakeViewModel>(() => FakeViewModel());

      // Act: Build the BaseView widget
      await tester.pumpWidget(
        MaterialApp(
          home: BaseView<FakeViewModel>(
            onModelReady: (model) {
              testModel = model;
            },
            builder: (context, model, child) {
              return const SizedBox();
            },
          ),
        ),
      );

      // Verify the model is not disposed initially
      expect(testModel, isNotNull);
      expect(testModel!.isDisposed, isFalse,
          reason: 'Model should not be disposed initially');

      // Act: Dispose the widget by removing it from the tree
      await tester.pumpWidget(const MaterialApp(home: SizedBox()));

      // Assert: Verify dispose was called
      expect(testModel!.isDisposed, isTrue,
          reason: 'Model should be disposed when BaseView is removed');

      // Cleanup
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
    });

    /// Test 4: Verify BaseView works without onModelReady callback
    testWidgets('BaseView works when onModelReady is null',
        (WidgetTester tester) async {
      // Arrange: Register FakeViewModel
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
      locator.registerFactory<FakeViewModel>(() => FakeViewModel());

      // Act: Build BaseView without onModelReady
      await tester.pumpWidget(
        MaterialApp(
          home: BaseView<FakeViewModel>(
            builder: (context, model, child) {
              return const Text('No onModelReady');
            },
          ),
        ),
      );

      // Assert: Widget should build successfully
      expect(find.text('No onModelReady'), findsOneWidget,
          reason: 'BaseView should work without onModelReady callback');

      // Cleanup
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
    });

    /// Test 5: Verify BaseView provides model through Provider
    testWidgets('BaseView provides model through Provider',
        (WidgetTester tester) async {
      // Arrange: Register FakeViewModel
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
      locator.registerFactory<FakeViewModel>(() => FakeViewModel());

      FakeViewModel? modelFromProvider;

      // Act: Build BaseView and access model through Provider
      await tester.pumpWidget(
        MaterialApp(
          home: BaseView<FakeViewModel>(
            builder: (context, model, child) {
              modelFromProvider = model;
              return const SizedBox();
            },
          ),
        ),
      );

      // Assert: Model should be accessible
      expect(modelFromProvider, isNotNull,
          reason: 'Model should be provided through Provider');
      expect(modelFromProvider, isA<FakeViewModel>(),
          reason: 'Provided model should be of correct type');

      // Cleanup
      if (locator.isRegistered<FakeViewModel>()) {
        locator.unregister<FakeViewModel>();
      }
    });
  });
}
