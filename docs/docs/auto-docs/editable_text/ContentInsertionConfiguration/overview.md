# Overview for `ContentInsertionConfiguration`

## Description

Configures the ability to insert media content through the soft keyboard.

 The configuration provides a handler for any rich content inserted through
 the system input method, and also provides the ability to limit the mime
 types of the inserted content.

 See also:

 * [EditableText.contentInsertionConfiguration]

## Members

- **onContentInserted**: `ValueChanged&lt;KeyboardInsertedContent&gt;`
  Called when a user inserts content through the virtual / on-screen keyboard,
 currently only used on Android.

 [KeyboardInsertedContent] holds the data representing the inserted content.

 

 This example shows how to access the data for inserted content in your
 `TextField`.

 ** See code in examples/api/lib/widgets/editable_text/editable_text.on_content_inserted.0.dart **
 

 See also:

  * <https://developer.android.com/guide/topics/text/image-keyboard>

- **allowedMimeTypes**: `List&lt;String&gt;`
  
 Used when a user inserts image-based content through the device keyboard,
 currently only used on Android.

 The passed list of strings will determine which MIME types are allowed to
 be inserted via the device keyboard.

 The default mime types are given by [kDefaultContentInsertionMimeTypes].
 These are all the mime types that are able to be handled and inserted
 from keyboards.

 This field cannot be an empty list.

 
 This example shows how to limit image insertion to specific file types.

 ** See code in examples/api/lib/widgets/editable_text/editable_text.on_content_inserted.0.dart **
 

 See also:

  * <https://developer.android.com/guide/topics/text/image-keyboard>
 

## Constructors

### Unnamed Constructor
Creates a content insertion configuration with the specified options.

 A handler for inserted content, in the form of [onContentInserted], must
 be supplied.

 The allowable mime types of inserted content may also
 be provided via [allowedMimeTypes], which cannot be an empty list.

