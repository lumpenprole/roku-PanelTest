function init()
    
    m.MainMenuList = m.top.FindNode("MainMenuList")
    'm.MainMenuPanel = m.top.FindNode("MainMenuListPanel")
    m.MainMenuPanelSet = m.top.FindNode("MainMenuPanelSet")
    m.MainMenuPanel = m.MainMenuPanelSet.createChild("ListPanel")
    m.MainMenuPanelSet.createChild("Panel")
    m.MainMenuPanel.list = m.MainMenuList


    m.MainMenuList.observeField("itemFocused", "handleFocus")
    'm.MainMenuList.observeField("focusedChild", "handleUnfocus")

    m.mainContentPanels = CreateObject("roArray", 0, true)

    for i = 0 to 3
        m.mainContentPanels.push(createPanel(1))
    end for

    m.MainMenuList.content = createList()
    m.MainMenuList.setFocus(true)

end function

function handleFocus()
    sel = m.MainMenuList.itemFocused
    ?"Focused before: ";sel

    item = m.MainMenuList.content.getChild(m.MainMenuList.itemFocused)
    'm.MainMenuPanelSet.appendChild(newPanel)
    oldPanel = m.top.FindNode("activePanel")
    newPanel = m.mainContentPanels[sel]
    m.MainMenuPanelSet.replaceChild(newPanel, 1)
    'm.CurrentPanel = newPanel
    m.CurrentList = newPanel.FindNode("ContentList")

    ?"Focused after: ";m.MainMenuList.itemFocused

end function

function handleUnfocus()
    ?"ITEM UNFOCUSED----------------------------------------"
    ?"Focused: ";m.MainMenuList.itemFocused
    ?"Selected: ";m.MainMenuList.itemSelected
    ?"------------------------------------------------------"
end function

'function onKeyEvent(key as String, press as Boolean) as Boolean
'    ?"Key: ";key
'    ?"Pressed: ";press 'why the hell is press coming in false in this function when I press the key?
'
'    if key = "left"
'        ?"LEFT"
'        m.MainMenuList.setFocus(true)
'    else if key = "right"
'        ?"RIGHT"
'        m.CurrentList.setFocus(true)
'    end if
'end function

function createPanel(color as Integer) as Dynamic
    colors = ["0xFF000099", "0x00FF0099", "0xFFFF0099"]

    newPanel = CreateObject("roSGNode", "ListPanel")
    newPanel.width = 700
    newPanel.id = "activePanel"
    newRect = CreateObject("roSGNode", "Rectangle")
    newRect.color = colors[color]
    newRect.width = "800"
    newRect.height = "720"
    newPanel.appendChild(newRect)
    newList = CreateObject("roSGNode", "LabelList")
    newList.id = "ContentList"
    newList.vertFocusAnimationStyle = "floatingFocus"
    newList.content = createList()
    newPanel.appendChild(newList)
    newPanel.list = newList

    newPanel.paneSize = "wide"

    return newPanel
end function


function createList() as Dynamic
    listContent = CreateObject("roSGNode", "ContentNode")

    oneItem = CreateObject("roSGNode", "ContentNode")
    oneItem.title = "TITLE 1"
    listContent.appendChild(oneItem)
    
    twoItem = CreateObject("roSGNode", "ContentNode")
    twoItem.title = "TITLE 2"
    listContent.appendChild(twoItem)

    threeItem = CreateObject("roSGNode", "ContentNode")
    threeItem.title = "TITLE 3"
    listContent.appendChild(threeItem)

    return listContent
end function
