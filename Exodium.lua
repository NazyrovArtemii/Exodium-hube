-- EXODIUM HUB
local P,R,T,U,W,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("TweenService"),game:GetService("UserInputService"),game:GetService("Workspace"),game:GetService("Lighting")
local LP=P.LocalPlayer
local pg=LP:WaitForChild("PlayerGui")
if pg:FindFirstChild("ExodiumHub")then pg.ExodiumHub:Destroy()end
if pg:FindFirstChild("ExodiumShot")then pg.ExodiumShot:Destroy()end

local function pc(f)pcall(f)end
local FLY_URL="https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"
local AIM_SPEED=100
local SHOT_DELAY=0.5

-- ========== МЕНЮ ==========
local sg=Instance.new("ScreenGui",pg)
sg.Name="ExodiumHub"sg.ResetOnSpawn=false sg.IgnoreGuiInset=true sg.DisplayOrder=100
local M=Instance.new("Frame",sg)
M.Size=UDim2.new(0,260,0,320)M.Position=UDim2.new(0,15,1,-335)
M.BackgroundColor3=Color3.fromRGB(12,10,20)M.BorderSizePixel=0 M.Active=true M.ClipsDescendants=true
Instance.new("UICorner",M).CornerRadius=UDim.new(0,14)
local ms=Instance.new("UIStroke",M)ms.Color=Color3.fromRGB(160,80,255)ms.Thickness=2 ms.Transparency=0.1

-- Радужная полоска сверху
local Top=Instance.new("Frame",M)Top.Size=UDim2.new(1,0,0,3)Top.BackgroundColor3=Color3.fromRGB(160,80,255)Top.BorderSizePixel=0
local TG=Instance.new("UIGradient",Top)
TG.Color=ColorSequence.new(Color3.fromRGB(160,80,255),Color3.fromRGB(255,80,200),Color3.fromRGB(160,80,255))

-- Заголовок с большой E
local Tt=Instance.new("TextButton",M)Tt.Size=UDim2.new(1,-80,0,36)Tt.BackgroundTransparency=1 Tt.Text=""Tt.TextXAlignment=Enum.TextXAlignment.Left
Instance.new("UIPadding",Tt).PaddingLeft=UDim.new(0,14)
-- Буква E
local E=Instance.new("TextLabel",M)
E.Size=UDim2.new(0,30,0,36)E.Position=UDim2.new(0,14,0,0)E.BackgroundTransparency=1
E.Text="E"E.TextColor3=Color3.fromRGB(200,120,255)E.Font=Enum.Font.GothamBlack E.TextSize=22
E.TextXAlignment=Enum.TextXAlignment.Left
-- Остальное название
local Name=Instance.new("TextLabel",M)
Name.Size=UDim2.new(0,150,0,36)Name.Position=UDim2.new(0,38,0,0)Name.BackgroundTransparency=1
Name.Text="XODIUM HUB"Name.TextColor3=Color3.fromRGB(220,180,255)Name.Font=Enum.Font.GothamBlack Name.TextSize=13
Name.TextXAlignment=Enum.TextXAlignment.Left

local Sub=Instance.new("TextLabel",M)Sub.Size=UDim2.new(0,220,0,11)Sub.Position=UDim2.new(0,14,0,25)Sub.BackgroundTransparency=1 Sub.Text="v1.0 • by Artemii"Sub.TextColor3=Color3.fromRGB(140,100,180)Sub.Font=Enum.Font.GothamBold Sub.TextSize=8 Sub.TextXAlignment=Enum.TextXAlignment.Left

local Mb=Instance.new("TextButton",M)Mb.Size=UDim2.new(0,22,0,22)Mb.Position=UDim2.new(1,-54,0,7)Mb.BackgroundColor3=Color3.fromRGB(25,20,35)Mb.Text="−"Mb.TextColor3=Color3.fromRGB(200,160,255)Mb.Font=Enum.Font.GothamBold Mb.TextSize=14 Mb.BorderSizePixel=0 Mb.AutoButtonColor=false
Instance.new("UICorner",Mb).CornerRadius=UDim.new(0,6)

local Xb=Instance.new("TextButton",M)Xb.Size=UDim2.new(0,22,0,22)Xb.Position=UDim2.new(1,-28,0,7)Xb.BackgroundColor3=Color3.fromRGB(50,20,30)Xb.Text="✕"Xb.TextColor3=Color3.fromRGB(255,120,140)Xb.Font=Enum.Font.GothamBold Xb.TextSize=12 Xb.BorderSizePixel=0 Xb.AutoButtonColor=false
Instance.new("UICorner",Xb).CornerRadius=UDim.new(0,6)

local Dv=Instance.new("Frame",M)Dv.Size=UDim2.new(1,-20,0,1)Dv.Position=UDim2.new(0,10,0,40)Dv.BackgroundColor3=Color3.fromRGB(60,40,90)Dv.BorderSizePixel=0

-- Переключение вкладок
local TabBar=Instance.new("Frame",M)
TabBar.Size=UDim2.new(1,-20,0,28)TabBar.Position=UDim2.new(0,10,0,44)TabBar.BackgroundTransparency=1
local TabLL=Instance.new("UIListLayout",TabBar)
TabLL.FillDirection=Enum.FillDirection.Horizontal
TabLL.Padding=UDim.new(0,3)
TabLL.SortOrder=Enum.SortOrder.LayoutOrder

-- Контент
local Content=Instance.new("ScrollingFrame",M)
Content.Size=UDim2.new(1,-20,1,-80)Content.Position=UDim2.new(0,10,0,76)
Content.BackgroundTransparency=1 Content.BorderSizePixel=0
Content.ScrollBarThickness=2 Content.ScrollBarImageColor3=Color3.fromRGB(160,80,255)
Content.CanvasSize=UDim2.new(0,0,0,0)Content.AutomaticCanvasSize=Enum.AutomaticSize.Y
Instance.new("UIPadding",Content).PaddingBottom=UDim.new(0,50)
local CLL=Instance.new("UIListLayout",Content)
CLL.Padding=UDim.new(0,4)
CLL.SortOrder=Enum.SortOrder.LayoutOrder

-- Перетаскивание
local dr=false
local ds,sp
Tt.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=true ds=i.Position sp=M.Position end end)
E.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=true ds=i.Position sp=M.Position end end)
Name.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=true ds=i.Position sp=M.Position end end)
U.InputChanged:Connect(function(i)if dr and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds M.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end end)
U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end end)

-- Сворачивание
local mn=false
Mb.MouseButton1Click:Connect(function()
	mn=not mn
	if mn then
		T:Create(M,TweenInfo.new(0.25),{Size=UDim2.new(0,260,0,40)}):Play()
		Mb.Text="+"TabBar.Visible=false Content.Visible=false Dv.Visible=false Sub.Visible=false-- ========== РОЛЬ ==========
local function getMM2Role(pl)
	if pl.Backpack:FindFirstChild("Knife") or (pl.Character and pl.Character:FindFirstChild("Knife")) then return "Murderer" end
	if pl.Backpack:FindFirstChild("Gun") or (pl.Character and pl.Character:FindFirstChild("Gun")) then return "Sheriff" end
	return "Innocent"
end
local function getMurderer()
	for _,pl in ipairs(P:GetPlayers())do
		if pl~=LP and getMM2Role(pl)=="Murderer" then return pl end
	end
	return nil
end
local function getSheriff()
	for _,pl in ipairs(P:GetPlayers())do
		if pl~=LP and getMM2Role(pl)=="Sheriff" then return pl end
	end
	return nil
end

-- ========== AIMBOT НА MURDERER ==========
local abA=false
local abC
local function sAB()
	if abA then return end
	abA=true
	abC=R.RenderStepped:Connect(function()
		local cam=W.CurrentCamera
		if not cam then return end
		local murderer=getMurderer()
		if not murderer or not murderer.Character then return end
		local head=murderer.Character:FindFirstChild("Head")
		if not head then return end
		local myChar=LP.Character
		if not myChar then return end
		local myHead=myChar:FindFirstChild("Head")
		if not myHead then return end
		local origin=myHead.Position
		local dir=head.Position-origin
		local params=RaycastParams.new()
		params.FilterType=Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances={myChar,murderer.Character}
		local res=W:Raycast(origin,dir,params)
		if res then return end
		local mp=cam.CFrame.Position
		cam.CFrame=CFrame.new(mp,head.Position)
	end)
end
local function eAB()abA=false if abC then abC:Disconnect()abC=nil end end

-- ========== AIMBOT НА SHERIFF ==========
local abSA=false
local abSC
local function sASh()
	if abSA then return end
	abSA=true
	abSC=R.RenderStepped:Connect(function()
		local cam=W.CurrentCamera
		if not cam then return end
		local sher=getSheriff()
		if not sher or not sher.Character then return end
		local head=sher.Character:FindFirstChild("Head")
		if not head then return end
		local mp=cam.CFrame.Position
		cam.CFrame=CFrame.new(mp,head.Position)
	end)
end
local function eASh()abSA=false if abSC then abSC:Disconnect()abSC=nil end end

-- ========== AIMBOT БЛИЖАЙШИЙ ==========
local abNA=false
local abNC
local function sAN()
	if abNA then return end
	abNA=true
	abNC=R.RenderStepped:Connect(function()
		local cam=W.CurrentCamera
		if not cam then return end
		local myPos=cam.CFrame.Position
		local lookVec=cam.CFrame.LookVector
		local closest,minDist=nil,math.huge
		for _,pl in ipairs(P:GetPlayers())do
			if pl~=LP and pl.Character then
				local t=pl.Character:FindFirstChild("Head")
				if t then
					local toTarget=t.Position-myPos
					local dist=toTarget.Magnitude
					if dist<=200 then
						local dot=lookVec:Dot(toTarget.Unit)
						if dot>=math.cos(math.rad(50)) then
							if dist<minDist then minDist=dist closest=t end
						end
					end
				end
			end
		end
		if closest then
			local mp=cam.CFrame.Position
			cam.CFrame=CFrame.new(mp,closest.Position)
		end
	end)
end
local function eAN()abNA=false if abNC then abNC:Disconnect()abNC=nil end end

-- ========== ESP ==========
local mm2Active=false
local mm2Conns={}
local mm2Data={}
local function applyMM2ESP(pl)
	if pl==LP then return end
	local function apply(char)
		if not mm2Active or not char then return end
		local hl=char:FindFirstChild("ExodiumESP")
		if not hl then
			hl=Instance.new("Highlight",char)
			hl.Name="ExodiumESP"
			hl.OutlineTransparency=1
			hl.FillTransparency=0.5
			hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
		end
		local role=getMM2Role(pl)
		if role=="Murderer" then hl.FillColor=Color3.fromRGB(255,0,0)
		elseif role=="Sheriff" then hl.FillColor=Color3.fromRGB(0,0,255)
		else hl.FillColor=Color3.fromRGB(0,255,0) end
		mm2Data[pl]=hl
	end
	if pl.Character then apply(pl.Character) end
	table.insert(mm2Conns,pl.CharacterAdded:Connect(function(c)task.wait(0.5)if mm2Active then apply(c)end end))
end
local function startMM2()
	if mm2Active then return end
	mm2Active=true
	for _,pl in ipairs(P:GetPlayers())do applyMM2ESP(pl)end
	table.insert(mm2Conns,P.PlayerAdded:Connect(function(pl)applyMM2ESP(pl)end))
	table.insert(mm2Conns,R.Heartbeat:Connect(function()
		if not mm2Active then return end
		for pl,hl in pairs(mm2Data)do
			if hl and hl.Parent and pl.Character then
				local role=getMM2Role(pl)
				if role=="Murderer" then hl.FillColor=Color3.fromRGB(255,0,0)
				elseif role=="Sheriff" then hl.FillColor=Color3.fromRGB(0,0,255)
				else hl.FillColor=Color3.fromRGB(0,255,0) end
			end
		end
	end))
end
local function stopMM2()
	mm2Active=false
	for _,hl in pairs(mm2Data)do if hl and hl.Parent then hl:Destroy()end end
	mm2Data={}
	for _,cn in ipairs(mm2Conns)do if cn then cn:Disconnect()end end
	mm2Conns={}
end

-- ========== ANTI-AIM ==========
local aaA=false
local aaC
local function sAA()
	if aaA then return end
	aaA=true
	aaC=R.Heartbeat:Connect(function()
		local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
		if r then r.CFrame=r.CFrame*CFrame.Angles(0,math.rad(AIM_SPEED),0)end
	end)
end
local function eAA()aaA=false if aaC then aaC:Disconnect()aaC=nil end end

-- ========== AUTO TP К ПИСТОЛЕТУ ==========
local atpA=false
local atpC
local function sATP()
	if atpA then return end
	atpA=true
	atpC=R.Heartbeat:Connect(function()
		local char=LP.Character
		if not char then return end
		local root=char:FindFirstChild("HumanoidRootPart")
		if not root then return end
		for _,obj in ipairs(W:GetDescendants())do
			if obj:IsA("Tool")then
				local n=obj.Name:lower()
				if n=="gun" or n=="revolver" or n=="pistol" then
					local handle=obj:FindFirstChild("Handle")
					if handle and handle.Parent then
						local parent=obj.Parent
						if parent and not parent:IsA("Backpack") and not parent:FindFirstChildOfClass("Humanoid") then
							root.CFrame=CFrame.new(handle.Position+Vector3.new(0,3,0))
							break
						end
					end
				end
			end
		end
	end)
end
local function eATP()atpA=false if atpC then atpC:Disconnect()atpC=nil end end

-- ========== AUTO TP К УБИЙЦЕ ==========
local atmA=false
local atmC
local function sATM()
	if atmA then return end
	atmA=true
	atmC=R.Heartbeat:Connect(function()
		local murderer=getMurderer()
		if not murderer or not murderer.Character then return end
		local mr=murderer.Character:FindFirstChild("HumanoidRootPart")
		local myRoot=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
		if mr and myRoot then myRoot.CFrame=CFrame.new(mr.Position+Vector3.new(0,0,3))end
	end)
end
local function eATM()atmA=false if atmC then atmC:Disconnect()atmC=nil end end

-- ========== AUTOSHOT ==========
local shotA=false
local shotGui=nil
local lastShot=0
local function makeShotButton()
	if shotGui then shotGui:Destroy()end
	shotGui=Instance.new("ScreenGui",pg)
	shotGui.Name="ExodiumShot"shotGui.ResetOnSpawn=false shotGui.IgnoreGuiInset=true shotGui.DisplayOrder=200
	local btn=Instance.new("TextButton",shotGui)
	btn.Size=UDim2.new(0,60,0,60)btn.Position=UDim2.new(0.85,0,0.7,0)
	btn.BackgroundColor3=Color3.fromRGB(20,15,30)btn.BorderSizePixel=0 btn.Text=""btn.AutoButtonColor=false
	Instance.new("UICorner",btn).CornerRadius=UDim.new(0,10)
	local stk=Instance.new("UIStroke",btn)stk.Color=Color3.fromRGB(160,80,255)stk.Thickness=2 stk.Transparency=0.2
	local ic=Instance.new("TextLabel",btn)ic.Size=UDim2.new(1,0,1,0)ic.BackgroundTransparency=1 ic.Text="🔫"ic.TextScaled=true ic.Font=Enum.Font.GothamBold
	local dg=false
	local ds2,sp2
	btn.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=true ds2=i.Position sp2=btn.Position end end)
	U.InputChanged:Connect(function(i)if dg and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds2 if math.abs(d.X)>5 or math.abs(d.Y)>5 then btn.Position=UDim2.new(sp2.X.Scale,sp2.X.Offset+d.X,sp2.Y.Scale,sp2.Y.Offset+d.Y)end end end)
	U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=false end end)
	btn.MouseButton1Click:Connect(function()
		if not shotA then return end
		local now=tick()
		if now-lastShot<SHOT_DELAY then return end
		lastShot=now
		T:Create(btn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(160,80,255)}):Play()
		task.wait(0.15)
		T:Create(btn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(20,15,30)}):Play()
		local murderer=getMurderer()
		if not murderer or not murderer.Character then return end
		local myChar=LP.Character
		if not myChar then return end
		local gun=myChar:FindFirstChild("Gun")
		if not gun then
			local bp=LP:FindFirstChild("Backpack")
			if bp then gun=bp:FindFirstChild("Gun")end
		end
		if gun then pc(function()gun:Activate()end)end
	end)
end
local function sShot()if shotA then return end shotA=true makeShotButton()end
local function eShot()shotA=false if shotGui then shotGui:Destroy()shotGui=nil end end

-- ========== BUNNY HOP ==========
local bhA=false
local bhC
local function sBH()
	if bhA then return end
	bhA=true
	bhC=R.Heartbeat:Connect(function()
		local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
		if h and h.FloorMaterial~=Enum.Material.Air then
			h:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
end
local function eBH()bhA=false if bhC then bhC:Disconnect()bhC=nil end end

-- ========== SPEED ==========
local spdA=false
local function sSpd()
	if spdA then return end spdA=true
	local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
	if h then h.WalkSpeed=60 end
end
local function eSpd()
	spdA=false
	local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
	if h then h.WalkSpeed=16 end
end

-- ========== JUMP ==========
local jmpA=false
local function sJmp()
	if jmpA then return end jmpA=true
	local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
	if h then h.UseJumpPower=true h.JumpPower=120 end
end
local function eJmp()
	jmpA=false
	local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
	if h then h.JumpPower=50 end
end

-- ========== NOCLIP ==========
local ncA=false
local ncC
local function sNc()
	if ncA then return end ncA=true
	ncC=R.Stepped:Connect(function()
		local c=LP.Character
		if c then
			for _,o in ipairs(c:GetDescendants())do
				if o:IsA("BasePart")then o.CanCollide=false end
			end
		end
	end)
end
local function eNc()ncA=false if ncC then ncC:Disconnect()ncC=nil end end

-- ========== FLY (внешний) ==========
local function sFl()
	pc(function()loadstring(game:HttpGet(FLY_URL))()end)
end

-- ========== INFINITE JUMP ==========
local ijA=false
local ijC
local function sIJ()
	if ijA then return end ijA=true
	ijC=U.JumpRequest:Connect(function()
		local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
		if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end
	end)
end
local function eIJ()ijA=false if ijC then ijC:Disconnect()ijC=nil end end

-- ========== GLOW ==========
local glowA=false
local glowH
local function sGlow()
	if glowA then return end glowA=true
	local c=LP.Character
	if not c then return end
	glowH=Instance.new("Highlight",c)
	glowH.FillColor=Color3.fromRGB(160,80,255)
	glowH.OutlineTransparency=1
	glowH.FillTransparency=0.7
	glowH.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
end
local function eGlow()glowA=false if glowH then glowH:Destroy()glowH=nil end end

-- ========== FULLBRIGHT ==========
local fbA=false
local function sFb()
	if fbA then return end fbA=true
	pc(function()L.GlobalShadows=false L.FogEnd=1e6 L.FogStart=1e6 end)
end
local function eFb()fbA=false pc(function()L.GlobalShadows=true L.FogEnd=500 end)end

-- ========== INVISIBLE ==========
local nsA=false
local nsC
local function sNs()
	if nsA then return end nsA=true
	nsC=R.Stepped:Connect(function()
		local c=LP.Character
		if c then
			for _,o in ipairs(c:GetDescendants())do
				if o:IsA("BasePart")then o.Transparency=1 end
			end
		end
	end)
end
local function eNs()
	nsA=false
	if nsC then nsC:Disconnect()nsC=nil end
	local c=LP.Character
	if c then
		for _,o in ipairs(c:GetDescendants())do
			if o:IsA("BasePart")then o.Transparency=0 end
		end
	end
end

-- ========== TELEPORT UP ==========
local function sTp()
	local c=LP.Character
	local r=c and c:FindFirstChild("HumanoidRootPart")
	if r then r.CFrame=r.CFrame+Vector3.new(0,50,0)end
end

-- ========== SHADOWS OFF ==========
local shA=false
local shData={}
local function sSh()
	if shA then return end shA=true
	pc(function()L.GlobalShadows=false end)
	for _,o in ipairs(W:GetDescendants())do
		if o:IsA("BasePart")and o.CastShadow then shData[o]=true o.CastShadow=false end
	end
end
local function eSh()
	shA=false
	pc(function()L.GlobalShadows=true end)
	for o in pairs(shData)do if o.Parent then o.CastShadow=true end end
	shData={}
end

-- ========== PARTICLES OFF ==========
local paA=false
local paData={}
local function sPa()
	if paA then return end paA=true
	for _,o in ipairs(W:GetDescendants())do
		if o:IsA("ParticleEmitter")then paData[o]={r=o.Rate}o.Rate=0
		elseif o:IsA("Trail")or o:IsA("Beam")then paData[o]={e=o.Enabled}o.Enabled=false end
	end
end
local function ePa()
	paA=false
	for o,d in pairs(paData)do
		if o.Parent then
			if d.r then o.Rate=d.r end
			if d.e~=nil then o.Enabled=d.e end
		end
	end
	paData={}
      end
	else
		T:Create(M,TweenInfo.new(0.25),{Size=UDim2.new(0,260,0,320)}):Play()
		Mb.Text="−"task.wait(0.15)
		TabBar.Visible=true Content.Visible=true Dv.Visible=true Sub.Visible=true
	end
end)
Mb.MouseEnter:Connect(function()T:Create(Mb,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(50,35,70)}):Play()end)
Mb.MouseLeave:Connect(function()T:Create(Mb,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(25,20,35)}):Play()end)

-- Удаление-- ========== ХЕЛПЕРЫ UI ==========
local currentTab = 1
local tabs = {}

local function mkToggle(txt,ord,on,off,parent)
	local b=Instance.new("TextButton",parent)
	b.Size=UDim2.new(1,0,0,26)
	b.BackgroundColor3=Color3.fromRGB(22,18,32)
	b.TextColor3=Color3.fromRGB(210,200,230)
	b.Font=Enum.Font.Gotham b.TextSize=10 b.Text="○ "..txt
	b.BorderSizePixel=0 b.AutoButtonColor=false b.LayoutOrder=ord
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,7)
	local st=Instance.new("UIStroke",b)
	st.Color=Color3.fromRGB(60,45,85)st.Thickness=1 st.Transparency=0.5
	local s=false
	local function up()
		if s then
			b.BackgroundColor3=Color3.fromRGB(50,25,80)
			b.TextColor3=Color3.fromRGB(200,130,255)
			st.Color=Color3.fromRGB(160,80,255)st.Transparency=0
			b.Text="● "..txt
		else
			b.BackgroundColor3=Color3.fromRGB(22,18,32)
			b.TextColor3=Color3.fromRGB(210,200,230)
			st.Color=Color3.fromRGB(60,45,85)st.Transparency=0.5
			b.Text="○ "..txt
		end
	end
	b.MouseEnter:Connect(function()if not s then T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(35,28,50)}):Play()end end)
	b.MouseLeave:Connect(function()if not s then T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(22,18,32)}):Play()end end)
	b.MouseButton1Click:Connect(function()
		s=not s
		if s then pc(on)else pc(off)end
		up()
	end)
end

local function mkBtn(txt,ord,act,parent)
	local b=Instance.new("TextButton",parent)
	b.Size=UDim2.new(1,0,0,26)
	b.BackgroundColor3=Color3.fromRGB(22,18,32)
	b.TextColor3=Color3.fromRGB(210,200,230)
	b.Font=Enum.Font.Gotham b.TextSize=10 b.Text="◈ "..txt
	b.BorderSizePixel=0 b.AutoButtonColor=false b.LayoutOrder=ord
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,7)
	local st=Instance.new("UIStroke",b)
	st.Color=Color3.fromRGB(60,45,85)st.Thickness=1 st.Transparency=0.5
	b.MouseEnter:Connect(function()T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(35,28,50)}):Play()end)
	b.MouseLeave:Connect(function()T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(22,18,32)}):Play()end)
	b.MouseButton1Click:Connect(function()
		T:Create(b,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(80,40,120),TextColor3=Color3.fromRGB(220,180,255)}):Play()
		task.wait(0.15)
		T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(22,18,32),TextColor3=Color3.fromRGB(210,200,230)}):Play()
		pc(act)
	end)
end

local function mkSec(txt,ord,c,parent)
	local l=Instance.new("TextLabel",parent)
	l.Size=UDim2.new(1,0,0,16)
	l.BackgroundTransparency=1 l.Text="▬ "..txt
	l.TextColor3=c l.Font=Enum.Font.GothamBold l.TextSize=9
	l.TextXAlignment=Enum.TextXAlignment.Left l.LayoutOrder=ord
end

-- Создание вкладки-контента
local function makeTabContent()
	local c=Instance.new("ScrollingFrame",M)
	c.Size=UDim2.new(1,-20,1,-80)
	c.Position=UDim2.new(0,10,0,76)
	c.BackgroundTransparency=1 c.BorderSizePixel=0
	c.ScrollBarThickness=2 c.ScrollBarImageColor3=Color3.fromRGB(160,80,255)
	c.CanvasSize=UDim2.new(0,0,0,0)c.AutomaticCanvasSize=Enum.AutomaticSize.Y
	Instance.new("UIPadding",c).PaddingBottom=UDim.new(0,50)
	local ll=Instance.new("UIListLayout",c)
	ll.Padding=UDim.new(0,4)
	ll.SortOrder=Enum.SortOrder.LayoutOrder
	c.Visible=false
	return c
end

-- ========== СОЗДАНИЕ 5 ВКЛАДОК ==========
local TAB_NAMES = {"ГЛАВНОЕ","AIMBOT","AUTO","ДВИЖЕНИЕ","ВИЗУАЛЫ"}
local tabBtns = {}
local tabContents = {}

local function switchTab(idx)
	for i=1,#tabContents do
		tabContents[i].Visible = (i==idx)
		if tabBtns[i] then
			if i==idx then
				tabBtns[i].BackgroundColor3 = Color3.fromRGB(50,25,80)
				tabBtns[i].TextColor3 = Color3.fromRGB(200,130,255)
			else
				tabBtns[i].BackgroundColor3 = Color3.fromRGB(22,18,32)
				tabBtns[i].TextColor3 = Color3.fromRGB(150,130,180)
			end
		end
	end
	currentTab = idx
end

for i, name in ipairs(TAB_NAMES) do
	local b = Instance.new("TextButton",TabBar)
	b.Size = UDim2.new(0, 46, 0, 26)
	b.BackgroundColor3 = Color3.fromRGB(22,18,32)
	b.TextColor3 = Color3.fromRGB(150,130,180)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 8
	b.Text = name
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.LayoutOrder = i
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,6)
	local st = Instance.new("UIStroke",b)
	st.Color = Color3.fromRGB(60,45,85)
	st.Thickness = 1
	st.Transparency = 0.5
	b.MouseButton1Click:Connect(function() switchTab(i) end)
	b.MouseEnter:Connect(function()
		if currentTab ~= i then
			T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(35,28,50)}):Play()
		end
	end)
	b.MouseLeave:Connect(function()
		if currentTab ~= i then
			T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(22,18,32)}):Play()
		end
	end)
	tabBtns[i] = b
	tabContents[i] = makeTabContent()
end

-- ========== НАПОЛНЕНИЕ ВКЛАДОК ==========
-- Вкладка 1: ГЛАВНОЕ
local T1 = tabContents[1]
mkSec("ОСНОВНОЕ",1,Color3.fromRGB(200,130,255),T1)
mkToggle("MM2 ESP (роли)",2,startMM2,stopMM2,T1)
mkToggle("Anti-Aim 100",3,sAA,eAA,T1)
mkToggle("AutoShot",4,sShot,eShot,T1)
mkToggle("Auto TP к убийце",5,sATM,eATM,T1)

-- Вкладка 2: AIMBOT
local T2 = tabContents[2]
mkSec("AIMBOT",1,Color3.fromRGB(200,130,255),T2)
mkToggle("Aimbot на Murderer",2,sAB,eAB,T2)
mkToggle("Aimbot на Sheriff",3,sASh,eASh,T2)
mkToggle("Aimbot ближайший",4,sAN,eAN,T2)

-- Вкладка 3: AUTO
local T3 = tabContents[3]
mkSec("AUTO",1,Color3.fromRGB(200,130,255),T3)
mkToggle("Auto TP к пистолету",2,sATP,eATP,T3)
mkToggle("Auto TP к убийце",3,sATM,eATM,T3)

-- Вкладка 4: ДВИЖЕНИЕ
local T4 = tabContents[4]
mkSec("ДВИЖЕНИЕ",1,Color3.fromRGB(200,130,255),T4)
mkToggle("Скорость x4",2,sSpd,eSpd,T4)
mkToggle("Высокий прыжок",3,sJmp,eJmp,T4)
mkToggle("Noclip",4,sNc,eNc,T4)
mkBtn("Fly",5,sFl,T4)
mkToggle("BunnyHop",6,sBH,eBH,T4)
mkToggle("Беск. прыжок",7,sIJ,eIJ,T4)
mkBtn("Телепорт вверх",8,sTp,T4)

-- Вкладка 5: ВИЗУАЛЫ
local T5 = tabContents[5]
mkSec("ВИЗУАЛЫ",1,Color3.fromRGB(200,130,255),T5)
mkToggle("Свечение себя",2,sGlow,eGlow,T5)
mkToggle("Fullbright",3,sFb,eFb,T5)
mkToggle("Невидимость",4,sNs,eNs,T5)

-- Вкладка 6: ФПС (создаём дополнительный)
local T6 = makeTabContent()
tabContents[6] = T6
-- добавляем кнопку вкладки
local b6 = Instance.new("TextButton",TabBar)
b6.Size = UDim2.new(0, 46, 0, 26)
b6.BackgroundColor3 = Color3.fromRGB(22,18,32)
b6.TextColor3 = Color3.fromRGB(150,130,180)
b6.Font = Enum.Font.GothamBold
b6.TextSize = 8
b6.Text = "ФПС"
b6.BorderSizePixel = 0
b6.AutoButtonColor = false
b6.LayoutOrder = 6
Instance.new("UICorner",b6).CornerRadius = UDim.new(0,6)
local st6 = Instance.new("UIStroke",b6)
st6.Color = Color3.fromRGB(60,45,85)
st6.Thickness = 1
st6.Transparency = 0.5
b6.MouseButton1Click:Connect(function() switchTab(6) end)
tabBtns[6] = b6

mkSec("ФПС",1,Color3.fromRGB(200,130,255),T6)
mkToggle("Тени OFF",2,sSh,eSh,T6)
mkToggle("Частицы OFF",3,sPa,ePa,T6)

-- ========== СТАРТОВАЯ ВКЛАДКА ==========
switchTab(1)

print("✅ EXODIUM HUB загружено")
Xb.MouseButton1Click:Connect(function()sg:Destroy()end)
Xb.MouseEnter:Connect(function()T:Create(Xb,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(130,30,50)}):Play()end)
Xb.MouseLeave:Connect(function()T:Create(Xb,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(50,20,30)}):Play()end)
