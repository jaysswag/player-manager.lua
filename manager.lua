if not game:IsLoaded() then
	game.Loaded:Wait()
end

local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local mouse = lp:GetMouse()
local ws = game:GetService("Workspace")
local cg = game:GetService("CoreGui")
local rs = game:GetService("RunService")
local guiname = "uhiabgfudhfiuasdfnuiasf"
local currentplayer = lp
local shp = sethiddenproperty or set_hidden_property or sethiddenprop or set_hidden_prop
local flycf = false

local function gp(parent, name, className)
	local ret = nil
	if parent then
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				ret = v
			end
		end
	end
	return ret
end

local gui = gp(cg, guiname, "ScreenGui")
if gui then
	gui:Destroy()
end

gui = Instance.new("ScreenGui")
gui.Name = guiname
gui.ResetOnSpawn = false
gui.Parent = cg
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Enabled = false
gui.IgnoreGuiInset = true
local mainFrame = Instance.new("Frame")
mainFrame.Name = "mainFrame"
mainFrame.Parent = gui
mainFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0, 0, 1, -200)
mainFrame.Size = UDim2.new(1, 0, 0, 200)
local mf = Instance.new("Frame")
mf.Name = "mf"
mf.Parent = mainFrame
mf.BackgroundColor3 = mainFrame.BackgroundColor3
mf.BorderSizePixel = 0
mf.Position = UDim2.new(0, 0, 1, 0)
mf.Size = UDim2.new(1, 0, 1, 0)
local scriptName = Instance.new("TextLabel")
scriptName.Name = "scriptName"
scriptName.Parent = mainFrame
scriptName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptName.BackgroundTransparency = 1.000
scriptName.BorderSizePixel = 0
scriptName.Size = UDim2.new(1, 0, 0, 20)
scriptName.Font = Enum.Font.SourceSans
scriptName.Text = "player manager private"
scriptName.TextColor3 = Color3.fromRGB(181, 181, 181)
scriptName.TextSize = 20.000
scriptName.TextWrapped = true
local line = Instance.new("Frame")
line.Name = "line"
line.Parent = scriptName
line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line.BackgroundTransparency = 0.700
line.BorderSizePixel = 0
line.Position = UDim2.new(0, 5, 1, 0)
line.Size = UDim2.new(1, -10, 0, 1)
local showhide = Instance.new("TextButton")
showhide.Name = "showhide"
showhide.Parent = mainFrame
showhide.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
showhide.BorderSizePixel = 0
showhide.Position = UDim2.new(0.5, -25, 0, -30)
showhide.Size = UDim2.new(0, 50, 0, 30)
showhide.Font = Enum.Font.SourceSans
showhide.Text = "\\/"
showhide.TextColor3 = Color3.fromRGB(235, 235, 235)
showhide.TextSize = 20.000
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "scrollingFrame"
scrollingFrame.Parent = mainFrame
scrollingFrame.Active = true
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingFrame.BackgroundTransparency = 1.000
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ClipsDescendants = false
scrollingFrame.Position = UDim2.new(0, 5, 0, 30)
scrollingFrame.Size = UDim2.new(1, -10, 1, -35)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
local UIListLayout_2 = Instance.new("UIListLayout")
UIListLayout_2.Parent = scrollingFrame
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 10)

local sn = scriptName.Text
local function notify(msg)
	spawn(function()
		local msg1 = sn .. " - " .. msg
		scriptName.Text = msg1
		wait(3)
		if scriptName.Text == msg1 then
			scriptName.Text = sn
		end
	end)
end

local ancprt = nil
local function weldtp(part, cfr)
    if not (part and part.Parent and part:IsA("BasePart") and (not part.Anchored)) then
        return nil
    end
    if not (ancprt and ancprt.Parent and ancprt:IsA("BasePart") and ancprt.Anchored and ancprt:IsDescendantOf(ws)) then
		for i, v in pairs(ws:GetDescendants()) do
			if v and v.Parent and v:IsA("BasePart") and v.Anchored then
				ancprt = v
				break
			end
		end
	end
    if not ancprt then
        ancprt = Instance.new("Part", ws)
        ancprt.Anchored = true
        ancprt.Transparency = 1
        ancprt.CanCollide = false
    end
    local weld = Instance.new("Weld")
	weld.Part0 = part
	weld.C0 = cfr:Inverse()
	weld.Part1 = ancprt
	weld.C1 = ancprt.CFrame:Inverse()
	weld.Parent = ws
    rs.Stepped:Wait()
    pcall(function()
        weld:Destroy()
    end)
end

local function makeFrame(parent, text, color)
	local frame = Instance.new("Frame")
	frame.Name = "frame_" .. text
	frame.Parent = parent
	frame.BackgroundColor3 = color
	frame.Size = UDim2.new(0, 300, 0, 145)
	frame.BorderSizePixel = 0
	local framelabel = Instance.new("TextLabel")
	framelabel.Name = "framelabel"
	framelabel.Parent = frame
	framelabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	framelabel.BackgroundTransparency = 1.000
	framelabel.BorderSizePixel = 0
	framelabel.Size = UDim2.new(1, 0, 0, 20)
	framelabel.Font = Enum.Font.SourceSans
	framelabel.Text = text
	framelabel.TextColor3 = Color3.fromRGB(197, 197, 197)
	framelabel.TextSize = 14.000
	local line = Instance.new("Frame")
	line.Name = "line"
	line.Parent = framelabel
	line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	line.BackgroundTransparency = 0.700
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0, 5, 1, 0)
	line.Size = UDim2.new(1, -10, 0, 1)
	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Parent = frame
	ScrollingFrame.Active = true
	ScrollingFrame.Name = "ScrollingFrame"
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0, 5, 0, 25)
	ScrollingFrame.Size = UDim2.new(1, -5, 1, -30)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 7
	ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	return frame
end

showhide.MouseButton1Click:Connect(function()
	if showhide.Text == "/\\" then
		showhide.Text = "\\/"
		mainFrame:TweenPosition(UDim2.new(0, 0, 1, -200), "Out", "Elastic", 1)
	else
		showhide.Text = "/\\"
		mainFrame:TweenPosition(UDim2.new(0, 0, 1, -5), "Out", "Elastic", 1)
	end
end)

local playersframe = makeFrame(scrollingFrame, "Players", Color3.fromRGB(12, 59, 100))
local playercframe = makeFrame(playersframe, "playerscontrol", Color3.fromRGB(12, 59, 100))
playercframe.BorderSizePixel = 1.000
playercframe.BorderColor3 = Color3.fromRGB(27, 42, 53)
playercframe.Position = UDim2.new(0, 10, -1, -40)
playercframe.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
playercframe.Visible = true
local playerframef = makeFrame(playercframe, "friends", Color3.fromRGB(0, 150, 0))
playerframef.Position = UDim2.new(1, 10, 0, 5)

local function addbtn(parent, plr)
	local playerbutton = Instance.new("TextButton")
	playerbutton.Name = plr.Name
	playerbutton.Parent = parent
	if plr == lp then
		playerbutton.BackgroundColor3 = Color3.fromRGB(100, 200, 200)
	else
		playerbutton.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
	end
	playerbutton.BorderSizePixel = 0
	playerbutton.Size = UDim2.new(1, -10, 0, 20)
	playerbutton.Font = Enum.Font.SourceSans
	playerbutton.Text = plr.Name
	if plr.Name ~= plr.DisplayName then
		playerbutton.Text = playerbutton.Text .. " (" .. plr.DisplayName .. ")"
	end
	playerbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
	playerbutton.TextSize = 15.000
	playerbutton.MouseButton1Click:Connect(function()
		playercframe.framelabel.Text = "player: " .. playerbutton.Text
		currentplayer = plr
		playercframe.Visible = true
		playerframef.Visible = false
	end)
end

local playersScroll = playersframe.ScrollingFrame

for i, v in pairs(plrs:GetPlayers()) do
	addbtn(playersScroll, v)
end
plrs.PlayerAdded:Connect(function(plr)
	if gui and gui.Parent then
		addbtn(playersScroll, plr)
	end
end)
plrs.PlayerRemoving:Connect(function(plr)
	if gui and gui.Parent then
		local playerbutton = gp(playersScroll, plr.Name, "TextButton")
		if playerbutton then
			playerbutton:Destroy()
		end
		if plr == currentplayer then
			playercframe.Visible = false
		end
	end
end)
local hideplayerc = Instance.new("TextButton")
hideplayerc.Name = "addpositionbutton"
hideplayerc.Parent = playercframe.framelabel
hideplayerc.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
hideplayerc.BorderSizePixel = 0
hideplayerc.Position = UDim2.new(1, -17, 0, 2)
hideplayerc.Size = UDim2.new(0, 15, 0, 15)
hideplayerc.Font = Enum.Font.SourceSans
hideplayerc.Text = "X"
hideplayerc.TextColor3 = Color3.fromRGB(206, 206, 206)
hideplayerc.TextSize = 14.000
hideplayerc.MouseButton1Click:Connect(function()
	playercframe.Visible = false
end)
local function makeplrbutton(buttontext)
	local button = Instance.new("TextButton")
	button.Name = "plrButton"
	button.Parent = playercframe.ScrollingFrame
	button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, -10, 0, 20)
	button.Font = Enum.Font.SourceSans
	button.Text = buttontext
	button.TextColor3 = Color3.fromRGB(226, 226, 226)
	button.TextSize = 15.000
	return button
end
makeplrbutton("goto").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local tp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
		if tp then
			c1 = currentplayer.Character
			if c1 and c1.Parent then
				local to = gp(c1, "HumanoidRootPart", "BasePart") or gp(c1, "Head", "BasePart") or c1:FindFirstChildWhichIsA("BasePart")
				if to then
				    if flycf then
				        flycf = to.CFrame
				    else
					    weldtp(tp, to.CFrame)
					end
					notify("goto: " .. currentplayer.Name)
				else
					notify("no target part found")
				end
			else
				notify("target character not found")
			end
		else
			notify("no part found")
		end
	else
		notify("character not found")
	end
end)
makeplrbutton("view").MouseButton1Click:Connect(function()
	local c = currentplayer.Character
	if c and c.Parent then
		ws.CurrentCamera.CameraSubject = c:FindFirstChildOfClass("Humanoid") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart") or c
	else
		notify("character not found")
	end
end)

local cbringb = makeplrbutton("cbring")

local function attach(c1)
	local ret = false
	local c = lp.Character
	if c and c.Parent then
		local hrp = gp(c, "HumanoidRootPart", "BasePart")
		if hrp then
			local hum = c:FindFirstChildOfClass("Humanoid")
			if hum and (hum.Health ~= 0) then
				local tool = c:FindFirstChildOfClass("Tool")
				local bck = lp:FindFirstChildOfClass("Backpack")
				if not tool and bck then
					tool = bck:FindFirstChildOfClass("Tool")
				end
				if tool and tool.Parent then
					local handle = gp(tool, "Handle", "BasePart")
					if handle then
						if c1 and c1.Parent then
							local arm = gp(c1, "Left Arm", "BasePart") or gp(c1, "LeftUpperArm", "BasePart")
							if arm then
								local hum1 = c:FindFirstChildOfClass("Humanoid")
								if hum1 and (hum1.Health ~= 0) then
									local cfr = hrp.CFrame
									if tool.Parent == c then
										tool.Parent = bck
									end
									local nhum = hum:Clone()
									hum:Destroy()
									nhum.Parent = c
									nhum:EquipTool(tool)
									for i, v in pairs(c1:GetDescendants()) do
										if v and v.Parent and v:IsA("BasePart") then
											v.Massless = true
										end
									end
									while rs.Stepped:Wait() and c and c.Parent and hrp and hrp.Parent and tool and tool.Parent and handle and handle.Parent and c1 and c1.Parent and arm and arm.Parent and nhum and nhum.Parent and (tool.Parent ~= c1) do
										hrp.CFrame = arm.CFrame
									end
									if tool and tool.Parent and c1 and c1.Parent and (tool.Parent == c1) then
										ret = true
									end
								else
									notify("target humanoid not found")
								end
							else
								notify("arm not found")
							end
						else
							notify("target character not found")
						end
					else
						notify("handle not found")
					end
				else
					notify("tool not found")
				end
			else
				notify("humanoid not found")
			end
		else
			notify("humanoidrootpart not found")
		end
	else
		notify("character not found")
	end
	return ret
end
makeplrbutton("bring").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart")
		if hrp then
			local cfr = hrp.CFrame
			if attach(currentplayer.Character) then
				hrp.CFrame = cfr
				wait(0.5)
				if c and c.Parent and hrp and hrp.Parent then
					c:MoveTo(hrp.Position)
					rs.Stepped:Wait()
					hrp.CFrame = cfr
					notify("brought " .. currentplayer.Name)
				end
			end
		else
			notify("humanoidrootpart not found")
		end
	else
		notify("character not found")
	end
end)
makeplrbutton("kill").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart")
		if hrp then
			local cfr = hrp.CFrame
			if attach(currentplayer.Character) then
				hrp.CFrame = CFrame.new(9e9, 0, 9e9)
				local bv = Instance.new("BodyVelocity", hrp)
				bv.Velocity = Vector3.new(0, -9e9, 0)
				bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
				notify("tped " .. currentplayer.Name .. " to the void")
			end
		else
			notify("humanoidrootpart not found")
		end
	else
		notify("character not found")
	end
end)
makeplrbutton("attach").MouseButton1Click:Connect(function()
	if attach(currentplayer.Character) then
		notify("attached to " .. currentplayer.Name)
	end
end)

makeplrbutton("view friends").MouseButton1Click:Connect(function()
    playerframef.Visible = not playerframef.Visible
    if not playerframef.Visible then
        return
    end
    playerframef.framelabel.Text = "friends of: " .. currentplayer.Name
	local scroll = playerframef.ScrollingFrame
	for i, v in pairs(scroll:GetChildren()) do
	    if v and v.Parent and v:IsA("TextButton") then
	        v:Destroy()
	    end
	end
	for i, v in pairs(plrs:GetPlayers()) do
	    spawn(function()
	        if v and v.Parent and currentplayer:IsFriendsWith(v.UserId) then
	            addbtn(playerframef.ScrollingFrame, v)
	        end
	    end)
	end
end)

local function makeflingbutton(partname)
	makeplrbutton("fling (" .. partname .. ")").MouseButton1Click:Connect(function()
		local c = lp.Character
		if c and c.Parent then
			local hrp = gp(c, partname, "BasePart")
			if hrp then
				local c1 = currentplayer.Character
				if c1 and c1.Parent then
					local hrp1 = gp(c1, partname, "BasePart")
					if hrp1 then						
						c:BreakJoints()
						hrp.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.01, 0.01, 0.01, 0.01)
						for i, v in pairs(c:GetChildren()) do
							if (v ~= hrp) and v and v.Parent and v:IsA("BasePart") then
								v:Destroy()
							end
						end
						hrp.Transparency = 0.5
						while rs.Heartbeat:Wait() and c and c.Parent and hrp and hrp.Parent and c1 and c1.Parent and hrp1 and hrp1.Parent do
							local pos = {x=0, y=0, z=0}
							pos.x = hrp1.Position.X
							pos.y = hrp1.Position.Y
							pos.z = hrp1.Position.Z
							pos.x += hrp1.Velocity.X / 2
							pos.y += hrp1.Velocity.Y / 2
							pos.z += hrp1.Velocity.Z / 2
							local heightlock = ws.FallenPartsDestroyHeight + 5
							if pos.y < heightlock then
								pos.y = heightlock
							end
							hrp.CanCollide = false
							hrp.Position = Vector3.new(pos.x, pos.y, pos.z)
							hrp.Velocity = Vector3.new(0, 1000, 0)
							hrp.RotVelocity = Vector3.new(10000, 10000, 10000)
							ws.CurrentCamera.CameraSubject = hrp1
						end
						wait(0.1)
						ws.CurrentCamera.CameraSubject = (lp.Character and lp.Character.Parent and lp.Character:FindFirstChildOfClass("Humanoid")) or nil
					else
						notify("target part not found")
					end
				else
					notify("target character not found")
				end
			else
				notify("part not found")
			end
		else
			notify("character not found")
		end
	end)
end
makeflingbutton("Head")
makeflingbutton("HumanoidRootPart")
makeflingbutton("Torso")

local graphicsframe = makeFrame(scrollingFrame, "Graphics", Color3.fromRGB(84, 45, 162))
local function makegraphicsbutton(buttontext)
	local button = Instance.new("TextButton")
	button.Name = "removefog"
	button.Parent = graphicsframe.ScrollingFrame
	button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, -10, 0, 20)
	button.Font = Enum.Font.SourceSans
	button.Text = buttontext
	button.TextColor3 = Color3.fromRGB(226, 226, 226)
	button.TextSize = 15.000
	return button
end
local lig = game:GetService("Lighting")
makegraphicsbutton("remove fog").MouseButton1Click:Connect(function()
	lig.FogStart = 9e9
	lig.FogEnd = 9e9
end)
local function setupremove(button, classname)
	button.MouseButton1Click:Connect(function()
		for i, v in pairs(game:GetDescendants()) do
			if v:IsA(classname) then
				v:Destroy()
			end
		end
	end)
end
setupremove(makegraphicsbutton("remove atmosphere effects"), "Atmosphere")
setupremove(makegraphicsbutton("remove blur"), "BlurEffect")
setupremove(makegraphicsbutton("remove decals"), "Decal")
setupremove(makegraphicsbutton("default sky"), "Sky")
setupremove(makegraphicsbutton("remove sun rays"), "SunRaysEffect")
setupremove(makegraphicsbutton("remove particles"), "ParticleEmitter")
setupremove(makegraphicsbutton("remove color correction effects"), "ColorCorrectionEffect")

local cfly = nil
local fhrp = nil
local flyspeed = 1

local positionsframe = makeFrame(scrollingFrame, "Positions", Color3.fromRGB(162, 108, 42))
local addpositionbutton = Instance.new("TextButton")
addpositionbutton.Name = "addpositionbutton"
addpositionbutton.Parent = positionsframe.framelabel
addpositionbutton.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
addpositionbutton.BorderSizePixel = 0
addpositionbutton.Position = UDim2.new(1, -77, 0, 2)
addpositionbutton.Size = UDim2.new(0, 75, 1, -4)
addpositionbutton.Font = Enum.Font.SourceSans
addpositionbutton.Text = "+ add current"
addpositionbutton.TextColor3 = Color3.fromRGB(206, 206, 206)
addpositionbutton.TextSize = 14.000
addpositionbutton.MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
		if hrp then
			local cfr = hrp.CFrame
			local positionframe = Instance.new("Frame")
			local loadposbutton = Instance.new("TextButton")
			local removeposbutton = Instance.new("TextButton")
			local positionName = Instance.new("TextBox")
			positionframe.Name = "positionframe"
			positionframe.Parent = positionsframe.ScrollingFrame
			positionframe.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
			positionframe.BorderSizePixel = 0
			positionframe.Size = UDim2.new(1, -10, 0, 30)
			loadposbutton.Name = "loadposbutton"
			loadposbutton.Parent = positionframe
			loadposbutton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			loadposbutton.BorderSizePixel = 0
			loadposbutton.Position = UDim2.new(1, -70, 0, 5)
			loadposbutton.Size = UDim2.new(0, 40, 1, -10)
			loadposbutton.Font = Enum.Font.SourceSans
			loadposbutton.Text = "load"
			loadposbutton.TextColor3 = Color3.fromRGB(223, 223, 223)
			loadposbutton.TextSize = 16.000
			removeposbutton.Name = "removeposbutton"
			removeposbutton.Parent = positionframe
			removeposbutton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			removeposbutton.BorderSizePixel = 0
			removeposbutton.Position = UDim2.new(1, -25, 0, 5)
			removeposbutton.Size = UDim2.new(0, 20, 1, -10)
			removeposbutton.Font = Enum.Font.SourceSans
			removeposbutton.Text = "X"
			removeposbutton.TextColor3 = Color3.fromRGB(223, 223, 223)
			removeposbutton.TextSize = 16.000
			positionName.Name = "positionName"
			positionName.Parent = positionframe
			positionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			positionName.BackgroundTransparency = 1.000
			positionName.BorderSizePixel = 0
			positionName.Position = UDim2.new(0, 5, 0, 5)
			positionName.Size = UDim2.new(1, -80, 1, -10)
			positionName.Font = Enum.Font.SourceSans
			positionName.Text = "Position1"
			positionName.ClearTextOnFocus = false
			positionName.TextColor3 = Color3.fromRGB(0, 0, 0)
			positionName.TextSize = 25.000
			positionName.TextXAlignment = Enum.TextXAlignment.Left
			loadposbutton.MouseButton1Click:Connect(function()
				c = lp.Character
				if c and c.Parent then
					hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
					if hrp then
					    if flycf then
					        flycf = cfr
					    else
						    weldtp(hrp, cfr)
						end
					else
						notify("part not found")
					end
				else
					notify("character not found")
				end
			end)
			removeposbutton.MouseButton1Click:Connect(function()
				positionframe:Destroy()
			end)
		end
	end
end)

local charframe = makeFrame(scrollingFrame, "Character", Color3.fromRGB(99, 15, 15))
local function makecharbutton(buttontext)
	local button = Instance.new("TextButton")
	button.Name = "charButton"
	button.Parent = charframe.ScrollingFrame
	button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, -10, 0, 20)
	button.Font = Enum.Font.SourceSans
	button.Text = buttontext
	button.TextColor3 = Color3.fromRGB(226, 226, 226)
	button.TextSize = 15.000
	return button
end
local function respawnRequest()
    local ccfr = ws.CurrentCamera.CFrame
	local c = lp.Character
	local fc = Instance.new("Model")
	local nh = Instance.new("Humanoid", fc)
	lp.Character = fc
	local gh = nh:Clone()
	gh.Parent = fc
	nh:Destroy()
	gh.Health = 0
	gh:Destroy()
	fc:Destroy()
	lp.Character = c
	local con = nil
	local function confunc()
	    con:Disconnect()
	    ws.CurrentCamera.CFrame = ccfr
	end
	con = rs.RenderStepped:Connect(confunc)
end
local function reset(respawn)
	local c = lp.Character
	local partName, cfr, ccfr = nil, nil, nil
	if not (c and c.Parent) then
	    respawnRequest()
	    if not loopr then
	        notify("character not found, trying to respawn")
	    end
	else
    	local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
    	if part then
    	    partName = part.Name
        	cfr = part.CFrame
        	ccfr = ws.CurrentCamera.CFrame
    	    if respawn and (not loopr) then
        	    notify("respawning...")
        	end
        	if respawn and (plrs.RespawnTime > 0.5) then
        	    spawn(function()
                    while c and c.Parent do
                	    if part and part.Parent then
                	        cfr = part.CFrame
                	    end
                		ccfr = ws.CurrentCamera.CFrame
                		rs.Stepped:Wait()
                    end
        	    end)
        	    local spamrequest = true
                spawn(function()
                    while wait() and spamrequest and c and c.Parent do
                        respawnRequest()
                    end
                end)
                wait(0.5)
                spamrequest = false
                wait(plrs.RespawnTime - 0.5)
                part = nil
        	end
            if c and c.Parent then
                if respawn then
                    local hum = c:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:Destroy()
                    end
                end
                c:BreakJoints()
            end
    	else
    	    respawnRequest()
    	    if not loopr then
    	        notify("no part found in the character, trying to respawn")
    	    end
        end
	end
	while c and c.Parent do
	    rs.Stepped:Wait()
	end
	while not (c and c.Parent) do
	    rs.Stepped:Wait()
		c = lp.Character
	end
	local part = nil
	while rs.Stepped:Wait() and c and c.Parent and (not part) do
	    part = gp(c, partName, "BasePart")
	end
	if not part then
	    if not loopr then
	        notify("failed to tp back")
	    end
	    return
	end
	weldtp(part, cfr)
	ws.CurrentCamera.CFrame = ccfr
	if not loopr then
	    notify("respawned")
	end
end
makecharbutton("respawn").MouseButton1Click:Connect(function()
    if not loopr then
        reset(true)
    end
end)
makecharbutton("reset").MouseButton1Click:Connect(function()
    reset(false)
end)
local looprb = makecharbutton("loop respawn")
local loopr = false
spawn(function()
	while wait() and gui and gui.Parent do
	    if loopr then
	        reset(true)
	    end
	end
end)
looprb.MouseButton1Click:Connect(function()
	loopr = not loopr
	looprb.Text = "loop respawn" .. ((loopr and " (Enabled)") or "")
end)
makecharbutton("remove meshes").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		for i, v in pairs(c:GetDescendants()) do
			if v and v.Parent and (v:IsA("Mesh") or v:IsA("SpecialMesh") or v:IsA("CharacterMesh")) then
				v:Destroy()
			end
		end
		notify("removed meshes")
	else
		notify("no character")
	end
end)
makecharbutton("break joints").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		c:BreakJoints()
		notify("broken joints")
	else
		notify("no character")
	end
end)
local noclipb = makecharbutton("noclip")
local noclipOb = makecharbutton("anti fling")
local noclip = false
local noclipO = false
noclipb.MouseButton1Click:Connect(function()
	noclip = not noclip
	noclipb.Text = "noclip" .. ((noclip and " (Enabled)") or "")
end)
noclipOb.MouseButton1Click:Connect(function()
	noclipO = not noclipO
	noclipOb.Text = "anti fling" .. ((noclipO and " (Enabled)") or "")
end)
makecharbutton("block tool").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local tool = c:FindFirstChildOfClass("Tool")
		if tool then
			local found = false
			for i, v in pairs(tool:GetDescendants()) do
				if v and v.Parent and v:IsA("Mesh") or v:IsA("SpecialMesh") then
					v:Destroy()
				end
			end
			if found then
				notify("removed tool meshes")
			else
				notify("no meshes found")
			end
		else
			notify("tool not found")
		end
	else
		notify("no character")
	end
end)
local infjumpb = makecharbutton("infjump")
local infjump = false
game:GetService("UserInputService").JumpRequest:Connect(function()
	if gui and gui.Parent and infjump then
		local c = lp.Character
		if c and c.Parent then
			local hum = c:FindFirstChildOfClass("Humanoid")
			if hum then
				hum:ChangeState("Jumping")
			end
		end
	end
end)
infjumpb.MouseButton1Click:Connect(function()
	infjump = not infjump
	infjumpb.Text = "infjump" .. ((infjump and " (Enabled)") or "")
end)
makecharbutton("god (remove humanoid)").MouseButton1Click:Connect(function()
	local c = lp.Character
    if c and c.Parent then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Archivable = true
            local hum1 = hum:Clone()
            hum:Destroy()
            hum1.Parent = c
			notify("humanoid client sided")
        else
            notify("humanoid not found")
        end
    else
        notify("character not found")
    end
end)
local loopgb = makecharbutton("loop god mode")
local loopg = false
spawn(function()
	while wait() and gui and gui.Parent do
	    if loopg then
    		local c = lp.Character
    		if c and c.Parent then
    			local hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
    			if hrp and hrp:IsA("Part") then
    				local hum = c:FindFirstChildOfClass("Humanoid")
    				if hum then
    					local new = hum:Clone()
    					hum:Destroy()
    					new.Parent = c
    					ws.CurrentCamera.CameraSubject = c
    				end
    				local currentcfr = hrp.CFrame
    				local camcfr = ws.CurrentCamera.CFrame
    				while wait() and c and c.Parent and hrp and hrp.Parent do
    					currentcfr = hrp.CFrame
    					camcfr = ws.CurrentCamera.CFrame
    					local ff = c:FindFirstChildOfClass("ForceField")
    					if ff then
    						ff:Destroy()
    					end
    				end
    				while not (lp.Character and lp.Character.Parent) do
    					wait()
    				end
    				c = lp.Character
    				if c and c.Parent then
    					hrp = c:WaitForChild("HumanoidRootPart", 1)
    					if hrp and hrp:IsA("Part") then
    						wait()
    						weldtp(hrp, currentcfr)
    						ws.CurrentCamera.CFrame = camcfr
    					end
    				end
    			end
    		end
    	end
	end
end)
loopgb.MouseButton1Click:Connect(function()
	loopg = not loopg
	loopgb.Text = "loop god mode" .. ((loopg and " (Enabled)") or "")
end)
local flyb = makecharbutton("fly")
flyb.MouseButton1Click:Connect(function()
	if cfly and cfly.Parent then
		cfly = nil
	else
		cfly = lp.Character
		flyb.Text = "fly (Enabled)"
	end
end)
spawn(function()
	local ctrlf = {
		["w"] = false,
		["a"] = false,
		["s"] = false,
		["d"] = false
	}
	mouse.KeyDown:Connect(function(key)
		key = key:lower()
		if ctrlf[key] ~= nil then
			ctrlf[key] = true
		end
	end)
	mouse.KeyUp:Connect(function(key)
		key = key:lower()
		if ctrlf[key] ~= nil then
			ctrlf[key] = false
		end
	end)
	while rs.Stepped:Wait() and gui and gui.Parent do
		if cfly and cfly.Parent then
			fhrp = (fhrp and (fhrp.Parent == cfly) and fhrp) or gp(cfly, "HumanoidRootPart", "BasePart") or gp(cfly, "Head", "BasePart") or cfly:FindFirstChildWhichIsA("BasePart")
			if fhrp then
				local fb = ((ctrlf["w"] and flyspeed) or 0) + ((ctrlf["s"] and -flyspeed) or 0)
				local lr = ((ctrlf["a"] and -flyspeed) or 0) + ((ctrlf["d"] and flyspeed) or 0)
				local camcf = ws.CurrentCamera.CFrame
				local caX, caY, caZ, ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8, ca9 = camcf:GetComponents()
				flycf = flycf or fhrp.CFrame
				flycf = CFrame.new(flycf.X, flycf.Y, flycf.Z, ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8, ca9)
				flycf += camcf.lookVector * fb
				flycf += camcf.rightVector * lr
				weldtp(fhrp, flycf)
			end
		else
			flycf = false
			fhrp = nil
			flyb.Text = "fly"
		end
	end
end)
local function noanimations()
	local c = lp.Character
    if c and c.Parent then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then
            local animate = gp(c, "Animate", "LocalScript")
			if animate then
				animate.Disabled = true
			end
			for i, v in pairs(hum:GetPlayingAnimationTracks()) do
				v:Stop()
			end
        else
            notify("humanoid not found")
        end
    else
        notify("character not found")
    end
end
local function hiddenfling()
    local c = lp.Character
    if not (c and c.Parent) then
        notify("character not found")
        return
    end
    local hrp = gp(c, "HumanoidRootPart", "BasePart")
    if not hrp then
        notify("part not found")
        return
    end
    noanimations()
    spawn(function()
        local vel = Vector3.new(0, 0, 0)
        while gui and gui.Parent do
            rs.Stepped:Wait()
            if hrp and hrp.Parent then
                hrp.Velocity = vel
            else
                break
            end
            rs.Heartbeat:Wait()
            if hrp and hrp.Parent then
                vel = hrp.Velocity
                hrp.Velocity = Vector3.new(20000, 20000, 20000)
            else
                break
            end
        end
    end)
end
makecharbutton("hidden fling").MouseButton1Click:Connect(hiddenfling)
makecharbutton("anti respawn (wait 5 s)").MouseButton1Click:Connect(respawnRequest)
makecharbutton("no animations").MouseButton1Click:Connect(noanimations)
makecharbutton("sit").MouseButton1Click:Connect(function()
	local c = lp.Character
    if c and c.Parent then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Sit = not hum.Sit
        else
            notify("humanoid not found")
        end
    else
        notify("character not found")
    end
end)
makecharbutton("remove humanoidroot").MouseButton1Click:Connect(function()
	local c = lp.Character
    if c then
        local cpar = c.Parent
        if cpar then
            local hrp = gp(c, "HumanoidRootPart", "BasePart")
			if hrp then
				c.Parent = nil
				hrp:Destroy()
				c.Parent = cpar
				notify("hrp removed")
			else
				notify("hrp not found")
			end
        else
            notify("character not found")
        end
    else
        notify("character not found")
    end
end)
makecharbutton("set CanTouch to false").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local tool = c:FindFirstChildOfClass("Tool")
		for i, v in pairs(c:GetDescendants()) do
		    if v and v.Parent and v:IsA("BasePart") and ((not tool) or (not v:IsDescendantOf(tool))) then
		        v.CanTouch = false
		    end
		end
		notify("CanTouch has been set to false")
	else
		notify("character not found")
	end
end)
makecharbutton("view").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		ws.CurrentCamera.CameraSubject = c:FindFirstChildOfClass("Humanoid") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsAWhichIsA("BasePart") or c
	else
		notify("character not found")
	end
end)

local utilframe = makeFrame(scrollingFrame, "Utilities", Color3.fromRGB(0, 150, 150))
local utilscroll = utilframe.ScrollingFrame

local function makeutilbutton(buttontext)
	local button = Instance.new("TextButton")
	button.Name = "utilButton"
	button.Parent = utilscroll
	button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, -10, 0, 20)
	button.Font = Enum.Font.SourceSans
	button.Text = buttontext
	button.TextColor3 = Color3.fromRGB(226, 226, 226)
	button.TextSize = 15.000
	return button
end

local netb = makeutilbutton("net bypass")
local net = false
netb.MouseButton1Click:Connect(function()
	if net then
		net = false
	else
		net = shp and function(Radius) 
			shp(lp, "SimulationRadius", Radius) 
		end
		net = net or setsimulationradius or setsimradius or set_simulation_radius
		if net then
		    pcall(function()
		        shp(lp, "MaximumSimulationRadius", 9e9)
		    end)
		else
			notify("exploit not supported")
		end
	end
	netb.Text = "net bypass" .. ((net and " (Enabled)") or "")
end)

local espb = makeutilbutton("esp")
local esp = false
espb.MouseButton1Click:Connect(function()
    esp = not esp
    espb.Text = "esp" .. ((esp and " (Enabled)") or "")
end)
local vpf = Instance.new("ViewportFrame", gui)
vpf.BackgroundTransparency = 1
vpf.BorderSizePixel = 0
vpf.ImageTransparency = 0.5
vpf.ImageColor3 = Color3.fromRGB(255, 0, 0)
vpf.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
vpf.Size = UDim2.new(1, 0, 1, 0)
vpf.Visible = true
vpf.Name = "esp"

spawn(function()
    while wait() and gui and gui.Parent do
        vpf.CurrentCamera = ws.CurrentCamera
        for i, v in pairs(vpf:GetChildren()) do
            if v and v.Parent then
                v:Destroy()
            end
        end
        if net then
			net(9e9)
		end
        if esp then
            for i, plr in pairs(plrs:GetPlayers()) do
                if plr and (plr ~= lp) and plr.Parent and ( (not teamCheck) or (plr.Team ~= lp.Team) ) then
                    local c = plr.Character
                    if c and c.Parent then
                        for i, part in pairs(c:GetDescendants()) do
                            if part and part.Parent and part:IsA("BasePart") then
                                local part1 = Instance.new("Part", vpf)
                                part1.Size = part.Size
                                part1.Anchored = true
                                part1.CanCollide = false
                                part1.Transparency = 0
                                part1.CFrame = part.CFrame
                                part1.Color = Color3.new(1, 0, 0)
                                part1.CastShadow = false
                                part1.Name = part1.ClassName
                            end
                        end
                    end
                end
            end
        end
    end
end)

makeutilbutton("rejoin").MouseButton1Click:Connect(function()
    if #plrs:GetPlayers() == 1 then
        lp:Kick()
        wait()
        game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
    else
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
    end
end)

makeutilbutton("serverhop").MouseButton1Click:Connect(function()
    local servers = nil
    pcall(function()
        servers = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    end)
    if type(servers) ~= "table" then
        notify("error getting server list")
        return
    end
    local jobIds = {}
    for i, v in pairs(servers) do
    	if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
    		table.insert(jobIds, v.id)
    	end
    end
    if #jobIds > 0 then
    	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobIds[math.random(1, #jobIds)])
    else
    	notify("no server found")
    end
end)

local cbringframe = makeFrame(scrollingFrame, "cbring", Color3.fromRGB(15, 100, 15))
local cbringscroll = cbringframe.ScrollingFrame

local cbring = {}

local togglecbring = nil

local function makecbringframe(name)
    local plrcbringf = Instance.new("Frame")
	local uncbringbtn = Instance.new("TextButton")
	local cbringplrname = Instance.new("TextBox")
	plrcbringf.Name = name
	plrcbringf.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
	plrcbringf.BorderSizePixel = 0
	plrcbringf.Size = UDim2.new(1, -10, 0, 30)
	plrcbringf.Parent = cbringscroll
	uncbringbtn.Name = "removeposbutton"
	uncbringbtn.Parent = plrcbringf
	uncbringbtn.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	uncbringbtn.BorderSizePixel = 0
	uncbringbtn.Position = UDim2.new(1, -25, 0, 5)
	uncbringbtn.Size = UDim2.new(0, 20, 1, -10)
	uncbringbtn.Font = Enum.Font.SourceSans
	uncbringbtn.Text = "X"
	uncbringbtn.TextColor3 = Color3.fromRGB(223, 223, 223)
	uncbringbtn.TextSize = 16.000
	cbringplrname.Parent = plrcbringf
	cbringplrname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	cbringplrname.BackgroundTransparency = 1.000
	cbringplrname.BorderSizePixel = 0
	cbringplrname.Position = UDim2.new(0, 5, 0, 5)
	cbringplrname.Size = UDim2.new(1, -80, 1, -10)
	cbringplrname.Font = Enum.Font.SourceSans
	cbringplrname.Text = name
	cbringplrname.TextColor3 = Color3.fromRGB(0, 0, 0)
	cbringplrname.TextSize = 25.000
	cbringplrname.TextXAlignment = Enum.TextXAlignment.Left
	uncbringbtn.MouseButton1Click:Connect(function()
	    togglecbring(name)
	end)
	return plrcbringf
end

togglecbring = function(name)
	local frame = gp(cbringscroll, name, "Frame")
	if frame then
	    pcall(function()
	        table.remove(cbring, table.find(cbring, name))
	    end)
	    frame:Destroy()
	    notify("removed " .. name .. " from cbring")
	else
	    table.insert(cbring, name)
	    makecbringframe(name)
	    notify("added " .. name .. " to cbring")
	end
end

cbringb.MouseButton1Click:Connect(function()
	togglecbring(currentplayer.Name)
end)

local cbringallbtn = Instance.new("TextButton")
cbringallbtn.Name = "cbringallbtn"
cbringallbtn.Parent = cbringframe.framelabel
cbringallbtn.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
cbringallbtn.BorderSizePixel = 0
cbringallbtn.Position = UDim2.new(1, -57, 0, 2)
cbringallbtn.Size = UDim2.new(0, 55, 1, -4)
cbringallbtn.Font = Enum.Font.SourceSans
cbringallbtn.Text = "+ add all"
cbringallbtn.TextColor3 = Color3.fromRGB(206, 206, 206)
cbringallbtn.TextSize = 14.000
cbringallbtn.MouseButton1Click:Connect(function()
    for i, v in pairs(plrs:GetPlayers()) do
        if (v ~= lp) and v and v.Parent and (not table.find(cbring, v.Name)) then
            togglecbring(v.Name)
        end
    end
end)

spawn(function()
    while gui and gui.Parent do
        local waited = false
        local lpc = lp.Character
        if lpc and lpc.Parent then
            local part0 = gp(lpc, "Torso", "BasePart") or gp(lpc, "HumanoidRootPart", "BasePart") or gp(lpc, "Head", "BasePart") or lpc:FindFirstChildWhichIsA("BasePart")
            if part0 then
        		for i, v in pairs(plrs:GetPlayers()) do
        			if v ~= lp then
        				local c = v.Character
        				if c and c.Parent then
        				    if table.find(cbring, v.Name) then
        				        local part1 = gp(c, part0.Name, "BasePart") or gp(c, "Torso", "BasePart") or gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
    				            if part1 then
    				                local p1cf = part0.CFrame
    				                waited = true
    				                weldtp(part1, p1cf + p1cf.LookVector * 2)
    				            end
        				    end
        				end
        			end
        		end
            end
        end
    	if not waited then
	        rs.Stepped:Wait()
	    end
	end
end)

spawn(function()
    while rs.Stepped:Wait() and gui and gui.Parent do
        local lpc = lp.Character
		if noclip and lpc and lpc.Parent then
			for i, v in pairs(lpc:GetDescendants()) do
				pcall(function()
					v.CanCollide = false
				end)
			end
		end
        if noclipO then
            for i, v in pairs(plrs:GetPlayers()) do
                if v ~= lp then
                    local c = v.Character
                    if c and c.Parent then
    					for i1, v1 in pairs(c:GetDescendants()) do
    						pcall(function()
    							v1.CanCollide = false
    							v1.Velocity = Vector3.new(0, 0, 0)
    							v1.RotVelocity = Vector3.new(0, 0, 0)
    						end)
    					end
                    end
                end
            end
        end
    end
end)

gui.Enabled = true
wait()
playercframe.Visible = false
