# Overview for `DataTableThemeData`

## Description

Defines default property values for descendant [DataTable]
 widgets.

 Descendant widgets obtain the current [DataTableThemeData] object
 using `DataTableTheme.of(context)`. Instances of
 [DataTableThemeData] can be customized with
 [DataTableThemeData.copyWith].

 Typically a [DataTableThemeData] is specified as part of the
 overall [Theme] with [ThemeData.dataTableTheme].

 All [DataTableThemeData] properties are `null` by default. When
 null, the [DataTable] will use the values from [ThemeData] if they exist,
 otherwise it will provide its own defaults based on the overall [Theme]'s
 textTheme and colorScheme. See the individual [DataTable] properties for
 details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **decoration**: `Decoration?`
  

- **dataRowColor**: `MaterialStateProperty<Color?>?`
  
 

- **dataRowMinHeight**: `double?`
  

- **dataRowMaxHeight**: `double?`
  

- **dataTextStyle**: `TextStyle?`
  

- **headingRowColor**: `MaterialStateProperty<Color?>?`
  
 

- **headingRowHeight**: `double?`
  

- **headingTextStyle**: `TextStyle?`
  

- **horizontalMargin**: `double?`
  

- **columnSpacing**: `double?`
  

- **dividerThickness**: `double?`
  

- **checkboxHorizontalMargin**: `double?`
  

- **headingCellCursor**: `MaterialStateProperty<MouseCursor?>?`
  If specified, overrides the default value of [DataColumn.mouseCursor].

- **dataRowCursor**: `MaterialStateProperty<MouseCursor?>?`
  If specified, overrides the default value of [DataRow.mouseCursor].

- **headingRowAlignment**: `MainAxisAlignment?`
  If specified, overrides the default value of [DataColumn.headingRowAlignment].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.dataTableTheme].

