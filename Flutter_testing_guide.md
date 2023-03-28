# Flutter Testing Guide

## Introduction

Tests are an essential part of software development. They help developers to verify the functionality of the code they write and ensure that it behaves as expected. Testing is a process of executing a program with the intent of finding errors. In Flutter, testing is an essential part of the development process, and it's critical to write high-quality tests that cover all corner cases.


## Why do we need tests?

Tests ensure that the code you write works as intended. They help to catch bugs early in the development process, which saves time and effort in the long run. Writing tests also makes the code more reliable and maintainable. 

The cost of removing defects increases exponentially. A defect caught in requirement and design phase costs less to fix than an error caught in the software maintenance cycle.

![image](assets/images/testing_guide.png)


## How to cover all the corner cases?

To ensure that your tests cover all corner cases, you should consider the different input values and edge cases that your code might encounter. For example, if you are testing a function that performs a calculation, you should test it with different input values, including negative numbers, zero, and large numbers.

It's also a good idea to use boundary testing, where you test the boundaries between different input values. For example, if your function takes an input between 0 and 100, you should test it with values of 0, 1, 99, 100, and values just above and below these boundaries.


## How to start with Flutter Testing?

1. Add the `flutter_test` package to your `pubspec.yaml` file
2. Create a new test file in your project's `test` directory. The file should have the same name as the file you want to test, with `_test` appended to the end. For example, if you want to test a file called `my_widget.dart`, the test file should be called `my_widget_test.dart`.
3. Write test cases for the functions, widgets, or other parts of your application that you want to test. Use the tools provided by the flutter_test package, such as the test() and expect() functions, to define your test cases.
4. Run your tests using the flutter test command. This will run all the tests in your project's test directory.

### Basic Example

Suppose you have a `Calculator` class with a `add` method that takes two integers and returns their sum:

```dart
class Calculator {
  int add(int a, int b) {
    return a + b;
  }
}
```
To write a test for the `add` method, you can create a new file called `calculator_test.dart` in the same directory as your `calculator.dart` file, and write the following code:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/calculator.dart';

void main() {
  test('Calculator add method', () {
    final calculator = Calculator();
    final result = calculator.add(2, 3);
    expect(result, 5);
  });
}
```
This test imports the `flutter_test` package, which provides the test function for writing tests, and imports the `Calculator` class from `calculator.dart`. The test function takes a string description of the test (in this case, "Calculator add method"), and a closure that contains the actual test code.

Inside the closure, we create a new instance of the `Calculator` class, call its `add` method with the arguments 2 and 3, and store the result in a variable called `result`. We then use the expect function to `assert` that the value of `result` is equal to `5`.

To run this test, you can run the following command in your terminal:

```bash
flutter test
```

This will run all the tests in your project, including the `Calculator add` method test we just wrote. If the test passes, you should see the following output in your terminal:

```bash
00:00 +1: All tests passed!
```
If the test fails (for example, if the add method in calculator.dart was implemented incorrectly), you will see an error message in your terminal indicating what went wrong.


## What are mocks and how to generate them?

Mocks are objects that simulate the behavior of real objects in your application. They are often used in testing to isolate the part of your code that you want to test from the rest of the application.

In Flutter, mocks can be generated using tools like Mockito, which is a popular mock object library for Dart.
To generate a mock object using Mockito, you can follow these steps:
 1. Add the `mockito` package to your pubspec.yaml file.
 2. Import the mockito package in your test file:

    ```dart
    import 'package:mockito/mockito.dart';
    ```
 3. Define a mock object by extending the Mock class:
 
    ```dart
    class MockMyObject extends Mock implements MyObject {}
    ```
 4. Use the mock object in your test cases:

    ```dart
    test('my test case', () {
    var myMock = MockMyObject();
    // ... use the mock object ...
    });
    ```
    
   ### Example
  
  Suppose you have a `Calculator` class that performs arithmetic operations, and you want to test a `CalculatorController` class that uses the Calculator to perform
  calculations. To isolate the `CalculatorController` for testing, you can create a mock `Calculator` object that simulates the behavior of the real Calculator.
  
  First, you'll need to create a `mock` object using `mockito` as stated above, which provides tools for creating mock objects. Here's an example of how to create a
  mock
  
  ```dart
  import 'package:mockito/mockito.dart';

class MockCalculator extends Mock implements Calculator {}

// Create the mock object in your test case
final calculator = MockCalculator();

  ```
  
  Now, you can use the `calculator` mock object to simulate the behavior of the `Calculator` in your tests. For example, here's a test that verifies that the
  `CalculatorController` correctly adds two numbers:
  
  ```dart
  test('CalculatorController adds two numbers', () {
  // Create a new CalculatorController, passing in the mock Calculator
  final controller = CalculatorController(calculator);

  // Stub the add method on the mock calculator
  when(calculator.add(2, 3)).thenReturn(5);

  // Call the addNumbers method on the controller
  final result = controller.addNumbers(2, 3);

  // Verify that the add method was called on the calculator
  verify(calculator.add(2, 3)).called(1);

  // Verify that the result returned by the controller is correct
  expect(result, equals(5));
});
  ```
  
  In this test, the `MockCalculator` is created and passed to the `CalculatorController`. The `when` method is used to stub the `add` method on the mock calculator, so
  that when the `add` method is called with arguments 2 and 3, it returns the value 5. Then, the `addNumbers` method is called on the `CalculatorController`, and the
  result is verified using the `expect` method. Finally, the `verify` method is used to ensure that the `add` method was called on the mock calculator with the correct
  arguments.


## How to Stub Methods and Classes?

Stubbing is a technique used in testing to replace a real object with a simplified version that provides predictable behavior.

In Flutter, you can use stubs to replace real objects with mock objects or other simplified versions.

To stub a method or class in Flutter, you can use the when() function provided by the `mockito` package. For example, if you have a method called myMethod() that you want to stub, you can do the following:

```dart
var myMock = MockMyObject();
when(myMock.myMethod()).thenReturn('my result');
```
This will replace the `myMethod()` method on the `myMock` object with a stub that always returns the string 'my result'.

`when()` method is used in the previous Calculator example as well where it is used to stub the add method to mock the Calculator.

You can also use the any matcher to match any input value. For example:

```dart
when(myMock.myMethod(any)).thenReturn('my result');
```
This will stub the `myMethod()` method to always return 'my result', regardless of the input value.


## What to do if you find a bug while writing a test for that file?

If you find a bug while writing a test for a file, the first thing to do is to write a test case that reproduces the bug. This will help you ensure that the bug is fixed and doesn't reappear in the future.

Once you have a failing test case, you should debug the code and identify the cause of the bug. You can use tools like the print() function, the debugger in your IDE, or the debugPrint() function provided by Flutter to help you debug your code.

Once you have identified the cause of the bug, you should fix the code and run your tests again to ensure that the bug has been fixed. If you have multiple test cases that cover the same code, you should run all of them to ensure that the fix doesn't break any other parts of your code.

If you are working in a team, it's a good idea to communicate the bug and the fix to your teammates so that they are aware of the issue and can review your fix.


## Conclusion

Writing tests is an important part of the software development process, and Flutter provides a set of tools that make it easy to write tests for your application. By following the guidelines in this guide, you can ensure that your tests cover all corner cases, use mocks and stubs to isolate your code, and effectively debug and fix bugs that you encounter during the testing process.

