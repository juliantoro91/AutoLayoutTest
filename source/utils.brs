function AutoLayout (node as Object, isVertical as Boolean) as Boolean
    
    ' Get parent and verify its existence
    parent = node.GetParent()
    if parent = invalid then return false
    
    ' Verify the Layout Structure
    if parent.threadInfo().node.type <> "Rectangle" then return false
    if node.threadInfo().node.type <> "LayoutGroup" then return false
    
    ' Get parent dimensions
    parentWidth = parent.width
    parentHeight = parent.height
    
    childrenQ = node.GetChildCount()
    for each child in node.GetChildren(childrenQ,0)
    
        if child.width <> invalid
            if child.avoidDimensionalChange = invalid
                if isVertical
                    child.width = parentWidth
                else
                    child.height = parentheight
                end if
            end if
        end if
        
        ' Verifying child recurrence in function
        if child.threadInfo().node.type = "Rectangle" and child.GetChildCount() = 1 and child.GetChild(0).threadInfo().node.type = "LayoutGroup"
            
            childIsVertical = false
            if child.GetChild(0).layoutDirection = "vert" then childIsVertical = true
            
            if AutoLayout(child.GetChild(0), childIsVertical) then ? "AutoLayout Success"
            CenteringLayout(child.GetChild(0))
            
        end if
        
    end for
    
    grossDimension = 0 ' Variable to store the gross dimension of all components
        
    ' Calculate itemSpacings
    if isVertical
        grossDimension = node.boundingRect().height
        itemSpacing = SetItemSpacings(parentHeight, grossDimension, childrenQ)
    else
        grossDimension = node.boundingRect().width
        itemSpacing = SetItemSpacings(parentWidth, grossDimension, childrenQ)
    end if
    
    ? "itemSpacing : ";node.id;" : ";itemSpacing
    
    ' Set itemSpacings
    node.itemSpacings = itemSpacing
    
    return true
      
end function


function SetItemSpacings (parentDimension as Float, grossDimension as Float, childrenQ as Integer) as Float
    
    itemSpacing = (parentDimension - grossDimension) / (childrenQ - 1)
    
    return itemSpacing
    
end function


sub CenteringLayout(node as Object)

    ? "CenteringLayout"
    ? "id: ";node.id
    node.translation = [0, 0]
    
    coordenates = node.boundingRect()
    
    if coordenates.x <> 0 OR coordenates.y <> 0 then node.translation = [-coordenates.x, -coordenates.y]
    
    if node.id = "masterFrame"
        ? coordenates
        ? node.translation
        ? node.boundingRect()
    end if
    
end sub
