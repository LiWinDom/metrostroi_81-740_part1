--------------------------------------------------------------------------------
-- БВК-М
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("81_740_CAMS")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize()
	self.State = -1
	self.Service = 0
	self.Selected = 0
	
	self.Train:LoadSystem("CAMS5","Relay","Switch",{bass=true})
	self.Train:LoadSystem("CAMS6","Relay","Switch",{bass=true})
	self.Train:LoadSystem("CAMS7","Relay","Switch",{bass=true})
	self.Train:LoadSystem("CAMS8","Relay","Switch",{bass=true})
	self.Train:LoadSystem("CAMS9","Relay","Switch",{bass=true})
	self.Train:LoadSystem("CAMS10","Relay","Switch",{bass=true})
	
	self.TriggerNames = {
		"CAMS5",
		"CAMS6",
		"CAMS7",
		"CAMS8",
		"CAMS9",
		"CAMS10",		
	}

	self.Triggers = {}
	for k,v in pairs(self.TriggerNames) do
		if self.Train[v] then self.Triggers[v] = self.Train[v].Value > 0.5 end
	end
	--self.Brightness = 100
		
	self.Tbl = {
		[ 5] = {
			[1] = {false,true},
			[2] = {true,false},
		},
		[ 6] = {
			[1] = {false,false},
			[2] = {true,true},
		},
		[ 7] = {
			[1] = {false,false},
			[2] = {true,false},
		},
		[ 8] = {
			[1] = {false,true},
			[2] = {true,true},
		},				
		[ 9] = {
			[1] = {true,false},
		},
		[10] = {
			[1] = {false,false},
		},
	}	
	self.StateTimer = CurTime()
	self.LastEntered = 0
end

function TRAIN_SYSTEM:Outputs()
	--return {"State","ControllerState"}
end

function TRAIN_SYSTEM:Inputs()
	return {}
end
if TURBOSTROI then return end

function TRAIN_SYSTEM:TriggerInput(name,value)
end
if SERVER then
	function TRAIN_SYSTEM:Trigger(name,value)
		local name = name:gsub("CAMS","")
		local Train = self.Train
		if self.State == 2 and self.Service == 1 then
			if value then
				self.State = 0
				self.Service = 0
			end
		end
		if self.State == -1 then
			if value then
				local statetimer = Train:GetNW2Int("CAMSTimer",0)/20
				if statetimer > -11.5 and statetimer < -9.1 then
					self.State = 1
					self.Service = 1
				end
			end
		end
		if self.State >= 0 and self.Service == 0 then
			local numname = tonumber(name) or 0
			if value then
				local WagNum = Train:GetNW2Int("CAMSWagNum")
				if numname >= 5 and (self.LastEntered ~= numname) then
					self.Cam1,self.Cam1E = CurTime()+math.Rand(0.8,2),(self.Tbl[numname][1][2] and Train.WagonList[WagNum] or Train)
					self.Cam2 = false
					Train:SetNW2Bool("CAMSCam1Pos",self.Tbl[numname][1][1])
					Train:SetNW2Entity("CAMSCam2E",nil)
					if self.Tbl[numname][2] then
						self.Cam2,self.Cam2E = self.Cam1,(self.Tbl[numname][2][2] and Train.WagonList[WagNum] or Train)
						Train:SetNW2Entity("CAMSCam2E",self.Cam2E)
						Train:SetNW2Bool("CAMSCam2Pos",self.Tbl[numname][2][1])
					end
					self.Selected = 0
					if self.State ~= 0 then self.State = 0 end
					self.LastEntered = numname				
				end
				if numname == 3 and self.Selected > 0 then
					if self.LastEntered ~= self.Selected then
						self.Cam4,self.Cam4E = CurTime()+math.Rand(0.8,2),Train.WagonList[math.min(self.Selected,WagNum)]
						Train:SetNW2Entity("CAMSCam4E",self.Cam4E)
						self.Cam5,self.Cam6,self.Cam7 = false,false,false
						Train:SetNW2Entity("CAMSCam5E",nil)
						if self.Selected <= WagNum then
							Train:SetNW2Entity("CAMSCam5E",Train.WagonList[self.Selected])
							self.Cam5,self.Cam5E = CurTime()+math.Rand(0.8,2),Train.WagonList[self.Selected]
							self.Cam6,self.Cam6E = CurTime()+math.Rand(0.8,2),Train.WagonList[self.Selected]
							self.Cam7,self.Cam7E = CurTime()+math.Rand(0.8,2),Train.WagonList[self.Selected]
						else
							self.Cam5E = false
							self.Cam6E = false
							self.Cam7E = false
						end
					end
					self.LastSelected = self.Selected
					self.LastEntered = self.Selected
					self.Selected = 0
					self.State = 1
				end
				if numname == 4 then
					self.Selected = self.LastSelected or (self.Selected >= (WagNum+(Train:GetNW2Bool("CAMSLast",false) and 1 or 0)) and 1 or self.Selected + 1)
					self.LastSelected = nil
				end
			end
		end
	end
	function TRAIN_SYSTEM:Think(dT)
		local Train = self.Train
		self.Power = Train.Electric.Battery80V > 62 and Train.SF6.Value > 0.5 and Train.SFV33.Value > 0.5
		if not self.Power and self.State ~= -4 then self.LastEntered = 0 self.Selected = 0 self.State = -4 self.StateTimer = nil end
		--if self.State == -4 and not self.Power then self.StateTimer = CurTime()+math.Rand(10,12) end
		if self.State == -4 and self.Power then 
			self.State = -3 
			self.StateTimer = CurTime()+math.Rand(7,9) 
			self.Service = 0
		end
		if self.Power and self.State == -3 and CurTime()-self.StateTimer > 0 then
			self.State = -2
			self.StateTimer = CurTime()+math.Rand(9,11)
		end
		if self.Power and self.State == -2 and CurTime()-self.StateTimer > 0 then
			self.State = -1
			self.StateTimer = CurTime()+math.Rand(17,19)
		end
		if self.State == -1 and CurTime()-self.StateTimer > 0 then
			self.State = 0
			self:Trigger("5",true)

			--self.StateTimer = nil
			--self.LastSelected = nil
			--self.LastEntered = 5
			if Train:GetNW2Int("CAMSWagNum",0) == 0 then
				local wagn = math.min(8,#Train.WagonList)
				Train:SetNW2Int("CAMSWagNum",wagn)
				Train:SetNW2Bool("CAMSLast",Train.WagonList[wagn].WagonNumber > 00200)
			end
			if self.Inv == nil then
				self.Inv = Train:GetWagonNumber() > Train.WagonList[#Train.WagonList]:GetWagonNumber()
				Train:SetNW2Bool("CAMSInv",Train:GetWagonNumber() > Train.WagonList[#Train.WagonList]:GetWagonNumber())
			end

		end
		for k,v in pairs(self.TriggerNames) do
			if Train[v] and (Train[v].Value > 0.5) ~= self.Triggers[v] then
				self:Trigger(v,Train[v].Value > 0.5)
				self.Triggers[v] = Train[v].Value > 0.5
			end
		end
		if self.State == 0 then
			local cam1,cam2 = false,false
			for i=1,#Train.WagonList do
				local train = Train.WagonList[i]
				if train.SF6 and train.SFV33 and train.Battery.Value*train.SFV33.Value*(train.Electric.KM2 and train.Electric.KM2 or 1)  == 1 then
					if self.Cam1E == train then cam1 = true end
					if self.Cam2E == train then cam2 = true end
				end
			end
			if self.Cam1 == true and (not IsValid(self.Cam1E) or not cam1) then self.Cam1 = false end		
			if self.Cam1 == true then
				Train:SetNW2Bool("CAMSCam1C",true)
				Train:SetNW2Entity("CAMSCam1E",self.Cam1E)
			else
				if self.Cam1 and self.Cam1 ~= true and CurTime()-self.Cam1 > 0 then self.Cam1 = true end
				if not self.Cam1 and cam1 then self.Cam1 = CurTime()+math.Rand(0.8,2) end
				Train:SetNW2Bool("CAMSCam1C",false)
			end
			if self.Cam2 == true and (self.LastEntered > 8 or not IsValid(self.Cam2E) or not cam2) then self.Cam2 = false end		
			if self.Cam2 == true then
				Train:SetNW2Bool("CAMSCam2C",true)
				Train:SetNW2Entity("CAMSCam2E",self.Cam2E)
			else
				if self.Cam2 and self.Cam2 ~= true and CurTime()-self.Cam2 > 0 then self.Cam2 = true end
				if not self.Cam2 and cam2 then self.Cam2 = CurTime()+math.Rand(0.8,2) end
				Train:SetNW2Bool("CAMSCam2C",false)
			end		
		end
		
		if self.State == 1 then --service
		
		end
		
		Train:SetNW2Int("CAMSState",self.State)	
		Train:SetNW2Int("CAMSService",self.Service)	
		Train:SetNW2Int("CAMSSelected",self.Selected)	
		Train:SetNW2Int("CAMSLastSelected",self.LastSelected or 0)
		Train:SetNW2Int("CAMSLastEntered",self.LastEntered or 0)
		Train:SetNW2Int("CAMSTimer",self.StateTimer and (CurTime()-self.StateTimer)*20 or 0)
		--Train:SetNW2Int("CAMSBrightness",self.Brightness)		
	end
else
	local function createFont(name,font,size,weight,blur,scanlines,underline)
		surface.CreateFont("Metrostroi_740_"..name, {
			font = font,
			size = size,
			weight = weight or 400,
			blursize = blur or false,
			antialias = true,--(name ~= "CAMS2"),
			underline = underline,
			italic = false,
			strikeout = false,
			symbol = false,
			rotary = false,
			shadow = false,
			additive = false,
			outline = false,
			extended = true,
			scanlines = scanlines or false,
		})
	end
	createFont("CAMS","Thintel",64,0,0,0,false)
	createFont("CAMS4","PerfectDOSVGA437",20,0,0,0,false)
	
	local camera_preset_icon = surface.GetTextureID("models/metrostroi_train/81-740/cabine/cam/cam_icon_preset")
	local nosignal = surface.GetTextureID("models/metrostroi_train/81-740/cabine/cam/nosignal_nec")
	local camera_preset_set_icon = surface.GetTextureID("models/metrostroi_train/81-740/cabine/cam/cam_icon_preset_select")
	
	local tbl = {
		[ 5] = {
			[1] = {-1,-1},
			[2] = {-1, 1},
		},
		[ 6] = {
			[1] = { 1,-1},
			[2] = { 1, 1},
		},
		[ 7] = {
			[1] = {-1,-1},
			[2] = { 1,-1},
		},
		[ 8] = {
			[1] = {-1, 1},
			[2] = { 1, 1},
		},				
		[ 9] = {
			[1] = {-1,-1},
		},
		[10] = {
			[1] = { 1,-1},
		},
	}
	
    function TRAIN_SYSTEM:ClientInitialize()
	
        self.Cam1 = self.Train:CreateRT("740CAMSC1",1024,768,true)
        self.Cam2 = self.Train:CreateRT("740CAMSC2",512,768,true)
        self.Cam3 = self.Train:CreateRT("740CAMSC3",512,768,true)
		
		self.scalex,self.scaley = ScrW()/1024,ScrH()/661 --ScrW()/1768*1.725,ScrH()/992*1.5 
		
		--self.scalex,self.scaley = ScrW()/1768*1.725,ScrH()/992*1.5 
    end
    local CamRT = surface.GetTextureID( "pp/rt" )
    local CamRTM = Material( "pp/rt" )
    local CamsPos = Vector(477,34,-14)
    function TRAIN_SYSTEM:ClientThink()
		if not self.Train:ShouldDrawPanel("CAMS") then return end
		self.scalex,self.scaley = ScrW()/1024,ScrH()/661 --ScrW()/1768*1.725,ScrH()/992*1.5 
	
        local train = self.Train
		local lastenter = train:GetNW2Int("CAMSLastEntered",0) > 8
        local state = train:GetNW2Int("CAMSState",0)
        --local camstate = train:GetNW2Int("CAMSCamState",1)
		--local brightness = train:GetNW2Int("CAMSBrightness",100)
        if state == 0 then
			local Cam1,Cam1E,Cam1Pos = train:GetNW2Bool("CAMSCam1C"),train:GetNW2Entity("CAMSCam1E"),train:GetNW2Bool("CAMSCam1Pos",false)
			local Cam2,Cam2E,Cam2Pos = train:GetNW2Bool("CAMSCam2C"),train:GetNW2Entity("CAMSCam2E"),train:GetNW2Bool("CAMSCam2Pos",false)		
			
            if Cam1 and not Cam2 and lastenter then
				Metrostroi.RenderCamOnRT(train,CamsPos,"Cam1",math.Rand(0.2,0.5),self.Cam1,Cam1E,Vector(300,-70,55)+(Cam1Pos and Vector(0,144,0) or Vector(0,0,0)),Angle(10,180,0),1024,768,1,1,1)
			end
            if Cam1 then
				Metrostroi.RenderCamOnRT(train,CamsPos,"Cam3",math.Rand(0.2,0.5),self.Cam2,Cam1E,Vector(300,-74,55)+(Cam1Pos and Vector(0,144,0) or Vector(0,0,0)),Angle(5,180,0),1024,768,1,1,1)
			end
			if Cam2 then
				Metrostroi.RenderCamOnRT(train,CamsPos,"Cam2",math.Rand(0.2,0.5),self.Cam3,Cam2E,Vector(300,-70,55)+(Cam2Pos and Vector(0,144,0) or Vector(0,0,0)),Angle(5,180,0),1024,768,1,1,1)
			end		
        end

		if state == -4 then
			render.PushRenderTarget(self.Train.CAMS,0,0,1024,768)
			render.Clear(0, 0, 0, 0)
			render.PopRenderTarget()	
			return
		end

		if self.state ~= -3 then	
			render.SetColorMaterial(0,0,0) 
			render.PushRenderTarget(self.Train.CAMS,0,0,1024,768)
			render.Clear(0, 0, 0, 0)
			cam.Start2D()
				if state ~= -4 then
					surface.SetDrawColor(0,0,0)
					surface.DrawRect(0,0,1024,768)
				end
				self:CAMS(self.Train)	
			cam.End2D()
			render.PopRenderTarget()
		end
		self.state = state
	end
	local blue = Color(0,50,255)
	local white = Color(255,255,255)
	local yellow = Color(255,255,0)
	local black = Color(0,0,0)
	
	local gray = Color(200, 200, 200)
	local magenta = Color(255, 0, 255)
	local dos_blue = Color(0,50,255)
	local red = Color (255,0,0)
	
	
	local font = "Metrostroi_740_CAMS"
	function TRAIN_SYSTEM:CAMS(Train)
		local scx,scy = self.scalex,self.scaley
		local state = Train:GetNW2Int("CAMSState",0)
		local service  = Train:GetNW2Int("CAMSService",0)
		local sel = Train:GetNW2Int("CAMSSelected",0)
		local wagnum = Train:GetNW2Int("CAMSWagNum",0)
		local statetimer = Train:GetNW2Int("CAMSTimer",0)/20
		local lastenter = Train:GetNW2Int("CAMSLastEntered",0) > 8
		--RunConsoleCommand("say",statetimer)
		if state == -4 then
			return
		end
		--state = -3
		surface.SetDrawColor(Color(255,255,255))		
		if state == -3 then
			surface.SetDrawColor(21,21,21)
			surface.DrawRect(0,0,1024,768)
			--draw.SimpleText("полосочки",font,512,368,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)	
		elseif state == -2 then
			--draw.SimpleText("пингивинчики",font,512,368,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)	
			surface.SetTexture(nosignal)
			surface.DrawTexturedRectRotated(512,384,1024,768,0)
			--surface.DrawTexturedRectRotated(158,64,128,128,0)
		
		elseif state == -1 then
			--for i=1,48 do
				--draw.SimpleText(i,font.."2",15,0+i*16,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)	
			--end
			surface.SetDrawColor(2,2,2)
			surface.DrawRect(0,0,1024,768)
			local y = 16
			local x = 5
			if statetimer > -17.15 and statetimer < -0.5 then
				surface.SetDrawColor(21,21,21)
				surface.DrawRect(0,0,1024,768)
			end
			if statetimer > -16.3 and statetimer < -0.5 then
				draw.SimpleText("CMOS battery failed",font.."4",5,16,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				y=32
			end
			if statetimer > -16 and statetimer < -0.5 then
				draw.SimpleText("Booting from drive C...",font.."4",5,48,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText("Starting MS-DOS...",font.."4",5,64,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				y=96
			end
			if statetimer > -14.2 and statetimer < -0.5 then
				draw.SimpleText("HIMEM is testing extended memory...",font.."4",5,96,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				y=96
				x=393
			end
			if statetimer > -12 and statetimer < -0.5 then
				draw.SimpleText("done.",font.."4",395,96,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=5
				y=112
			end
			if statetimer > -11.5 and statetimer < -0.5 then
				draw.SimpleText("Press any key to run setup...",font.."4",5,144,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=323
				y=144
			end
			if statetimer > -9 and statetimer < -0.5 then
				draw.SimpleText("skipped.",font.."4",323,144,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=400
				y=144
			end
			if statetimer > -8.9 and statetimer < -0.5 then
				draw.SimpleText("Starting systems...",font.."4",5,176,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=150
				y=192
			end
			if statetimer > -8.7 and statetimer < -0.5 then
				draw.SimpleText("░█████╗░░█████╗░███╗░░░███╗  ░██████╗██╗░░░██╗░██████╗████████╗███████╗███╗░░░███╗░██████╗",font.."4",5,208,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText("██╔══██╗██╔══██╗████╗░████║  ██╔════╝╚██╗░██╔╝██╔════╝╚══██╔══╝██╔════╝████╗░████║██╔════╝",font.."4",5,224,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText("██║░░╚═╝███████║██╔████╔██║  ╚█████╗░░╚████╔╝░╚█████╗░░░░██║░░░█████╗░░██╔████╔██║╚█████╗░",font.."4",5,240,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText("██║░░██╗██╔══██║██║╚██╔╝██║  ░╚═══██╗░░╚██╔╝░░░╚═══██╗░░░██║░░░██╔══╝░░██║╚██╔╝██║░╚═══██╗",font.."4",5,256,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText("╚█████╔╝██║░░██║██║░╚═╝░██║  ██████╔╝░░░██║░░░██████╔╝░░░██║░░░███████╗██║░╚═╝░██║██████╔╝",font.."4",5,272,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText("░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝  ╚═════╝░░░░╚═╝░░░╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═════╝░",font.."4",5,288,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText("                                       Version 2.6                                        ",font.."4",5,306,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=5
				y=320
			end
			if statetimer > -8.65 and statetimer < -0.5 then
				draw.SimpleText("Copyright (C) Bayramov Gadjimurad Rosenovich and Prokofiev Arseny Aleksandrovich 2017-2019",font.."4",5,320,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=5
				y=332
			end
			if statetimer > -8.0 and statetimer < -0.5 then
				draw.SimpleText("CAM1...",font.."4",5,352,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=96
				y=352
			end
			if statetimer > -7.97 and statetimer < -0.5 then
				draw.SimpleText("OK!",font.."4",85,352,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=124
				y=352
			end
			if statetimer > -7.95 and statetimer < -0.5 then
				draw.SimpleText("CAM2..." ,font.."4",5,368,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=96
				y=368
			end
			if statetimer > -7.93 and statetimer < -0.5 then
				draw.SimpleText("OK!",font.."4",85,368,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=124
				y=368
			end
			if statetimer > -7.90 and statetimer < -0.5 then
				draw.SimpleText("CAM3...",font.."4",5,384,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=170
				y=384
			end
			if statetimer > -7.87 and statetimer < -0.5 then
				draw.SimpleText("OK!",font.."4",85,384,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=124
				y=384
			end
			if statetimer > -7.85 and statetimer < -0.5 then
				draw.SimpleText("CAM4...",font.."4",5,400,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=170
				y=400
			end
			if statetimer > -7.82 and statetimer < -0.5 then
				draw.SimpleText("OK!",font.."4",85,400,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=124
				y=400
			end
			if statetimer > -7 and statetimer < -0.5 then
				draw.SimpleText("Preparing GUI...",font.."4",5,432,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=183
				y=432
			end
			if statetimer > -0.9 and statetimer < -0.5 then
				draw.SimpleText("Starting GUI...",font.."4",5,448,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=173
				y=448
			end
			if statetimer > -0.5 and statetimer < -0.1 then
				surface.SetDrawColor(2,2,2)
				surface.DrawRect(0,0,1024,768)
			end
			if statetimer > -0.1 and statetimer < 0.0 then
				surface.SetDrawColor(21,21,21)
				surface.DrawRect(0,0,1024,768)
			end
			if CurTime()%1 < 0.5 and statetimer > -17 and statetimer < -0.5 then
				draw.SimpleText("_",font.."4",x,y,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
			end			
			--local text = 
		elseif state == 0 then	

			local LastEntered = Train:GetNW2Int("CAMSLastEntered",0)
			local Cam1,Cam1E,Cam1Pos = Train:GetNW2Bool("CAMSCam1C"),Train:GetNW2Entity("CAMSCam1E"),Train:GetNW2Bool("CAMSCam1Pos",false)
			local Cam2,Cam2E,Cam2Pos = Train:GetNW2Bool("CAMSCam2C"),Train:GetNW2Entity("CAMSCam2E"),Train:GetNW2Bool("CAMSCam2Pos",false)
			if IsValid(Cam2E) then
				surface.SetDrawColor(white)
				surface.SetTexture(camera_preset_icon)
				surface.DrawTexturedRectRotated(105,680,64,128,0)
				surface.SetDrawColor(21,21,21)
				surface.DrawRect(0,0,1024,768)
				draw.SimpleText("CONNECTING...",font,256,384,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				draw.SimpleText("CONNECTING...",font,768,384,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
			elseif not Cam1 then
				surface.SetDrawColor(white)
				surface.SetTexture(camera_preset_icon)
				surface.DrawTexturedRectRotated(105,680,64,128,0)
				surface.SetDrawColor(21,21,21)
				surface.DrawRect(0,0,1024,768)
				draw.SimpleText("CONNECTING...",font,512,384,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
			end
			if not IsValid(Cam2E) then
				if Cam1 and not Cam2 and lastenter then
					render.DrawTextureToScreenRect(self.Cam1,scx*1024,0,-1024*scx,768*scy)				
				end				
			elseif Cam1 or Cam2 then
				if LastEntered == 8 then
					if Cam2 then render.DrawTextureToScreenRect(self.Cam3,scx*512,0,scx*512,scy*768) end				
					if Cam1 then render.DrawTextureToScreenRect(self.Cam2,0,0,scx*512,scy*768) end		
				elseif LastEntered == 6 then
					if Cam2 then render.DrawTextureToScreenRect(self.Cam3,scx*512,0,512*scx,768*scy) end
					if Cam1 then render.DrawTextureToScreenRect(self.Cam2,scx*512,0,-512*scx,768*scy) end
				else
					if Cam2 then render.DrawTextureToScreenRect(self.Cam3,scx*512,0,-512*scx,scy*768) end
					if Cam1 then render.DrawTextureToScreenRect(self.Cam2,scx*(1024+(LastEntered == 5 and -512 or 0)),0,-512*scx*(LastEntered == 5 and -1 or 1),768*scy) end
				end
			end
			if sel == 0 and (Cam1 or Cam2) then
				surface.SetDrawColor(white)
				surface.SetTexture(camera_preset_icon)
				surface.DrawTexturedRectRotated(105,680,64,128,0)

				surface.SetTexture(camera_preset_set_icon)
				surface.DrawTexturedRectUV(89+tbl[LastEntered][1][1]*18.5,664+tbl[LastEntered][1][2]*27.5,32,32,0,0,-tbl[LastEntered][1][1],-tbl[LastEntered][1][2],1)
				--surface.DrawTexturedRectUV(89+(Cam1Pos and -18.5 or 18.5)*(Train == Cam1E and 1 or -1),104+(Cam1Pos and -1 or 1)*(Train == Cam1E and -27.5 or 27.5)*(Train:GetNW2Int("CAMSLastEntered",0) == 9 and -1 or 1),32,32,0,0,(Cam1Pos and 1 or -1)*(Train == Cam1E and 1 or -1),Train == Cam1E and 1 or -1)

				if not lastenter then
					surface.SetTexture(camera_preset_set_icon)
					surface.DrawTexturedRectUV(89+tbl[LastEntered][2][1]*18.5,664+tbl[LastEntered][2][2]*27.5,32,32,0,0,-tbl[LastEntered][2][1],-tbl[LastEntered][2][2],1)					
					--surface.DrawTexturedRectUV(89+(Cam2Pos and -18.5 or 18.5)*(Train == Cam2E and 1 or -1),104+(Cam2Pos and -1 or 1)*(Train == Cam2E and 27.5 or -27.5),32,32,0,0,(Cam2Pos and 1 or -1)*(Train == Cam2E and 1 or -1),Train == Cam2E and 1 or -1)
				end
			end
			
		elseif state == 1 and service == 1 then
			if statetimer > -9.2 then
				surface.SetDrawColor(21,21,21)
				surface.DrawRect(0,0,1024,768)
			end
			if statetimer > -9.1 and statetimer < -0.5 then
				draw.SimpleText("Entering setup...",font.."4",1,20,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=190
				y=20
			end
			if statetimer > -8 and statetimer < -0.5 then
				draw.SimpleText("Initializing system...",font.."4",1,40,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=244
				y=40
			end
			if statetimer > -1 and statetimer < -0.5 then
				draw.SimpleText("OK!",font.."4",244,40,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=280
				y=40
			end
			if statetimer > -0.8 and statetimer < -0.5 then
				draw.SimpleText("Starting...",font.."4",5,60,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				x=122
				y=60
			end
			if CurTime()%1 < 0.5 and statetimer > -9.2 and statetimer < -0.5 then
				draw.SimpleText("_",font.."4",x,y,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
			end
			if statetimer > 0 then
				draw.SimpleText("█████████████████████████████████████████████████████████████████████████████████████████████",font.."4",1,1,gray,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText(" CAM SYSTEMS SETUP v1.1                               (C) 2019 Anton Borisovich & НПП САРМАТ ",font.."4",1,1,black,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				
				for i=1,37 do --background
				draw.SimpleText("█████████████████████████████████████████████████████████████████████████████████████████████",font.."4",1,i*20,dos_blue,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				end
				
				draw.SimpleText("█████████████████████████████████████████████████████████████████████████████████████████████",font.."4",1,748,gray,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText(" Service menu not done yet                                                                   ",font.."4",1,48,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				draw.SimpleText(" Press any key to exit...                                                       ",font.."4",1,748,black,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
				Train:SetNW2Int("CAMSState",2)
			end
		end
	end
end
