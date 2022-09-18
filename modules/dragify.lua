local util = loadstring(game:HttpGet("raw.githubusercontent.com/Ep-lxs/gay/blob/main/modules/util.lua"))

local Dragging = nil
local Speed = 0.4
local dragInput = nil
local dragStart = nil
local Position = nil
local startPosition = nil

return function(Frame) 
    function Update(input)
        Delta = input.Position - dragStart
        Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + Delta.X, startPosition.Y.Scale, startPosition.Y.Offset + Delta.Y)
        util.TweenService:Create(
            Frame, 
            TweenInfo.new(Speed, "Quint", "Out"), 
            {Position = Position}
        ):Play()
    end
    
    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            Dragging = true
            dragStart = input.Position
            startPosition = Frame.Position

            input.Changed:Connect(function()
                if (input.UserInputState == Enum.UserInputState.End) then
                    Dragging = false
                end
            end)
        end
    end)
    
    Frame.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if (input == dragInput and Dragging) then
            updateInput(input)
        end
    end)
end