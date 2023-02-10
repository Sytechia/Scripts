repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Waves")
repeat task.wait() until game:GetService("ReplicatedStorage").src.client.Services:FindFirstChild("PlacementServiceClient")

--[[

TIP :

some units buff cant buff some time

]]

-------- inf rang
function x()
local o = math.huge
   local l;
for i,v in pairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do 
    if tostring(v["_stats"].player.Value) == "nil" then
           local d = (game:GetService("Workspace")["_BASES"].player.base["fake_unit"].HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
           if d < o then
               o, l = d, v
           end
       end
   end
   return l
end

task.spawn(function()
    while task.wait() do pcall(function()
for i,v in pairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do 
    if v.Name ~= "speedwagon" and v.Name ~= "bluma" then
     if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
         if v:FindFirstChild("_shadow") and v:FindFirstChild("_hitbox") then
        v.HumanoidRootPart.CFrame = x().HumanoidRootPart.CFrame * CFrame.new(0,0,-2) * CFrame.Angles(math.rad(0),-600,0)
                    end
                 end
              end
            end
        end)
     end
end)


------------ place anywhere

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
local unitsplace = require(game:GetService("ReplicatedStorage").src.client.Services.PlacementServiceClient)
unitsplace.can_place = true
end)
end)

------------ everything work with seahub macro
