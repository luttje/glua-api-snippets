export const markup = `<panel>
<parent>Panel</parent>
<preview>SliderExample.png</preview>
<realm>Client and Menu</realm>
<description>
    <deprecated
        Only exists for backwards compatibility with <page>Panel:SetActionFunction</page> and <page>Panel:PostMessage</page>.
        Use <page>DNumSlider</page> instead.
    </deprecated>

    A simple slider featuring an numeric display.
</description>
</panel>


<example>
<description>Creates a slider atop a DFrame which prints its value as it's being dragged.</description>
<code>
local frame = vgui.Create( "DFrame" )
frame:SetSize( 280, 70 )
frame:Center()
frame:SetTitle( "Bilderberg Group Dollar Value Slider" )
frame:MakePopup()

local DermaSlider = vgui.Create("Slider", frame)
DermaSlider:SetPos( 0, 30 )
DermaSlider:SetWide( 100 )
DermaSlider:SetMin( 0 )
DermaSlider:SetMax( 1.0 )
DermaSlider:SetValue( 0.5 )
DermaSlider:SetDecimals( 2 )
DermaSlider.OnValueChanged = function( panel, value )
print( tostring( value ) )
end
</code>

</example>`;

export const apiDefinition =
`---
---
---
---     A simple slider featuring an numeric display.
--- Creates a slider atop a DFrame which prints its value as it's being dragged.
---@deprecated Panel:SetActionFunction and Panel:PostMessage.         Use DNumSlider instead.
---@class Slider : Panel
local Slider = {}\n\n`;
