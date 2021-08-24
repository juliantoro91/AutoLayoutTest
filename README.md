# AutoLayoutTest
This is an experiment of an Autolayout Screen, using a conjunction of LayoutGroup and Rectangle Nodes.

The dimensions are defined by a JSON file.

It was built in Brighscript and Scenegraph.

You can see it works: https://youtu.be/XS-4_nK-dro

HOW IT WORKS
1. User Screen children are included inside a Rectangle and a LayoutGroup Nodes.
2. The dimensions of the limit area are defined by rectangle dimensions.
3. Rectangle width and height are modified by the input string loaded from the item's title in the content feed JSON file.
4. When an item is focused, the title is loaded and processed to modify the rectangle's width and height.
5. Once the dimensional change is produced, an update frame function recalculates item spacings value for the Layoutgroup, using components "boundingrect" fields and parent width and height.
6. This function needs a LayoutGroup node container and a boolean variable that specifies if the arrangement is vertical or not.
7. This function is recursive, so, it looks for Rectangle-Layoutgroups nodes to perform the "Autolayout" function in the components of each child container.
