function init()
    
    m.MainMenuList = m.top.FindNode("MainMenuList")
    m.MainMenuPanel = m.top.FindNode("MainMenuListPanel")

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

    m.MainMenuList.content = listContent
    m.MainMenuList.setFocus(true)
end function


Sub navigateList(direction as Integer)
    m.MainMenuList.jumpToItem = m.MainMenuList.itemSelected + direction
end Sub
