local O={}O.__index=O
local i,u,d,c,v=Instance.new,UDim2.new,UDim.new,Color3.fromRGB,Vector2.new
local t,cs,ck=TweenInfo.new,ColorSequence.new,ColorSequenceKeypoint.new
local ts,uis,rs=game:GetService("TweenService"),game:GetService("UserInputService"),game:GetService("RunService")
local cp,plrs,txtSvc,hs=game:GetService("ContentProvider"),game:GetService("Players"),game:GetService("TextService"),game:GetService("HttpService")
local lplr=plrs.LocalPlayer
local core=(gethui and gethui())or game:GetService("CoreGui")
local function gH()return hs:GenerateGUID(false):gsub("-","")end
local Clrs={
Background=c3(15,12,22),SecondaryBg=c3(10,8,15),SectionBg=c3(15,12,22),
Border=c3(120,40,220),Accent=c3(100,30,150),Text=c3(255,255,255),
TextInactive=c3(200,150,255),Disabled=c3(120,100,160),Hover=c3(50,20,80),
Button=c3(30,15,40),Slider=c3(150,40,255),ToggleOn=c3(150,40,255),
ToggleOff=c3(40,15,70),TabActive=c3(100,30,150),TabInactive=c3(40,15,70),
ControlButton=c3(30,15,45),CloseButton=c3(180,40,40)
}
local RGBC={c3(180,50,220),c3(150,50,200),c3(200,60,230),c3(170,40,210),c3(190,70,240),c3(160,30,190)}
local Thm={
black={Background=c3(8,8,8),SecondaryBg=c3(5,5,5),SectionBg=c3(10,10,10),Border=c3(60,60,60),Accent=c3(150,150,150),TextInactive=c3(150,150,150),Disabled=c3(40,40,40),Hover=c3(20,20,20),Button=c3(15,15,15),Slider=c3(200,200,200),ToggleOn=c3(200,200,200),ToggleOff=c3(30,30,30),TabActive=c3(150,150,150),TabInactive=c3(20,20,20),ControlButton=c3(25,25,25),Text=c3(255,255,255),RGB={c3(120,120,120),c3(100,100,100),c3(140,140,140),c3(90,90,90),c3(150,150,150),c3(110,110,110)}},
grey={Background=c3(35,35,40),SecondaryBg=c3(25,25,30),SectionBg=c3(35,35,40),Border=c3(120,120,130),Accent=c3(160,160,170),TextInactive=c3(180,180,190),Disabled=c3(80,80,90),Hover=c3(60,60,70),Button=c3(45,45,50),Slider=c3(180,180,190),ToggleOn=c3(180,180,190),ToggleOff=c3(50,50,60),TabActive=c3(140,140,150),TabInactive=c3(40,40,45),ControlButton=c3(50,50,55),Text=c3(255,255,255),RGB={c3(150,150,160),c3(130,130,140),c3(170,170,180),c3(110,110,120),c3(190,190,200),c3(140,140,150)}},
red={Background=c3(22,12,12),SecondaryBg=c3(15,8,8),SectionBg=c3(22,12,12),Border=c3(220,40,40),Accent=c3(180,30,30),TextInactive=c3(255,150,150),Disabled=c3(160,100,100),Hover=c3(80,20,20),Button=c3(40,15,15),Slider=c3(255,40,40),ToggleOn=c3(255,40,40),ToggleOff=c3(70,15,15),TabActive=c3(180,30,30),TabInactive=c3(70,15,15),ControlButton=c3(45,15,15),Text=c3(255,255,255),RGB={c3(220,50,50),c3(200,50,50),c3(230,60,60),c3(210,40,40),c3(240,70,70),c3(190,30,30)}},
blue={Background=c3(10,20,22),SecondaryBg=c3(5,12,15),SectionBg=c3(10,20,22),Border=c3(0,200,200),Accent=c3(0,180,180),TextInactive=c3(150,255,255),Disabled=c3(50,100,100),Hover=c3(15,60,60),Button=c3(10,30,30),Slider=c3(0,255,255),ToggleOn=c3(0,255,255),ToggleOff=c3(10,40,40),TabActive=c3(0,200,200),TabInactive=c3(10,40,40),ControlButton=c3(10,45,45),Text=c3(255,255,255),RGB={c3(0,255,255),c3(0,200,200),c3(50,255,255),c3(0,180,180),c3(100,255,255),c3(0,220,220)}},
green={Background=c3(10,22,10),SecondaryBg=c3(5,15,5),SectionBg=c3(10,22,10),Border=c3(0,200,0),Accent=c3(0,180,0),TextInactive=c3(150,255,150),Disabled=c3(50,100,50),Hover=c3(15,60,15),Button=c3(10,30,10),Slider=c3(0,255,0),ToggleOn=c3(0,255,0),ToggleOff=c3(10,40,10),TabActive=c3(0,200,0),TabInactive=c3(10,40,10),ControlButton=c3(10,45,10),Text=c3(255,255,255),RGB={c3(0,255,0),c3(0,200,0),c3(50,255,50),c3(0,180,0),c3(100,255,100),c3(0,220,0)}},
pink={Background=c3(22,10,16),SecondaryBg=c3(15,5,10),SectionBg=c3(22,10,16),Border=c3(255,20,147),Accent=c3(200,10,110),TextInactive=c3(255,150,200),Disabled=c3(120,50,80),Hover=c3(80,10,40),Button=c3(40,10,20),Slider=c3(255,20,147),ToggleOn=c3(255,20,147),ToggleOff=c3(50,10,25),TabActive=c3(200,10,110),TabInactive=c3(50,10,25),ControlButton=c3(45,15,25),Text=c3(255,255,255),RGB={c3(255,20,147),c3(230,10,120),c3(255,50,160),c3(200,0,100),c3(255,80,180),c3(220,15,130)}},
orange={Background=c3(22,12,10),SecondaryBg=c3(15,8,5),SectionBg=c3(22,12,10),Border=c3(255,69,0),Accent=c3(200,50,0),TextInactive=c3(255,180,150),Disabled=c3(120,60,40),Hover=c3(80,25,10),Button=c3(40,15,10),Slider=c3(255,69,0),ToggleOn=c3(255,69,0),ToggleOff=c3(50,15,10),TabActive=c3(200,50,0),TabInactive=c3(50,15,10),ControlButton=c3(45,20,15),Text=c3(255,255,255),RGB={c3(255,69,0),c3(230,50,0),c3(255,90,30),c3(200,40,0),c3(255,120,50),c3(220,60,0)}},
yellow={Background=c3(22,22,8),SecondaryBg=c3(15,15,5),SectionBg=c3(22,22,8),Border=c3(200,200,0),Accent=c3(180,180,0),TextInactive=c3(255,255,150),Disabled=c3(100,100,40),Hover=c3(80,80,10),Button=c3(40,40,10),Slider=c3(255,255,0),ToggleOn=c3(255,255,0),ToggleOff=c3(50,50,10),TabActive=c3(180,180,0),TabInactive=c3(50,50,10),ControlButton=c3(45,45,15),Text=c3(255,255,255),RGB={c3(255,255,0),c3(230,230,0),c3(255,255,50),c3(200,200,0),c3(255,255,100),c3(220,220,0)}}
}
local Fnts={Title=Enum.Font.SciFi,Normal=Enum.Font.Gotham,Tab=Enum.Font.Gotham,Button=Enum.Font.Gotham,Bold=Enum.Font.GothamBold}
local USz={Width=260,Height=280}
local ESz={TitleBar=30,TabHeight=32,ButtonHeight=32,SliderHeight=45,ToggleHeight=32,TextboxHeight=32,DropdownHeight=32,SectionSpacing=6}

local function pSA(...)
local id,sh,th
for _,arg in ipairs({...})do
local t=type(arg)
if t=="number" then
if arg==1 or arg==2 then sh=arg elseif arg>999 then id=arg end
elseif t=="string" then
local l=arg:lower()
if Thm[l] then th=l elseif tonumber(arg) then local n=tonumber(arg)if n==1 or n==2 then sh=n elseif n>999 then id=n end elseif arg:find("rbxassetid") or arg:find("rbxthumb") then id=arg end
end
end
return id,sh,th
end

function O:SendNotification(tiStr,txtStr,dur,...)
local ic,sh,thM=pSA(...)
dur=dur or 3
local nC=Clrs
if thM and Thm[thM] then
nC={}
for k,v in pairs(Clrs)do nC[k]=v end
for k,v in pairs(Thm[thM])do if k~="RGB" then nC[k]=v end end
end
local tG
for _,v in pairs(core:GetChildren())do if v:GetAttribute("OxNotif")then tG=v break end end
local pg=lplr:FindFirstChild("PlayerGui")
if not tG and pg then for _,v in pairs(pg:GetChildren())do if v:GetAttribute("OxNotif")then tG=v break end end end
if not tG then
tG=i("ScreenGui")
tG.Name=gH()
tG:SetAttribute("OxNotif",true)
tG.ResetOnSpawn=false
tG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
tG.DisplayOrder=101
pcall(function()tG.Parent=core end)
if not tG.Parent and pg then tG.Parent=pg end
end
local nCnt=tG:FindFirstChild("Container")
if not nCnt then
nCnt=i("Frame")
nCnt.Name="Container"
nCnt.Size=u(0,250,1,-50)
nCnt.Position=u(1,-270,0,20)
nCnt.BackgroundTransparency=1
local l=i("UIListLayout")
l.SortOrder=Enum.SortOrder.LayoutOrder
l.VerticalAlignment=Enum.VerticalAlignment.Bottom
l.Padding=d(0,10)
l.Parent=nCnt
nCnt.Parent=tG
end
task.spawn(function()
local img
if ic then
img=i("ImageLabel")
img.Size=u(0,30,0,30)
img.Position=u(0,10,0,12)
img.BackgroundTransparency=1
img.Image=tonumber(ic) and"rbxthumb://type=Asset&id="..ic.."&w=150&h=150" or ic
img.ImageTransparency=1
img.ScaleType=Enum.ScaleType.Fit
local ico=i("UICorner")
ico.CornerRadius=sh==2 and d(0,6) or d(1,0)
ico.Parent=img
task.spawn(function()pcall(function()cp:PreloadAsync({img})end)end)
end
local tOff=ic and 50 or 10
local bnds=txtSvc:GetTextSize(txtStr or"Message",12,Fnts.Normal,v2(250-tOff-15,9000))
local txtH=math.clamp(bnds.Y,20,400)
local fH=math.max(60,26+txtH+20)
local nFr=i("Frame")
nFr.Size=u(1,0,0,fH)
nFr.BackgroundColor3=c3(255,255,255)
nFr.BorderSizePixel=0
nFr.BackgroundTransparency=1
i("UICorner",nFr).CornerRadius=d(0,8)
local nGr=i("UIGradient")
nGr.Color=cs({ck(0,nC.Hover),ck(1,nC.Background)})
nGr.Rotation=90
nGr.Parent=nFr
local str=i("UIStroke")
str.Color=c3(255,255,255)
str.Thickness=1.5
str.Transparency=1
str.Parent=nFr
local stG=i("UIGradient")
stG.Color=cs({ck(0,nC.Accent),ck(1,nC.Border)})
stG.Rotation=45
stG.Parent=str
if img then img.Parent=nFr end
local tLbl=i("TextLabel")
tLbl.Size=u(1,-tOff-10,0,20)
tLbl.Position=u(0,tOff,0,6)
tLbl.BackgroundTransparency=1
tLbl.Text=tiStr or"Notification"
tLbl.TextColor3=nC.Text
tLbl.TextSize=14
tLbl.Font=Fnts.Bold
tLbl.TextXAlignment=Enum.TextXAlignment.Left
tLbl.TextTransparency=1
tLbl.TextScaled=true
tLbl.TextWrapped=true
local tC=i("UITextSizeConstraint")
tC.MaxTextSize=14
tC.MinTextSize=9
tC.Parent=tLbl
tLbl.Parent=nFr
local mLbl=i("TextLabel")
mLbl.Size=u(1,-tOff-10,0,txtH)
mLbl.Position=u(0,tOff,0,26)
mLbl.BackgroundTransparency=1
mLbl.Text=txtStr or"Message"
mLbl.TextColor3=nC.TextInactive
mLbl.TextSize=12
mLbl.Font=Fnts.Normal
mLbl.TextXAlignment=Enum.TextXAlignment.Left
mLbl.TextTransparency=1
mLbl.TextWrapped=true
mLbl.Parent=nFr
local bBg=i("Frame")
bBg.Size=u(1,-20,0,4)
bBg.Position=u(0,10,1,-10)
bBg.BackgroundColor3=nC.SecondaryBg
bBg.BorderSizePixel=0
bBg.BackgroundTransparency=1
i("UICorner",bBg).CornerRadius=d(1,0)
bBg.Parent=nFr
local bar=i("Frame")
bar.Size=u(1,0,1,0)
bar.BackgroundColor3=c3(255,255,255)
bar.BorderSizePixel=0
bar.BackgroundTransparency=1
i("UICorner",bar).CornerRadius=d(1,0)
local bG=i("UIGradient")
bG.Color=cs({ck(0,nC.Slider),ck(1,nC.Border)})
bG.Parent=bar
bar.Parent=bBg
nFr.Parent=nCnt
ts:Create(nFr,t(0.3),{BackgroundTransparency=0}):Play()
ts:Create(str,t(0.3),{Transparency=0}):Play()
ts:Create(tLbl,t(0.3),{TextTransparency=0}):Play()
ts:Create(mLbl,t(0.3),{TextTransparency=0}):Play()
ts:Create(bBg,t(0.3),{BackgroundTransparency=0.4}):Play()
ts:Create(bar,t(0.3),{BackgroundTransparency=0}):Play()
if img then ts:Create(img,t(0.3),{ImageTransparency=0}):Play() end
task.delay(0.3,function()ts:Create(bar,t(dur,Enum.EasingStyle.Linear),{Size=u(0,0,1,0)}):Play()end)
task.delay(dur+0.3,function()
ts:Create(nFr,t(0.3),{BackgroundTransparency=1}):Play()
ts:Create(str,t(0.3),{Transparency=1}):Play()
ts:Create(tLbl,t(0.3),{TextTransparency=1}):Play()
ts:Create(mLbl,t(0.3),{TextTransparency=1}):Play()
ts:Create(bBg,t(0.3),{BackgroundTransparency=1}):Play()
ts:Create(bar,t(0.3),{BackgroundTransparency=1}):Play()
if img then ts:Create(img,t(0.3),{ImageTransparency=1}):Play() end
task.wait(0.3)
nFr:Destroy()
end)
end)
end

function O.new()
local s=setmetatable({},O)
s.Windows={}
return s
end

function O:NewWindow(title,...)
local lg,sh,thM=pSA(...)
if thM and Thm[thM] then
local t=Thm[thM]
for k,v in pairs(t)do if k~="RGB" then Clrs[k]=v end end
if t.RGB then for i,v in ipairs(t.RGB)do RGBC[i]=v end end
end
for _,v in pairs(core:GetChildren())do if v:GetAttribute("OxMain")then v:Destroy() end end
local pg=lplr:FindFirstChild("PlayerGui")
if pg then for _,v in pairs(pg:GetChildren())do if v:GetAttribute("OxMain")then v:Destroy() end end end
local W={Title=title or"Oxireun UI",Sections={},CurrentSection=nil}
local sGui=i("ScreenGui")
sGui.Name=gH()
sGui:SetAttribute("OxMain",true)
sGui.ResetOnSpawn=false
sGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
sGui.DisplayOrder=10
local mFrm=i("Frame")
mFrm.Name="MainWindow"
mFrm.Size=u(0,USz.Width,0,USz.Height)
mFrm.Position=u(0,10,0.5,-USz.Height/2)
mFrm.BackgroundColor3=c3(255,255,255)
mFrm.BorderSizePixel=0
mFrm.ClipsDescendants=true
mFrm.Active=true
local mGr=i("UIGradient")
mGr.Color=cs({ck(0,Clrs.Background),ck(0.4,Clrs.Background),ck(0.5,Clrs.Accent),ck(0.6,Clrs.Background),ck(1,Clrs.Background)})
mGr.Rotation=45
mGr.Parent=mFrm
i("UICorner",mFrm).CornerRadius=d(0,8)
local rB=i("UIStroke")
rB.Name="RGBBorder"
rB.Color=RGBC[1]
rB.Thickness=2
rB.Transparency=0
rB.Parent=mFrm
local fLg,lBr
local actDrp={}
if lg then
fLg=i("ImageButton")
fLg.Name="FloatingLogo"
fLg.Size=u(0,46,0,46)
fLg.Position=u(0,20,0.5,-23)
fLg.BackgroundColor3=Clrs.Background
fLg.Visible=true
fLg.AutoButtonColor=false
fLg.ClipsDescendants=true
local lCr=i("UICorner")
lCr.CornerRadius=sh==2 and d(0,6) or d(1,0)
lCr.Parent=fLg
lBr=i("UIStroke")
lBr.Color=RGBC[1]
lBr.Thickness=2
lBr.Parent=fLg
local lImg=i("ImageLabel")
lImg.Size=u(1,0,1,0)
lImg.Position=u(0,0,0,0)
lImg.BackgroundTransparency=1
lImg.Image=tonumber(lg) and"rbxthumb://type=Asset&id="..lg.."&w=150&h=150" or lg
lImg.ScaleType=Enum.ScaleType.Fit
lImg.ClipsDescendants=true
local inC=i("UICorner")
inC.CornerRadius=sh==2 and d(0,6) or d(1,0)
inC.Parent=lImg
lImg.Parent=fLg
fLg.Parent=sGui
task.spawn(function()
local tI=i("ImageLabel")
tI.Image=lImg.Image
tI.Visible=false
tI.Parent=sGui
pcall(function()cp:PreloadAsync({tI})end)
tI:Destroy()
end)
local isOp=true
task.spawn(function()
task.wait()
if fLg and mFrm then
local lx,ly=fLg.AbsolutePosition.X,fLg.AbsolutePosition.Y
local lw,lh=fLg.AbsoluteSize.X,fLg.AbsoluteSize.Y
mFrm.Position=u(0,lx+lw+15,0,ly+(lh/2)-(USz.Height/2))
end
end)
local drL,dS,sPL=false,nil,nil
fLg.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
dragL=true
hasMovL=false
dS=input.Position
sPL=fLg.Position
local cn
cn=rs.Heartbeat:Connect(function()
if not dragL then return end
local dl=input.Position-dS
if dl.Magnitude>3 then hasMovL=true end
fLg.Position=u(sPL.X.Scale,sPL.X.Offset+dl.X,sPL.Y.Scale,sPL.Y.Offset+dl.Y)
end)
local eCn
eCn=uis.InputEnded:Connect(function(ie)
if ie.UserInputType==input.UserInputType then
dragL=false
if cn then cn:Disconnect() end
if eCn then eCn:Disconnect() end
end
end)
end
end)
fLg.MouseButton1Click:Connect(function()
if not hasMovL then
isOp=not isOp
mFrm.Visible=isOp
if not isOp then
for drop,_ in pairs(actDrp)do if drop and drop.Parent then drop:Destroy();actDrp[drop]=nil end end
end
end)
end
local cIdx=1
local rgbAnm
rgbAnm=rs.Heartbeat:Connect(function()
cIdx=cIdx+0.008
if cIdx>#RGBC then cIdx=1 end
local cC=RGBC[math.floor(cIdx)]
local nC=RGBC[math.floor(cIdx)%#RGBC+1]
local lF=cIdx-math.floor(cIdx)
rB.Color=cC:Lerp(nC,lF)
if lBr then lBr.Color=rB.Color end
local tT=tick()
mGr.Offset=v2(math.sin(tT*0.5)*0.7,math.cos(tT*0.5)*0.7)
end)
local tBar=i("Frame")
tBar.Name="TitleBar"
tBar.Size=u(1,0,0,ESz.TitleBar)
tBar.BackgroundColor3=Clrs.SecondaryBg
tBar.BackgroundTransparency=0.1
tBar.BorderSizePixel=0
tBar.Parent=mFrm
i("UICorner",tBar).CornerRadius=d(0,8,0,0)
local tLbl=i("TextLabel")
tLbl.Name="Title"
tLbl.Size=u(0.6,0,1,0)
tLbl.Position=u(0,8,0,0)
tLbl.BackgroundTransparency=1
tLbl.Text=W.Title
tLbl.TextColor3=Clrs.Text
tLbl.TextSize=14
tLbl.Font=Fnts.Bold
tLbl.TextXAlignment=Enum.TextXAlignment.Left
tLbl.TextScaled=true
tLbl.TextWrapped=true
local tConst=i("UITextSizeConstraint")
tConst.MaxTextSize=14
tConst.MinTextSize=8
tConst.Parent=tLbl
tLbl.Parent=tBar
local cntrl=i("Frame")
cntrl.Name="Controls"
cntrl.Size=u(0,40,1,0)
cntrl.Position=u(1,-45,0,0)
cntrl.BackgroundTransparency=1
cntrl.Parent=tBar
local function aS(p)
local s=i("UIStroke")
s.Color=Clrs.Border
s.Thickness=1
s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
s.Parent=p
return s
end
local function aSG(p)
local g=i("UIGradient")
g.Color=cs({ck(0,c3(255,255,255)),ck(1,c3(127,127,127))})
g.Rotation=90
g.Parent=p
return g
end
local minB=i("TextButton")
minB.Name="Minimize"
minB.Size=u(0,18,0,18)
minB.Position=u(0,0,0.5,-9)
minB.BackgroundColor3=Clrs.ControlButton
minB.Text="-"
minB.TextColor3=Clrs.TextInactive
minB.TextSize=16
minB.Font=Fnts.Bold
minB.AutoButtonColor=false
minB:SetAttribute("IsMinimized",false)
i("UICorner",minB).CornerRadius=d(1,0)
aS(minB)
minB.Parent=cntrl
if lg then minB.Visible=false end
local clsB=i("TextButton")
clsB.Name="Close"
clsB.Size=u(0,18,0,18)
clsB.Position=u(0,22,0.5,-9)
clsB.BackgroundColor3=Clrs.ControlButton
clsB.Text=">"
clsB.TextColor3=Clrs.TextInactive
clsB.TextSize=14
clsB.Font=Fnts.Bold
clsB.AutoButtonColor=false
i("UICorner",clsB).CornerRadius=d(1,0)
aS(clsB)
clsB.Parent=cntrl
local tSF=i("ScrollingFrame")
tSF.Name="TabsScroll"
tSF.Size=u(1,0,0,ESz.TabHeight)
tSF.Position=u(0,0,0,ESz.TitleBar+8)
tSF.BackgroundTransparency=1
tSF.BorderSizePixel=0
tSF.ScrollBarThickness=0
tSF.ScrollBarImageColor3=Clrs.Border
tSF.AutomaticCanvasSize=Enum.AutomaticSize.X
tSF.ScrollingDirection=Enum.ScrollingDirection.X
tSF.Parent=mFrm
local tCnt=i("Frame")
tCnt.Name="TabsContainer"
tCnt.Size=u(0,0,1,0)
tCnt.BackgroundTransparency=1
tCnt.Parent=tSF
local tPad=i("UIPadding")
tPad.PaddingLeft=d(0,8)
tPad.PaddingRight=d(0,4)
tPad.Parent=tCnt
local tLst=i("UIListLayout")
tLst.FillDirection=Enum.FillDirection.Horizontal
tLst.Padding=d(0,4)
tLst.SortOrder=Enum.SortOrder.LayoutOrder
tLst.VerticalAlignment=Enum.VerticalAlignment.Center
tLst.Parent=tCnt
local cArea=i("Frame")
cArea.Name="ContentArea"
cArea.Size=u(1,-16,1,-(ESz.TitleBar+ESz.TabHeight+20))
cArea.Position=u(0,8,0,ESz.TitleBar+ESz.TabHeight+12)
cArea.BackgroundColor3=Clrs.SecondaryBg
cArea.BackgroundTransparency=0.4
cArea.ClipsDescendants=true
cArea.Parent=mFrm
i("UICorner",cArea).CornerRadius=d(0,6)
local caS=i("UIStroke")
caS.Color=Clrs.Border
caS.Thickness=1
caS.Transparency=0.5
caS.Parent=cArea
function Window:SetFooter(...)
local txt,icn,shp="",nil,1
for _,arg in ipairs({...})do
local t=type(arg)
if t=="number" then if arg==1 or arg==2 then shp=arg elseif arg>999 then icn=arg end
elseif t=="string" then
if tonumber(arg) then local n=tonumber(arg)if n==1 or n==2 then shp=n elseif n>999 then icn=n end
elseif arg:find("rbxassetid") or arg:find("rbxthumb") then icn=arg else txt=arg end
end
end
if mFrm:FindFirstChild("FooterFrame")then mFrm.FooterFrame:Destroy()end
local fFrm=i("Frame")
fFrm.Name="FooterFrame"
fFrm.Size=u(1,-16,0,14)
fFrm.Position=u(0,8,1,-16)
fFrm.BackgroundTransparency=1
fFrm.Parent=mFrm
cArea.Size=u(1,-16,1,-(ESz.TitleBar+ESz.TabHeight+30))
local tOf=8
if icn then
tOf=20
local im=i("ImageLabel")
im.Size=u(0,12,0,12)
im.Position=u(0,4,0.5,-6)
im.BackgroundTransparency=1
im.Image=tonumber(icn) and"rbxthumb://type=Asset&id="..icn.."&w=150&h=150" or icn
im.ScaleType=Enum.ScaleType.Fit
im.ClipsDescendants=true
i("UICorner",im).CornerRadius=shp==2 and d(0,4) or d(1,0)
im.Parent=fFrm
task.spawn(function()pcall(function()cp:PreloadAsync({im})end)end)
end
local l=i("TextLabel")
l.Size=u(1,-tOf-4,1,0)
l.Position=u(0,tOf,0,0)
l.BackgroundTransparency=1
l.Text=txt or""
l.TextColor3=Clrs.TextInactive
l.TextSize=10
l.Font=Enum.Font.GothamMedium
l.TextXAlignment=Enum.TextXAlignment.Left
l.TextScaled=true
l.TextWrapped=true
local cn=i("UITextSizeConstraint")
cn.MaxTextSize=10
cn.MinTextSize=8
cn.Parent=l
l.Parent=fFrm
end
local function cEff(b)
local ef=i("Frame")
ef.Name="ClickEffect"
ef.Size=u(1,0,1,0)
ef.BackgroundColor3=Clrs.Accent
ef.BackgroundTransparency=0.7
ef.ZIndex=-1
local cr=b:FindFirstChildWhichIsA("UICorner")
i("UICorner",ef).CornerRadius=cr and cr.CornerRadius or d(0,6)
ef.Parent=b
ts:Create(ef,t(0.3),{BackgroundTransparency=1}):Play()
task.delay(0.3,function()ef:Destroy()end)
end
local function sBH(b,iC)
if iC then
b.MouseEnter:Connect(function()
b.BackgroundColor3=(b.Name=="Close")and Clrs.CloseButton or Clrs.Hover
b.TextColor3=Clrs.Text
end)
b.MouseLeave:Connect(function()
b.BackgroundColor3=Clrs.ControlButton
b.TextColor3=Clrs.TextInactive
end)
return
end
b.MouseEnter:Connect(function()ts:Create(b,t(0.2),{BackgroundColor3=Clrs.Hover}):Play()end)
b.MouseLeave:Connect(function()ts:Create(b,t(0.2),{BackgroundColor3=Clrs.Button}):Play()end)
end
sBH(clsB,true)
sBH(minB,true)
local drg,dS,sP=false,nil,nil
local function upd(input)
if not drg then return end
local dl=input.Position-dS
mFrm.Position=u(sP.X.Scale,sP.X.Offset+dl.X,sP.Y.Scale,sP.Y.Offset+dl.Y)
for drop,_ in pairs(actDrp)do if drop then drop.Position=u(0,mFrm.AbsolutePosition.X+mFrm.AbsoluteSize.X+10,0,mFrm.AbsolutePosition.Y+mFrm.AbsoluteSize.Y-drop.Size.Y.Offset)end end
end
tBar.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
drg=true
dS=input.Position
sP=mFrm.Position
if input.UserInputType==Enum.UserInputType.Touch then mFrm.Active=true end
local cn
cn=rs.Heartbeat:Connect(function()upd(input)end)
local function onIE(ie)
if ie.UserInputType==input.UserInputType then
drg=false
if cn then cn:Disconnect() end
end
end
uis.InputEnded:Connect(onIE)
end
end)
clsB.MouseButton1Click:Connect(function()
cEff(clsB)
if rgbAnm then rgbAnm:Disconnect() end
sGui:Destroy()
end)
minB.MouseButton1Click:Connect(function()
cEff(minB)
local iM=minB:GetAttribute("IsMinimized")
if not iM then
minB:SetAttribute("IsMinimized",true)
for drop,_ in pairs(actDrp)do if drop and drop.Parent then drop:Destroy();actDrp[drop]=nil end end
mFrm.Size=u(0,UI_SIZE.Width,0,ESz.TitleBar)
tSF.Visible=false
cArea.Visible=false
if mFrm:FindFirstChild("FooterFrame")then mFrm.FooterFrame.Visible=false end
else
minB:SetAttribute("IsMinimized",false)
mFrm.Size=u(0,UI_SIZE.Width,0,UI_SIZE.Height)
tSF.Visible=true
cArea.Visible=true
if mFrm:FindFirstChild("FooterFrame")then mFrm.FooterFrame.Visible=true end
end
end)
function Window:NewSection(n)
local S={Name=n}
local tBtn=i("TextButton")
tBtn.Name=n.."_Tab"
tBtn.Size=u(0,65,0,24)
tBtn.BackgroundColor3=Clrs.TabInactive
tBtn.Text=n
tBtn.TextColor3=Clrs.TextInactive
tBtn.TextSize=11
tBtn.Font=Fnts.Bold
tBtn.AutoButtonColor=false
tBtn.LayoutOrder=#W.Sections+1
tBtn.TextScaled=true
tBtn.TextWrapped=true
local tC=i("UITextSizeConstraint")
tC.MaxTextSize=11
tC.MinTextSize=7
tC.Parent=tBtn
i("UICorner",tBtn).CornerRadius=d(0,5)
aS(tBtn)
aSG(tBtn)
tBtn.Parent=tCnt
tBtn.MouseEnter:Connect(function()if W.CurrentSection~=S then ts:Create(tBtn,t(0.2),{BackgroundColor3=Clrs.Hover}):Play()end end)
tBtn.MouseLeave:Connect(function()if W.CurrentSection~=S then ts:Create(tBtn,t(0.2),{BackgroundColor3=Clrs.TabInactive}):Play()end end)
local sFr=i("ScrollingFrame")
sFr.Name=n.."_Content"
sFr.Size=u(1,0,1,0)
sFr.BackgroundTransparency=1
sFr.BorderSizePixel=0
sFr.ScrollBarThickness=3
sFr.ScrollBarImageColor3=Clrs.Disabled
sFr.Visible=false
sFr.AutomaticCanvasSize=Enum.AutomaticSize.Y
sFr.CanvasSize=u(0,0,0,0)
i("UICorner",sFr).CornerRadius=d(0,6)
local sL=i("UIListLayout")
sL.Padding=d(0,ESz.SectionSpacing)
sL.SortOrder=Enum.SortOrder.LayoutOrder
sL.Parent=sFr
local sP=i("UIPadding")
sP.PaddingTop=d(0,6)
sP.PaddingBottom=d(0,6)
sP.PaddingLeft=d(0,8)
sP.PaddingRight=d(0,8)
sP.Parent=sFr
sFr.Parent=cArea
sL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
sFr.CanvasSize=u(0,0,0,sL.AbsoluteContentSize.Y+12)
end)
if #W.Sections==0 then
tBtn.BackgroundColor3=Clrs.TabActive
tBtn.TextColor3=Clrs.Text
sFr.Visible=true
W.CurrentSection=S
end
tBtn.MouseButton1Click:Connect(function()
cEff(tBtn)
for _,tb in pairs(tCnt:GetChildren())do if tb:IsA("TextButton")then tb.BackgroundColor3=Clrs.TabInactive tb.TextColor3=Clrs.TextInactive end end
for _,fr in pairs(cArea:GetChildren())do if fr:IsA("ScrollingFrame")then fr.Visible=false end end
tBtn.BackgroundColor3=Clrs.TabActive
tBtn.TextColor3=Clrs.Text
sFr.Visible=true
W.CurrentSection=S
end)
function S:CreateButton(bN,cb)
local b=i("TextButton")
b.Name=bN
b.Size=u(1,0,0,ESz.ButtonHeight)
b.BackgroundColor3=Clrs.Button
b.Text=bN
b.TextColor3=Clrs.Text
b.TextSize=13
b.Font=Fnts.Bold
b.AutoButtonColor=false
b.LayoutOrder=#sFr:GetChildren()
b.TextScaled=true
b.TextWrapped=true
local bC=i("UITextSizeConstraint")
bC.MaxTextSize=13
bC.MinTextSize=8
bC.Parent=b
i("UICorner",b).CornerRadius=d(0,5)
aS(b)
aSG(b)
b.Parent=sFr
sBH(b,false)
b.MouseButton1Click:Connect(function()cEff(b)if cb then cb()end end)
return b
end
function S:CreateToggle(tN,df,cb)
local f=i("Frame")
f.Name=tN
f.Size=u(1,0,0,ESz.ToggleHeight)
f.BackgroundTransparency=1
f.LayoutOrder=#sFr:GetChildren()
local lBl=i("TextLabel")
lBl.Size=u(0.7,0,1,0)
lBl.BackgroundTransparency=1
lBl.Text=tN
lBl.TextColor3=Clrs.Text
lBl.TextSize=13
lBl.Font=Fnts.Bold
lBl.TextXAlignment=Enum.TextXAlignment.Left
lBl.TextScaled=true
lBl.TextWrapped=true
local tC=i("UITextSizeConstraint")
tC.MaxTextSize=13
tC.MinTextSize=8
tC.Parent=lBl
lBl.Parent=f
local tBtn=i("TextButton")
tBtn.Name="Toggle"
tBtn.Size=u(0,40,0,20)
tBtn.Position=u(1,-42,0.5,-10)
tBtn.BackgroundColor3=df and Clrs.ToggleOn or Clrs.ToggleOff
tBtn.Text=""
tBtn.AutoButtonColor=false
i("UICorner",tBtn).CornerRadius=d(1,0)
aS(tBtn)
aSG(tBtn)
tBtn.Parent=f
local crc=i("Frame")
crc.Name="Circle"
crc.Size=u(0,16,0,16)
crc.Position=u(0,df and 21 or 2,0.5,-8)
crc.BackgroundColor3=Clrs.Text
i("UICorner",crc).CornerRadius=d(1,0)
crc.Parent=tBtn
f.Parent=sFr
local st=df or false
tBtn.MouseEnter:Connect(function()ts:Create(tBtn,t(0.2),{BackgroundColor3=st and Clrs.Accent or Clrs.Hover}):Play()end)
tBtn.MouseLeave:Connect(function()ts:Create(tBtn,t(0.2),{BackgroundColor3=st and Clrs.ToggleOn or Clrs.ToggleOff}):Play()end)
tBtn.MouseButton1Click:Connect(function()
cEff(tBtn)
st=not st
ts:Create(crc,t(0.2),{Position=u(0,st and 21 or 2,0.5,-8)}):Play()
ts:Create(tBtn,t(0.2),{BackgroundColor3=st and Clrs.ToggleOn or Clrs.ToggleOff}):Play()
if cb then cb(st)end
end)
return f
end
function S:CreateSlider(sN,mn,mx,df,cb)
local f=i("Frame")
f.Name=sN
f.Size=u(1,0,0,ESz.SliderHeight)
f.BackgroundTransparency=1
f.LayoutOrder=#sFr:GetChildren()
local lBl=i("TextLabel")
lBl.Size=u(1,0,0,18)
lBl.BackgroundTransparency=1
lBl.Text=sN..": "..df
lBl.TextColor3=Clrs.Text
lBl.TextSize=13
lBl.Font=Fnts.Bold
lBl.TextXAlignment=Enum.TextXAlignment.Left
lBl.TextScaled=true
lBl.TextWrapped=true
local sC=i("UITextSizeConstraint")
sC.MaxTextSize=13
sC.MinTextSize=8
sC.Parent=lBl
lBl.Parent=f
local trk=i("Frame")
trk.Name="Track"
trk.Size=u(1,-16,0,4)
trk.Position=u(0,8,0,22)
trk.BackgroundColor3=Clrs.ToggleOff
i("UICorner",trk).CornerRadius=d(1,0)
trk.Parent=f
local fill=i("Frame")
fill.Name="Fill"
fill.Size=u((df-mn)/(mx-mn),0,1,0)
fill.BackgroundColor3=Clrs.Slider
i("UICorner",fill).CornerRadius=d(1,0)
fill.Parent=trk
local sBtn=i("TextButton")
sBtn.Name="SliderButton"
sBtn.Size=u(0,16,0,16)
sBtn.Position=u(fill.Size.X.Scale,-8,0.5,-8)
sBtn.BackgroundColor3=Clrs.Text
sBtn.Text=""
sBtn.AutoButtonColor=false
i("UICorner",sBtn).CornerRadius=d(1,0)
sBtn.Parent=trk
f.Parent=sFr
local drgS=false
sBtn.MouseButton1Down:Connect(function()drgS=true end)
trk.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
drgS=true
local pct=math.clamp((input.Position.X-trk.AbsolutePosition.X)/trk.AbsoluteSize.X,0,1)
sBtn.Position=u(pct,-8,0.5,-8)
fill.Size=u(pct,0,1,0)
local val=math.floor(mn+(pct*(mx-mn)))
lBl.Text=sN..": "..val
if cb then cb(val)end
end
end)
uis.InputEnded:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then drgS=false end
end)
uis.InputChanged:Connect(function(input)
if drgS and(input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch)then
local pct=math.clamp((input.Position.X-trk.AbsolutePosition.X)/trk.AbsoluteSize.X,0,1)
sBtn.Position=u(pct,-8,0.5,-8)
fill.Size=u(pct,0,1,0)
local val=math.floor(mn+(pct*(mx-mn)))
lBl.Text=sN..": "..val
if cb then cb(val)end
end
end)
return f
end
function S:CreateDropdown(dN,opts,df,cb)
local drp=i("Frame")
drp.Name=dN
drp.Size=u(1,0,0,ESz.DropdownHeight)
drp.BackgroundTransparency=1
drp.ClipsDescendants=false
drp.LayoutOrder=#sFr:GetChildren()
local dBtn=i("TextButton")
dBtn.Name="DropdownButton"
dBtn.Size=u(1,0,0,ESz.DropdownHeight)
dBtn.BackgroundColor3=Clrs.Button
dBtn.Text=opts[df] or opts[1] or"Select"
dBtn.TextColor3=Clrs.Text
dBtn.TextSize=13
dBtn.Font=Fnts.Bold
dBtn.AutoButtonColor=false
dBtn.TextScaled=true
dBtn.TextWrapped=true
local dC=i("UITextSizeConstraint")
dC.MaxTextSize=13
dC.MinTextSize=8
dC.Parent=dBtn
i("UICorner",dBtn).CornerRadius=d(0,5)
aS(dBtn)
aSG(dBtn)
dBtn.Parent=drp
local dI=i("TextLabel")
dI.Name="Icon"
dI.Size=u(0,20,1,0)
dI.Position=u(1,-25,0,0)
dI.BackgroundTransparency=1
dI.Text=">"
dI.TextColor3=Clrs.TextInactive
dI.TextSize=16
dI.Font=Fnts.Bold
dI.Parent=dBtn
drp.Parent=sFr
sBH(dBtn,false)
local op,oCnt,oGui,cCn,dCn=false,nil,nil,nil,nil
local function clsO()
if oCnt then actDrp[oCnt]=nil end
if oGui then oGui:Destroy();oGui=nil end
oCnt=nil
if dCn then dCn:Disconnect();dCn=nil end
if cCn then cCn:Disconnect();cCn=nil end
ts:Create(dI,t(0.2),{Rotation=0}):Play()
op=false
end
dBtn.MouseButton1Click:Connect(function()
cEff(dBtn)
if op then clsO();return end
op=true
ts:Create(dI,t(0.2),{Rotation=90}):Play()
oGui=i("ScreenGui")
oGui.Name=gH()
oGui:SetAttribute("OxDrop",true)
oGui.ResetOnSpawn=false
oGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
oGui.DisplayOrder=12
oGui.Parent=sGui
local h=math.clamp((#opts*28)+((#opts-1)*4)+12,40,160)
oCnt=i("ScrollingFrame")
oCnt.Name="OptCont"
oCnt.Size=u(0,160,0,h)
oCnt.Position=u(0,mFrm.AbsolutePosition.X+mFrm.AbsoluteSize.X+10,0,mFrm.AbsolutePosition.Y+mFrm.AbsoluteSize.Y-h)
oCnt.BackgroundColor3=c3(255,255,255)
oCnt.BorderSizePixel=0
oCnt.ZIndex=100
oCnt.ScrollBarThickness=3
oCnt.ScrollBarImageColor3=Clrs.Disabled
oCnt.AutomaticCanvasSize=Enum.AutomaticSize.Y
oCnt.CanvasSize=u(0,0,0,0)
i("UICorner",oCnt).CornerRadius=d(0,8)
local dB=i("UIStroke")
dB.Thickness=2
dB.Color=rB.Color
dB.Parent=oCnt
local dG=i("UIGradient")
dG.Color=mGr.Color
dG.Rotation=45
dG.Parent=oCnt
local l=i("UIListLayout")
l.SortOrder=Enum.SortOrder.LayoutOrder
l.Padding=d(0,4)
l.Parent=oCnt
local pad=i("UIPadding")
pad.PaddingTop,pad.PaddingBottom,pad.PaddingLeft,pad.PaddingRight=d(0,6),d(0,6),d(0,6),d(0,6)
pad.Parent=oCnt
for _,opt in pairs(opts)do
local oB=i("TextButton")
oB.Name=opt
oB.Size=u(1,0,0,28)
oB.BackgroundColor3=Clrs.Button
oB.Text=opt
oB.TextColor3=Clrs.Text
oB.TextSize=13
oB.TextScaled=true
oB.TextWrapped=true
oB.Font=Fnts.Bold
oB.AutoButtonColor=false
oB.ZIndex=101
local cn=i("UITextSizeConstraint")
cn.MaxTextSize=13
cn.MinTextSize=8
cn.Parent=oB
i("UICorner",oB).CornerRadius=d(0,6)
aS(oB)
aSG(oB)
oB.Parent=oCnt
oB.MouseEnter:Connect(function()oB.BackgroundColor3=Clrs.Hover end)
oB.MouseLeave:Connect(function()oB.BackgroundColor3=Clrs.Button end)
oB.MouseButton1Click:Connect(function()
cEff(oB)
dBtn.Text=opt
if cb then cb(opt)end
clsO()
end)
end
oCnt.Parent=oGui
actDrp[oCnt]=true
dCn=rs.Heartbeat:Connect(function()
if oCnt and op then
oCnt.Position=u(0,mFrm.AbsolutePosition.X+mFrm.AbsoluteSize.X+10,0,mFrm.AbsolutePosition.Y+mFrm.AbsoluteSize.Y-h)
dB.Color=rB.Color
dG.Offset=v2(math.sin(tick()*0.5)*0.7,math.cos(tick()*0.5)*0.7)
end
end)
cCn=uis.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
local m=input.Position
local bp,bs=dBtn.AbsolutePosition,dBtn.AbsoluteSize
local cp,cs=oCnt and oCnt.AbsolutePosition,oCnt and oCnt.AbsoluteSize
local iB=m.X>=bp.X and m.X<=bp.X+bs.X and m.Y>=bp.Y and m.Y<=bp.Y+bs.Y
local iC=cp and cs and m.X>=cp.X and m.X<=cp.X+cs.X and m.Y>=cp.Y and m.Y<=cp.Y+cs.Y
if not iB and not iC then clsO()end
end
end)
end)
return drp
end
function Section:CreateTextbox(bN,cb)
local tBox=i("Frame")
tBox.Name=bN
tBox.Size=u(1,0,0,ESz.TextboxHeight)
tBox.BackgroundTransparency=1
tBox.LayoutOrder=#sFr:GetChildren()
local inp=i("TextBox")
inp.Name="Input"
inp.Size=u(1,0,1,0)
inp.BackgroundColor3=Clrs.Button
inp.Text=""
inp.PlaceholderText="Type"
inp.TextColor3=Clrs.Text
inp.PlaceholderColor3=Clrs.TextInactive
inp.TextSize=13
inp.Font=Enum.Font.GothamMedium
inp.TextXAlignment=Enum.TextXAlignment.Center
inp.TextScaled=true
inp.TextWrapped=true
local iC=i("UITextSizeConstraint")
iC.MaxTextSize=13
iC.MinTextSize=8
iC.Parent=inp
i("UICorner",inp).CornerRadius=d(0,5)
aS(inp)
aSG(inp)
inp.Parent=tBox
local pad=i("UIPadding")
pad.PaddingLeft=d(0,10)
pad.PaddingRight=d(0,10)
pad.Parent=inp
tBox.Parent=sFr
inp.FocusLost:Connect(function()if cb then cb(inp.Text)end end)
return tBox
end
table.insert(W.Sections,S)
return S
end
mFrm.Parent=sGui
pcall(function()sGui.Parent=core end)
if not sGui.Parent then sGui.Parent=lplr:WaitForChild("PlayerGui") end
table.insert(self.Windows,W)
return W
end
return O.new()
