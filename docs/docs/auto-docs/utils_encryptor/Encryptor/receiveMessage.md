::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  receiveMessage method

::: self-name
receiveMessage
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_encryptor/Encryptor-class-sidebar.html" below-sidebar=""}
<div>

# [receiveMessage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[receiveMessage]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [message]{.parameter-name}, ]{#receiveMessage-param-message
    .parameter}
2.  [[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)]{.type-annotation}
    [hive]{.parameter-name}]{#receiveMessage-param-hive .parameter}

)
:::

::: {.section .desc .markdown}
Helper function to decrypt the message.

Internally uses the
[loadKeyPair](../../utils_encryptor/Encryptor/loadKeyPair.html) function
to get private key and
[assymetricDecryptString](../../utils_encryptor/Encryptor/assymetricDecryptString.html)
to decrypt the given message.

**params**:

-   `message`: Message object containing a field named
    `encryptedMessage` which is supposed to contained user\'s message in
    encrypted format.
-   `hive`: The
    [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
    to store things in.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> receiveMessage(
  Map<String, dynamic> message,
  HiveInterface hive,
) async {
  try {
    final encryptedMessage = message['encryptedMessage'] as String;
    final privateKey = (await loadKeyPair(hive)).privateKey;
    final decryptedMessage = assymetricDecryptString(
      encryptedMessage,
      privateKey as RSAPrivateKey,
    );

    print('Decrypted Message: $decryptedMessage');
  } catch (e) {
    throw Exception('Error');
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  receiveMessage method

##### Encryptor class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
