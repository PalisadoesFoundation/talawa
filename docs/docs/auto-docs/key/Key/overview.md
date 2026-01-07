# Overview for `Key`

## Description

A [Key] is an identifier for [Widget]s, [Element]s and [SemanticsNode]s.

 A new widget will only be used to update an existing element if its key is
 the same as the key of the current widget associated with the element.

 

 Keys must be unique amongst the [Element]s with the same parent.

 Subclasses of [Key] should either subclass [LocalKey] or [GlobalKey].

 See also:

  * [Widget.key], which discusses how widgets use keys.

## Constructors

### Unnamed Constructor
Construct a [ValueKey&lt;String&gt;] with the given [String].

 This is the simplest way to create keys.

### empty
Default constructor, used by subclasses.

 Useful so that subclasses can call us, because the [Key.new] factory
 constructor shadows the implicit constructor.

