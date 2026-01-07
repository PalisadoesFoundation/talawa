# Method: `evaluate`

## Description

The current value of this object for the given [Animation].

 This function is implemented by deferring to [transform]. Subclasses that
 want to provide custom behavior should override [transform], not
 [evaluate].

 See also:

  * [transform], which is similar but takes a `t` value directly instead of
    an [Animation].
  * [animate], which creates an [Animation] out of this object, continually
    applying [evaluate].

## Return Type
`T`

## Parameters

- `animation`: `Animation&lt;double&gt;`
