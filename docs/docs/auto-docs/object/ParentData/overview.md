# Overview for `ParentData`

## Description

Base class for data associated with a [RenderObject] by its parent.

 Some render objects wish to store data on their children, such as the
 children's input parameters to the parent's layout algorithm or the
 children's position relative to other children.

 See also:

  * [RenderObject.setupParentData], which [RenderObject] subclasses may
    override to attach specific types of parent data to children.

