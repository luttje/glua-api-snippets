-- The plugin never adds a class when the user annotated one, even if its name differs
do
  ---@class My.PanelClass : DFrame
  local PANEL = {}

  function PANEL:Renamed() end

  vgui.Register("My.RenamedPanel", PANEL, "DFrame")
end
