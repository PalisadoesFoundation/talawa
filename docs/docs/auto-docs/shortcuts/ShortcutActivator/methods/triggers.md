# Method: `triggers`

## Description

An optional property to provide all the keys that might be the final event
 to trigger this shortcut.

 For example, for `Ctrl-A`, [LogicalKeyboardKey.keyA] is the only trigger,
 while [LogicalKeyboardKey.control] is not, because the shortcut should
 only work by pressing KeyA *after* Ctrl, but not before. For `Ctrl-A-E`,
 on the other hand, both KeyA and KeyE should be triggers, since either of
 them is allowed to trigger.

 If provided, trigger keys can be used as a first-pass filter for incoming
 events in order to optimize lookups, as [Intent]s are stored in a [Map]
 and indexed by trigger keys. It is up to the individual implementers of
 this interface to decide if they ignore triggers or not.

 Subclasses should make sure that the return value of this method does not
 change throughout the lifespan of this object.

 This method might also return null, which means this activator declares
 all keys as trigger keys. Activators whose [triggers] return null will be
 tested with [accepts] on every event. Since this becomes a linear search,
 and having too many might impact performance, it is preferred to return
 non-null [triggers] whenever possible.

## Return Type
`Iterable&lt;LogicalKeyboardKey&gt;?`

