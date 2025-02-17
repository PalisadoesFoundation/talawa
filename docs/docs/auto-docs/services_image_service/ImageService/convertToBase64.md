::::::: {#dartdoc-main-content .main-content above-sidebar="services_image_service/ImageService-class-sidebar.html" below-sidebar=""}
<div>

# [convertToBase64]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[convertToBase64]{.name}(

1.  [[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]{.type-annotation}
    [file]{.parameter-name}]{#convertToBase64-param-file .parameter}

)
:::

::: {.section .desc .markdown}
Converts the image into Base64 format.

**params**:

-   `file`: Image as a File object.

**returns**:

-   `Future<String>`: image in string format
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<String> convertToBase64(File file) async {
  try {
    final List<int> bytes = await file.readAsBytes();
    final String base64String = base64Encode(bytes);
    return base64String;
  } catch (error) {
    return '';
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [image_service](../../services_image_service/)
3.  [ImageService](../../services_image_service/ImageService-class.html)
4.  convertToBase64 method

##### ImageService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
