-- GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local FlyButton = Instance.new("TextButton")
local StopButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 120)
Frame.Position = UDim2.new(0.5, -100, 0.5, -60)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

FlyButton.Parent = Frame
FlyButton.Size = UDim2.new(1, -20, 0, 40)
FlyButton.Position = UDim2.new(0, 10, 0, 10)
FlyButton.Text = "تشغيل الطيران"
FlyButton.BackgroundColor3 = Color3.fromRGB(0,170,0)
FlyButton.TextColor3 = Color3.new(1,1,1)

StopButton.Parent = Frame
StopButton.Size = UDim2.new(1, -20, 0, 40)
StopButton.Position = UDim2.new(0, 10, 0, 60)
StopButton.Text = "إيقاف الطيران"
StopButton.BackgroundColor3 = Color3.fromRGB(170,0,0)
StopButton.TextColor3 = Color3.new(1,1,1)

-- الطيران
local flying = false
local bodyVelocity
local bodyGyro

local function startFlying()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(999999,999999,999999)
    bodyVelocity.Velocity = Vector3.new(0,50,0)
    bodyVelocity.Parent = hrp

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(999999,999999,999999)
    bodyGyro.CFrame = hrp.CFrame
    bodyGyro.Parent = hrp

    flying = true
end

local function stopFlying()
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end
    flying = false
end

FlyButton.MouseButton1Click:Connect(function()
    if not flying then
        startFlying()
    end
end)

StopButton.MouseButton1Click:Connect(function()
    if flying then
        stopFlying()
    end
end)