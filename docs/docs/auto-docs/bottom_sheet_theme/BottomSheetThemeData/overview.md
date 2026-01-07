# Overview for `BottomSheetThemeData`

## Description

Defines default property values for [BottomSheet]'s [Material].

 Descendant widgets obtain the current [BottomSheetThemeData] object
 using `Theme.of(context).bottomSheetTheme`. Instances of
 [BottomSheetThemeData] can be customized with
 [BottomSheetThemeData.copyWith].

 Typically a [BottomSheetThemeData] is specified as part of the
 overall [Theme] with [ThemeData.bottomSheetTheme].

 All [BottomSheetThemeData] properties are `null` by default.
 When null, the [BottomSheet] will provide its own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value for [BottomSheet.backgroundColor].

 If null, [BottomSheet] defaults to [Material]'s default.

- **surfaceTintColor**: `Color?`
  Overrides the default value for surfaceTintColor.

 If null, [BottomSheet] will not display an overlay color.

 See [Material.surfaceTintColor] for more details.

- **elevation**: `double?`
  Overrides the default value for [BottomSheet.elevation].

 

 If null, [BottomSheet] defaults to 0.0.

- **modalBackgroundColor**: `Color?`
  Value for [BottomSheet.backgroundColor] when the Bottom sheet is presented
 as a modal bottom sheet.

- **modalBarrierColor**: `Color?`
  Overrides the default value for barrier color when the Bottom sheet is presented as
 a modal bottom sheet.

- **shadowColor**: `Color?`
  Overrides the default value for [BottomSheet.shadowColor].

- **modalElevation**: `double?`
  Value for [BottomSheet.elevation] when the Bottom sheet is presented as a
 modal bottom sheet.

- **shape**: `ShapeBorder?`
  Overrides the default value for [BottomSheet.shape].

 If null, no overriding shape is specified for [BottomSheet], so the
 [BottomSheet] is rectangular.

- **showDragHandle**: `bool?`
  Overrides the default value for [BottomSheet.showDragHandle].

- **dragHandleColor**: `Color?`
  Overrides the default value for [BottomSheet.dragHandleColor].

- **dragHandleSize**: `Size?`
  Overrides the default value for [BottomSheet.dragHandleSize].

- **clipBehavior**: `Clip?`
  Overrides the default value for [BottomSheet.clipBehavior].

 If null, [BottomSheet] uses [Clip.none].

- **constraints**: `BoxConstraints?`
  Constrains the size of the [BottomSheet].

 If null, the bottom sheet's size will be unconstrained.

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.bottomSheetTheme].

