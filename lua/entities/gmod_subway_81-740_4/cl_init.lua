include("shared.lua")

--------------------------------------------------------------------------------
ENT.ClientProps = {}
ENT.ButtonMap = {}
ENT.AutoAnims = {}
ENT.ClientSounds = {}

--------------------------------------------------------------------------------
ENT.ClientPropsInitialized = false
ENT.ButtonMap["PUU"] = {
    pos = Vector(349.3,41,2.2), --446 -- 14 -- -0,5
    ang = Angle(0,-90,40),
    width = 685,
    height = 110,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
            
			
			{ID = "!DoorsClosed",x=83, y=30.5, radius=8, tooltip = "",model = {
			model = "models/metrostroi_train/81-722/button_green.mdl",z=1.85,
            lamp = {model = "models/metrostroi_train/81-722/lamp_green.mdl",var="DoorsClosed"},
        }},
		
		
		
        {ID = "StandToggle",x=203, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_green.mdl",z=1.85,
            var="Stand",speed=12, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "notused1234",x=173, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=1.85,
            var="Stand123",speed=12, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "notused123",x=113, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=1.85,
            var="Stand123",speed=12, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		
		
		    {ID = "!HVoltage",x=137.5+37.83*0.16, y=30.5, radius=8, tooltip = "",model = {
			model = "models/metrostroi_train/81-722/button_green.mdl",z=1.85,
            lamp = {model = "models/metrostroi_train/81-722/lamp_green.mdl",var="HVoltage"},
        }},
		
		
        {ID = "KAHToggle",x=137.5+37.83*3, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_green.mdl",z=1.85,
            lamp = {model = "models/metrostroi_train/81-722/lamp_green.mdl",var="KAHLamp", anim=true},
            var="KAH",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "KAHkToggle",x=137.5+37.83*3-20, y=27.5+10, w=40,h=20, tooltip="", model = {
            model = "models/metrostroi_train/81/krishka.mdl", ang = 0, z = 1,
            var="KAHk",speed=8,min=0.32,max=0.721, disable="KAHToggle",
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=70,x=15,y=-40,z=-3.6,var="KAHPl", ID="KAHPl",},
            sndvol = 1, snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "ALSToggle",x=137.5+37.83*4, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_green.mdl", z=1.85,
            lamp = {model = "models/metrostroi_train/81-722/lamp_green.mdl",var="ALSLamp",z=0.1, anim=true},
            var="ALS",speed=8, vmin=0, vmax=0, disable="ALSToggle",
            --sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		--[[
        {ID = "ALSkToggle",x=137.5+37.83*4-20, y=30.5+10, w=40,h=20, tooltip="", model = {
            model = "models/metrostroi_train/81/krishka.mdl", ang = 0, z = 1,
            var="ALSk",speed=8,min=0.43,max=0.68, disable="ALSToggle",
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=180-70,x=-5,y=-45,z=3,var="ALSPl", ID="ALSPl",},
            sndvol = 1, snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
		]]
		{ID = "AccelRateSet",x=137.5+37.88*5-7, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=1.85,
            var="AccelRate",speed=8, vmin=0, vmax=0.7,
           -- lamp = {model = "models/metrostroi_train/81-720/buttons/l1.mdl",var="AccelRateLamp",anim=true},
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		
		{ID = "RingSet",x=137.5+37.83*6-10, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=1.85,
            var="Ring",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		

		
		/*
        {ID = "FDepotToggle",x=137.5+37.83*5, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/buttons/b4.mdl",z=6,
            var="FDepot",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		*/
		
        {ID = "PassSchemeToggle",x=137.5+37.83*7.5-8, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=1.85,
            --lamp = {model = "models/metrostroi_train/81-720/buttons/l1.mdl",var="PassSchemeLamp",anim=true},
            var="PassScheme",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		/*
        {ID = "EmergencyCompressorSet",x=138+37.83*9+10, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/buttons/b7.mdl",z=7,
            var="EmergencyCompressor",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		*/
		
        {ID = "EnableBVSet",x=80+37.83*8, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=1.85,
            var="EnableBV",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		
		
        {ID = "DisableBVSet",x=138+37.83*8, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=1.85,
            var="DisableBV",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		
		

		
		
		{ID = "TickerToggle",x=566.63-100, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=1.85,
            lamp = {model = "models/metrostroi_train/81-722/lamp_yellow.mdl",var="TickerLamp", z=0.1, anim=true},
            var="Ticker",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_Program2Set",x=569.63+36.5*0, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=1.85,--blue
            var="R_Program2",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_AnnouncerToggle",x=566.63+36.5*2.75, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_blue.mdl",z=2.5,--blue
          --  lamp = {model = "models/metrostroi_train/81-720/buttons/l1.mdl",var="R_AnnouncerLamp",anim=true, color=Color(50,150,200)},
            var="R_Announcer",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_LineToggle",x=535, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=1.85,--blue
            lamp = {model = "models/metrostroi_train/81-722/lamp_yellow.mdl",var="R_LineLamp",anim=true},
            var="R_Line",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_EmerSet",x=566.63+35.5*1, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",skin =2,z=1.85,--blue
            var="R_Emer",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		/*
        {ID = "R_Program1Set",x=566.63+35.2*4, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/buttons/b5.mdl",z=2.7,--blue
            var="R_Program1",speed=8, vmin=0, vmax=0,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
*/
/*
        {ID = "EnableBVEmerSet",x=42, y=110, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/button_circle2.mdl",z=3,
            var="EnableBVEmer",speed=12, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
	*/	
		
		{ID = "EmergencyCompressorSet",x=566.63+36.5*1.05, y=90, radius=15, tooltip = "",model = { --566.63+36.5*1
            model = "models/metrostroi_train/81-722/button_white.mdl", z=1.85,
            var="EmergencyCompressor",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		
		
        {ID = "EmergencyControlsToggle",x=566.63+36.5*2.3, y=90, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl", z=1.85,
            lamp = {model = "models/metrostroi_train/81-722/lamp_black.mdl",var="EmergencyControls",z=0, anim=true},
            var="EmergencyControls",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "WiperToggle",x=569.63+35.75*1.8, y=30.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_blue.mdl",z=1.85,
            var="Wiper",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},

        {ID = "!VDop",x=263, y=68, w=104, h=6, tooltip = ""},
        {ID = "!VFact",x=263, y=70+8, w=104, h=6, tooltip = ""},
        {ID = "!VPred",x=263, y=70+19, w=104, h=6, tooltip = ""},

        {ID = "!VDop2",x=373, y=66, w=26, h=28, tooltip = ""},

        --{ID = "!Acc",x=436, y=86, w=80, h=6, tooltip = ""},
    }
}

ENT.ClientProps["Head0-_--"] = {
    model = "models/metrostroi_train/81-740/body/headlight.mdl", --_-- обозначает положение фары на маске.
    pos = Vector(-143.7, 4.4, -55.8),
    ang = Angle(-7,0,0),
    scale = 1.1, 
    nohide=true,
}
ENT.ClientProps["Head--_-0"] = {
    model = "models/metrostroi_train/81-740/body/headlight.mdl",
    pos = Vector(-143.7, 85.8, -55.8),
    ang = Angle(-7,0,0),
    scale = 1.1, 
    nohide=true,
}

ENT.ClientProps["Head-0_--"] = {
    model = "models/metrostroi_train/81-740/body/headlight.mdl",
    pos = Vector(-143.4, 17.5, -58.2),
    ang = Angle(-7,0,0),
    scale = 1.1, 
    nohide=true,
}
ENT.ClientProps["Head--_0-"] = {
    model = "models/metrostroi_train/81-740/body/headlight.mdl",
    pos = Vector(-143.4, 72.8, -58.2),
    ang = Angle(-7,0,0),
    scale = 1.1, 
    nohide=true,
}

ENT.ClientProps["Antenna"] = {
        model = "models/metrostroi_train/81-740/body/antenna/antenna.mdl",
        pos = Vector(-89.25,21.3,-124.5),
        ang = Angle(-6,0,0),
        hideseat = 0.8,
    }

ENT.ClientProps["lamps_salon_on"] = {
    model = "models/metrostroi_train/81-740/salon/lamps/lamps1.mdl",
    pos = Vector(0,-312,0),
    ang = Angle(0,0,0),
    hide=2,
}

ENT.ClientProps["lamps_salon_off"] = {
    model = "models/metrostroi_train/81-740/salon/lamps/lamps0.mdl",
    pos = Vector(0,-312,0),
    ang = Angle(0,0,0),
    hide=2,
}

ENT.ClientProps["krepezh"] = {
    model = "models/metrostroi_train/81-740/body/krepezh.mdl",
    pos = Vector(-110,0,20),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["Garm"] = {
    model = "models/metrostroi_train/81-740/body/Garm.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide = true,
}



ENT.ButtonMap["ALSPANELLAMPS"] = { -- дополнительные лампы АЛС
	pos = Vector(346.1,15.85,-0.05), --446 -- 14 -- -0,5
	ang = Angle(0,-90,40),
	width = 75,
	height = 50,
	scale = 0.0625,
	hideseat=0.2,

        buttons = {
		{ID = "!LN",x=10.8, y=7.4, radius=10, tooltip = "",model = {
            name="LN", lamp = {model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="LN",z=-7.9, color=Color(120,255,50)},
        }},
		{ID = "!Dnepr",x=28, y=28.1, radius=10, tooltip = "",model = {
            name="Dnepr",lamp = {model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="Dnepr",z=-7.9, color=Color(255,0,0)},
        }},
		{ID = "!XOD",x=28, y=7.4, radius=10, tooltip = "",model = {
            name="XOD",lamp = {model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="XOD",z=-7.9, color=Color(250, 250, 15)},
        }},
		{ID = "!DAU",x=45, y=28.1, radius=10, tooltip = "",model = {
            name="DAU",lamp = {model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="DAU",z=-7.9, color=Color(255,0,0)},
        }},
		{ID = "!AO",x=10.8, y=28.1, radius=10, tooltip = "",model = {
            name="AO",lamp = {model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="AO",z=-7.9, color=Color(255,50,0)},
        }},
		{ID = "!Ispr",x=45, y=7.4, radius=10, tooltip = "",model = {
            name="Ispr",lamp = {model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="Ispr",z=-7.9, color=Color(120,255,50)},
        }},
		{ID = "!Forw",x=55, y=8.5, w=18, h=10, tooltip = ""},
        {ID = "!Back",x=55, y=21, w=18, h=10, tooltip = ""}
    }
}

ENT.ButtonMap["PUL"] = {
    pos = Vector(342,32.8,-2.9), --446 -- 14 -- -0,5
    ang = Angle(0,-90,21.5),
    width = 100,
    height = 250,
    scale = 0.0450,
    hideseat=0.2,

    buttons = {
        {ID = "DoorSelectLToggle",x=13, y=55, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=-4.8,  --models/metrostroi_train/81-720/buttons/b4.mdl
            lamp = {model = "models/metrostroi_train/81-722/lamp_black.mdl",var="DoorLeftLamp",anim=true},
            var="DoorSelectL",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "DoorSelectRToggle",x=70, y=55, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=-4.8,
            lamp = {model = "models/metrostroi_train/81-722/lamp_black.mdl",var="DoorRightLamp",anim=true},
            var="DoorSelectR",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "DoorBlockToggle",x=63, y=128, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_red.mdl",z=-6,  --models/metrostroi_train/81-720/buttons/b6.mdl
			lamp = {model = "models/metrostroi_train/81-722/lamp_red.mdl",var="DoorBlockLamp",anim=true},
            var="DoorBlock",speed=8, vmin=0, vmax=0.5,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		/*
        {ID = "!DoorLeftLamp",x=65, y=197, tooltip = "",model = {
           lamp = {model = "models/pult/button_lru.mdl",var="DoorLeftLamp",z=-0.5,skin = 9,anim=true},
        }},
*/
        {ID = "DoorLeftSet",x=63, y=197, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=-6,
			lamp = {model ="models/metrostroi_train/81-722/lamp_black.mdl", var ="DoorLeftLamp",anim=true},
				--models/metrostroi_train/81-720/button_circle1.mdl
            var="DoorLeft",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["PUR"] = {
    pos = Vector(341,12,-3.3), --446 -- 14 -- -0,5
    ang = Angle(0,-90,22),
    width = 220,
    height = 210,
    scale = 0.0450,
    hideseat=0.2,

    buttons = {
        /*{ID = "AccelRateSet",x=13, y=79.5, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/buttons/b4.mdl",z=-6,
            var="AccelRate",speed=12, vmin=0, vmax=1,
            lamp = {model = "models/metrostroi_train/81-720/buttons/l1.mdl",var="AccelRateLamp",anim=true},
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},*/
		
		{ID = "TPT",x=24, y=45, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_red.mdl",z=-5.1,--blue
           -- lamp = {model = "models/metrostroi_train/81-720/buttons/l3.mdl",var="",anim=true},
            speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		
		
		
        {ID = "EmerBrakeAddSet",x=65.5, y=45, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_black.mdl",z=-5.1,  --models/metrostroi_train/81-720/buttons/b2.mdl
            var="EmerBrakeAdd",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmerBrakeReleaseSet",x=106, y=45, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=-5.1,   --models/metrostroi_train/81-720/buttons/b5.mdl
            var="EmerBrakeRelease",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmerBrakeToggle",x=149, y=45, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_black.mdl",z=-5.1,        --b6
           -- lamp = {model = "models/pult/button_lmini.mdl",var="EmerBrakeWork",z=0.1,anim=true,skin=2},
            var="EmerBrake",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmergencyBrakeToggle",x=188, y=45, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler2.mdl",z=-10, ang=180,
            var="EmergencyBrake",speed=12, vmin=0, vmax=1,
            sndvol = 0.5, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},

        {ID = "DoorCloseToggle",x=21, y=119, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_green.mdl",z=-5.1, --models/metrostroi_train/81-720/buttons/b5.mdl
            lamp = {model = "models/metrostroi_train/81-722/lamp_green.mdl",z=0.0,var="DoorCloseLamp",anim=true}, --models/metrostroi_train/81-720/buttons/l1.mdl ,anim=true,color=Color(80,255,100)
            var="DoorClose",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AttentionMessageSet",x=65, y=119, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=-5.1,
            var="AttentionMessage",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AttentionSet",x=105, y=119, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_red.mdl",z=-5.1,
            var="Attention",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AttentionBrakeSet",x=148, y=119, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_red.mdl",z=-5.1,  --models/metrostroi_train/81-720/buttons/b6.mdl
            var="AttentionBrake",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		{ID = "R_Program1Set",x=188, y=119, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=-5.1,--blue
            var="R_Program1",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		
		
		
        {ID = "HornBSet",x=25.5, y=190, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_yellow.mdl",z=-5,  --models/metrostroi_train/81-720/button_circle1.mdl
            var="HornB",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "DoorRightSet",x=110, y=190, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_white.mdl",z=-5,  --models/metrostroi_train/81-720/button_circle1.mdl
			lamp = {model = "models/metrostroi_train/81-722/lamp_black.mdl",var="DoorRightLamp",anim=true},
            var="DoorRight",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        --[[{ID = "!DoorRightLamp",x=111, y=170, radius=8, tooltip = "",model = {
            lamp = {model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",var="DoorRightLamp",z=-7, color=Color(120,255,50)},
        }},]]
    }
}
ENT.ButtonMap["RV"] = {
    pos = Vector(340.8,50.7,-4.2),
    ang = Angle(-1,-90,30),
    width = 60,
    height = 200,
    scale = 0.0450,

    buttons = {
	    {ID = "EmergencyDoorsToggle",x=30, y=15, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_green.mdl",z=-2.8,  --models/metrostroi_train/81-720/tumbler2.mdl
			lamp = {model ="models/metrostroi_train/81-722/lamp_green.mdl", var="EmergencyDoors", anim=true},
            var="EmergencyDoors",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmerX1Set",x=30, y=125, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_black.mdl",z=-3,
            var="EmerX1",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmerX2Set",x=30, y=180, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_black.mdl",z=-3, --models/metrostroi_train/81-720/button_circle3.mdl
            var="EmerX2",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmerCloseDoorsSet",x=30, y=70, radius=15, tooltip = "",model = {
            model = "models/metrostroi_train/81-722/button_black.mdl",z=-3,
            var="EmerCloseDoors",speed=8, vmin=0, vmax=0.7,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["CAMSButtons"] = {
    pos = Vector(341.8,45.5,-3.75),
    ang = Angle(-1,-90,30),
    width = 100,
    height = 120,
    scale = 0.055,
	hideseat=0.2,

    buttons = {
        {ID = "CAMS7Set",x=39, y=26, w=20,h=20, tooltip = "",model = {
            model = "models/metrostroi_train/81-740/cabine/pult/buttons/button_lmini.mdl",skin=3,z=0.5,
			var="CAMS7",speed=10, vmin=0, vmax=0.7,
			sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "CAMS9Set",x=9, y=41, w=20,h=20, tooltip = "",model = { 
            model = "models/metrostroi_train/81-740/cabine/pult/buttons/button_lmini.mdl",skin=3,z=0.5,
			var="CAMS9",speed=10, vmin=0, vmax=0.7,
			sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "CAMS5Set",x=9, y=68, w=20,h=20, tooltip = "",model = { 
            model = "models/metrostroi_train/81-740/cabine/pult/buttons/button_lmini.mdl",skin=3,z=0.5,
			var="CAMS5",speed=10, vmin=0, vmax=0.7,
			sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "CAMS10Set",x=70, y=41, w=20,h=20, tooltip = "",model = { 
            model = "models/metrostroi_train/81-740/cabine/pult/buttons/button_lmini.mdl",skin=3,z=0.5,
			var="CAMS10",speed=10, vmin=0, vmax=0.7,
			sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "CAMS6Set",x=70, y=68, w=20,h=20, tooltip = "",model = {
            model = "models/metrostroi_train/81-740/cabine/pult/buttons/button_lmini.mdl",skin=3,z=0.5,
			var="CAMS6",speed=10, vmin=0, vmax=0.7,
			sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "CAMS8Set",x=39, y=86, w=20,h=20, tooltip = "",model = {
            model = "models/metrostroi_train/81-740/cabine/pult/buttons/button_lmini.mdl",skin=3,z=0.5,
			var="CAMS8",speed=10, vmin=0, vmax=0.7,
			sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["PneumoHelper1"] = {
    pos = Vector(320.7,58.5,15.2),
    ang = Angle(0,0,92),
    width = 70,
    height = 76,
    scale = 0.0625,
    buttons = {
        {ID = "!BrakeCylinder",x=35, y=38, radius=38, tooltip = ""},
    }
}
ENT.ButtonMap["PneumoHelper2"] = {
    pos = Vector(320.7,58.2,22.3),
    ang = Angle(0,0,92),
    width = 70,
    height = 76,
    scale = 0.0625,
    buttons = {
        {ID = "!BrakeTrainLine",x=35, y=38, radius=38, tooltip = ""},
    }
}



--Вольтаж
ENT.ButtonMap["VoltHelper1"] = {
	pos = Vector(322.2,61.0,3.2),
    ang = Angle(0,0,93),
    width = 60,
    height = 50,
    scale = 0.0625,

    buttons = {
        {ID = "!Battery",x=0, y=0, w=60, h=50, tooltip = ""},
    }
}
ENT.ButtonMap["VoltHelper2"] = {
    pos = Vector(322.2,61.2,-0.7),
    ang = Angle(0,0,92),
    width = 60,
    height = 118,
    scale = 0.0625,

    buttons = {
        {ID = "!HV",x=0, y=0, w=60, h=50, tooltip = ""},
        {ID = "!I1_3",x=0, y=64, w=60, h=50, tooltip = ""},
        --{ID = "!I2_4",x=0, y=130, w=60, h=60, tooltip = ""},
    }
}

ENT.ButtonMap["ASNP"] = {
    pos = Vector(343.7,-13.1,1.4), --446 -- 14 -- -0,5
    ang = Angle(0,-90,90),
    width = 56,
    height = 56,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "R_ASNPMenuSet",x=46, y=29+10, radius=8, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl", scale=1,
            var="R_ASNPMenu",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button1_on" or "pnm_button1_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_ASNPUpSet",x=24, y=22+10, radius=8, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl", scale=0.9,
            var="R_ASNPUp",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button1_on" or "pnm_button2_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_ASNPDownSet",x=24, y=35+10, radius=8, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl", scale=0.9,
            var="R_ASNPDown",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button2_on" or "pnm_button1_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_ASNPOnToggle",x=34.5, y=10, radius=8, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler2.mdl", ang=0, scale=0.7,
            var="R_ASNPOn",speed=12, vmin=1, vmax=0,
            sndvol = 0.5,snd = function(val) return val and "pnm_on" or "pnm_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["ASNPScreen"] = {
    pos = Vector(343.7,-5.65,0.11), --446 -- 14 -- -0,5
    ang = Angle(0,-90,90),
    width = 520,
    height = 125,
    scale = 0.010,
    hide=0.8,
}
--ИГЛА
ENT.ButtonMap["IGLA_C"] = {
    pos = Vector(270.7,34.1,44.6),
    ang = Angle(0,90,90),
    width = 512,--18333.333333333333333333333333333
    height = 107,--7916.6666666666666666666666666667
    scale = 0.0171,
    hideseat=0.2,
    hide=true,
}
ENT.ButtonMap["IGLAButtons_C"] = {
    pos = Vector(270.85,34,45.71),
    ang = Angle(0,90,90),
    width = 147,
    height = 75,
    scale = 0.0625,
    hideseat=0.2,
    buttons = {
        {ID = "IGLA1Set",x=22+32.5*-0.18,y=58,w=14,h=12,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl",var="IGLA:ButtonL1",scale = 1,color=Color(175,250,20),x=0.5,y=-2.5,z=-2.5},
        }},
        {ID = "IGLA2Set",x=23+32.5*0.89,y=58,w=14,h=12,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl",var="IGLA:ButtonL2",scale = 1,color=Color(175,250,20),x=-2.5,y=-2.7,z=-2.5},
        }},
        {ID = "IGLA23",x=65,y=58,w=14,h=12,tooltip=""},
        {ID = "IGLA3Set",x=80,y=58,w=14,h=12,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl",var="IGLA:ButtonL3",scale = 1,color=Color(175,250,20),x=1,y=-2.7,z=-2.5},
        }},
        {ID = "IGLA4Set",x=15+32.5*3,y=58, w=14,h=12,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl",var="IGLA:ButtonL4",scale = 1,color=Color(175,250,20),x=1,y=-2.7,z=-2.5},
        }},
        {ID = "!IGLAFire",x=136,y=62,radius=3,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="IGLA:Fire",scale = 0.95,color=Color(255,56,30),z=-2.5,ang=0,},
        }},
        {ID = "!IGLAErr",x=136,y=69.1,radius=3,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="IGLA:Error",scale = 0.95,color=Color(255,168,000),z=-2.5,ang=0},
        }},
    }
}
ENT.ButtonMap["Tickers"] = {
    pos = Vector(-305,-27,66.45), --446 -- 14 -- -0,5
    ang = Angle(0,90,90),
    width = 1024,
    height = 64,
    scale = 0.055,
    hide=true,
    hideseat=1,
}
ENT.ButtonMap["BackVent"] = {
    pos = Vector(270.2,27,47), --446 -- 14 -- -0,5
    ang = Angle(0,90,90),
    width = 80,
    height = 110,
    scale = 0.0625,
    hide=0.8,

    buttons = {
    {ID = "!VentCondMode",x=36, y=35, radius=0, model = {
        model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=10,ang=-91,
        sndvol = 0.8, snd = function(val) return val and "switch_batt_on" or "switch_batt_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        getfunc = function(ent) return ent:GetPackedRatio("VentCondMode") end,var="VentCondMode",
        speed=4, min=0.76,max=0.0
    }},
    {ID = "VentCondMode-",x=11,y=14,w=30,h=40,tooltip=""},
    {ID = "VentCondMode+",x=30,y=14,w=30,h=40,tooltip=""},
	--[[q{ID = "!VentHeatMode",x=80, y=59, radius=0,model = {
        model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=10,ang=-91,
        sndvol = 0.8, snd = function(val) return val and "switch_batt_on" or "switch_batt_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        --getfunc = function(ent) return ent:GetPackedRatio("VentHeatMode") end,
        var="VentHeatMode",
        speed=4, min=0.25,max=0.75
    }},
    {ID = "VentHeatMode+",x=50,y=40.5,w=30,h=40,tooltip="+"},
    {ID = "VentHeatMode-",x=80,y=40.5,w=30,h=40,tooltip="-"},
	]]
    {ID = "!VentStrengthMode",x=36, y=83, radius=0, model = {
        model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=10,ang=-91,
        sndvol = 0.8, snd = function(val) return val and "switch_batt_on" or "switch_batt_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        getfunc = function(ent) return ent:GetPackedRatio("VentStrengthMode") end,var="VentStrengthMode",
        speed=4, min=0.76,max=0.0
    }},
    {ID = "VentStrengthMode-",x=11,y=63,w=30,h=40,tooltip=""},
    {ID = "VentStrengthMode+",x=30,y=63,w=30,h=40,tooltip=""},
    }
}

ENT.ButtonMap["BackPPZ"] = {
    pos = Vector(270.1,22,35), --446 -- 14 -- -0,5
    ang = Angle(0,90,90),
    width = 400,
    height = 310,
    scale = 0.0625,
    hide=0.8,

	buttons = {
        {ID = "SF1Toggle",x=61.5+0*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF2Toggle",x=61.5+1*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF3Toggle",x=61.5+2*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF4Toggle",x=61.5+3*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF5Toggle",x=61.5+4*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF6Toggle",x=61.5+5*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF7Toggle",x=61.5+6*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF8Toggle",x=61.5+7*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF9Toggle",x=61.5+8*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF10Toggle",x=61.5+9*28.8, y=73, w=20,h=40, tooltip = "",},
        {ID = "SF11Toggle",x=61.5+10*28.8, y=73, w=20,h=40, tooltip = ""},

        {ID = "SF12Toggle",x=61.5+0*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF13Toggle",x=61.5+1*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF14Toggle",x=61.5+2*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF15Toggle",x=61.5+3*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF16Toggle",x=61.5+4*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF17Toggle",x=61.5+5*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF18Toggle",x=61.5+6*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF19Toggle",x=61.5+7*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF20Toggle",x=61.5+8*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF21Toggle",x=61.5+9*28.8, y=205, w=20,h=40, tooltip = "",},
        {ID = "SF22Toggle",x=61.5+10*28.8, y=205, w=20,h=40, tooltip = ""},
    }
}

for k,buttbl in ipairs(ENT.ButtonMap["BackPPZ"].buttons) do
    buttbl.model = {
        model = "models/metrostroi_train/81-720/button_av1.mdl",z=-18, ang=-90,
        var=buttbl.ID:Replace("Toggle",""),speed=9, vmin=0,vmax=1,
        sndvol = 0.8, snd = function(val) return val and "av_on" or "av_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
    }
end
ENT.ButtonMap["PVZ"] = {
    pos = Vector(270.1,25,-14), --446 -- 14 -- -0,5
    ang = Angle(0,90,90),
    width = 330,
    height = 160,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "SFV1Toggle",x=0*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV2Toggle",x=1*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV3Toggle",x=2*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV4Toggle",x=3*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV5Toggle",x=4*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV6Toggle",x=5*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV7Toggle",x=6*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV8Toggle",x=7*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV9Toggle",x=8*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV10Toggle",x=9*30, y=0, w=30,h=50, tooltip = "",},
        {ID = "SFV11Toggle",x=10*30, y=0, w=30,h=50, tooltip = ""},

        {ID = "SFV12Toggle",x=0*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV13Toggle",x=1*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV14Toggle",x=2*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV15Toggle",x=3*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV16Toggle",x=4*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV17Toggle",x=5*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV18Toggle",x=6*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV19Toggle",x=7*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV20Toggle",x=8*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV21Toggle",x=9*30, y=55, w=30,h=50, tooltip = "",},
        {ID = "SFV22Toggle",x=10*30, y=55, w=30,h=50, tooltip = ""},

        {ID = "SFV24Toggle",x=0*30, y=110, w=30,h=50, tooltip = "",},
        {ID = "SFV26Toggle",x=1*30, y=110, w=30,h=50, tooltip = "",},
        {ID = "SFV27Toggle",x=2*30, y=110, w=30,h=50, tooltip = "",},
        {ID = "SFV28Toggle",x=3*30, y=110, w=30,h=50, tooltip = "",},
        {ID = "SFV29Toggle",x=4*30, y=110, w=30,h=50, tooltip = "",},
        {ID = "SFV30Toggle",x=5*30, y=110, w=30,h=50, tooltip = "",},
        {ID = "SFV31Toggle",x=6*30, y=110, w=30,h=50, tooltip = "",},
        {ID = "SFV32Toggle",x=7*30, y=110, w=30,h=50, tooltip = "",},
        {ID = "SFV33Toggle",x=8*30, y=110, w=30,h=50, tooltip = "",},
		{ID = "SFV34Toggle",x=9*30, y=110, w=30,h=50, tooltip = "",},
		{ID = "SFV35Toggle",x=10*30, y=110, w=30,h=50, tooltip = ""},
    }
}
for k,buttbl in ipairs(ENT.ButtonMap["PVZ"].buttons) do
    buttbl.model = {
        model = "models/metrostroi_train/81-720/button_av1.mdl",z=-17, ang=-90,
        var=buttbl.ID:Replace("Toggle",""),speed=9, vmin=0,vmax=1,
        sndvol = 0.8, snd = function(val) return val and "av_on" or "av_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
    }
end

ENT.ButtonMap["BackDown"] = {
    pos = Vector(270.1,23,12), --446 -- 14 -- -0,5
    ang = Angle(0,90,90),
    width = 400,
    height = 350,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "Pant1Toggle",x=85, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="Pant1",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Pant2Toggle",x=120, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="Pant2",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vent2Toggle",x=158+30, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_b_a.mdl",z=-2.6, ang=180,
            var="Vent2",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "PassLightToggle",x=222, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="PassLight",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "CabLightToggle",x=260, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="CabLight",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		--[[{ID = "notused",x=145, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="notused",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		{ID = "notused1",x=170, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="notused1",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},]]
        {ID = "Headlights1Toggle",x=290, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="Headlights1",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Headlights2Toggle",x=330, y=62, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="Headlights2",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},

        {ID = "ParkingBrakeToggle",x=81, y=118, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="ParkingBrake",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "TorecDoorsToggle",x=115, y=118, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="TorecDoors",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "BBERToggle",x=152, y=118, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="BBER",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "BBEToggle",x=183, y=118, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="BBE",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "CompressorToggle",x=210, y=118, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="Compressor",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "CabLightStrengthToggle",x=250, y=118, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="CabLightStrength",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AppLights1Toggle",x=290, y=118, radius=12, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="AppLights1",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AppLights2Toggle",x=335, y=118, radius=12, tooltip = "", model = {
            model = "models/metrostroi_train/81-720/tumbler1.mdl",z=-2.6, ang=180,
            var="AppLights2",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_pvz_on" or "switch_pvz_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},


        {ID = "!BARSBlock",x=214, y=190, radius=0, model = {
            model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=12,
            getfunc = function(ent) return ent:GetPackedRatio("BARSBlock") end,var="BARSBlock",
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=-90,x=0,y=40,z=-5,var="BARSBlockPl", ID="BARSBlockPl",},
            speed=6, min=0.5,max=0.15,
            sndvol = 1, snd = function(_,val) return val==3 and "switch_batt_on" or val == 0 and "switch_batt_off" or "switch_batt" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "BARSBlock-",x=188,y=172,w=30,h=40,tooltip="",model={
            plomb = {var="BARSBlockPl", ID="BARSBlockPl", },
        }},
        {ID = "BARSBlock+",x=212,y=172,w=30,h=40,tooltip="", model={
            plomb = {var="BARSBlockPl", ID="BARSBlockPl", },
        }},
        {ID = "BatteryToggle",x=334, y=190, radius=20, tooltip = "",model = {
            model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=12, ang=45,
            var="Battery",speed=2,
            sndvol = 1, snd = function(val) return val and "switch_batt_on" or "switch_batt_off" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
            vmin=0.15, vmax=0
        }},

        {ID = "!ALSFreqBlock",x=334, y=294, radius=0,tooltip = "", model = {
            model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=4, ang=180,scale = 0.5,
            getfunc = function(ent) return ent:GetPackedRatio("ALSFreqBlock") end,var="ALSFreqBlock",
			plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=-90,x=0,y=14,z=-5.8,var="ALSFreqBlockPl", ID="ALSFreqBlockPl",},
            speed=6, min=0.9,max=0.6,
            sndvol = 1, snd = function(_,val) return val==3 and "switch_batt_on" or val == 0 and "switch_batt_off" or "switch_batt" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
			vmin=0.9, vmax=0
        }},
		{ID = "ALSFreqBlock-",x=344-25,y=302-20,w=15,h=22,tooltip="",model={
			plomb = {var="ALSFreqBlockPl", ID="ALSFreqBlockPl", }
        }},
        {ID = "ALSFreqBlock+",x=344-10,y=302-20,w=15,h=22,tooltip="", model={
			plomb = {var="ALSFreqBlockPl", ID="ALSFreqBlockPl", }
        }},
    }
}
ENT.ButtonMap["VityazButtons"] = {
    pos = Vector(340.7,-6.1,-4),
    ang = Angle(0,-89,33),
    width = 120,
    height = 90,
    scale = 0.0625,
    hideseat=0.2,
    buttons = {
        {ID = "VityazF1Set",x=1, y=-4, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_f1.mdl",z=0, ang=0,var="VityazF1",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz3_press" or "button_vityaz3_release" end,sndmin = 40, --sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "VityazF2Set",x=1, y=13, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_f2.mdl",z=0, ang=0,var="VityazF2",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz2_press" or "button_vityaz2_release" end,sndmin = 40, --sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "VityazF3Set",x=1, y=30, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_f3.mdl",z=0, ang=0,var="VityazF3",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz1_press" or "button_vityaz1_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "VityazF4Set",x=1, y=47, w=20,h=20, tooltip = "",model = {
           -- model = "models/metrostroi_train/81-720/vyitaz/v_f4.mdl",z=0, ang=0,var="VityazF4",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz4_press" or "button_vityaz4_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},

        {ID = "Vityaz1Set",x=40, y=-4, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_1.mdl",z=0, ang=0, var="Vityaz1",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz1_press" or "button_vityaz1_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz4Set",x=40, y=13, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_4.mdl",z=0, ang=0, var="Vityaz4",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz2_press" or "button_vityaz2_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz7Set",x=40, y=30, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_7.mdl",z=0, ang=0, var="Vityaz7",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz1_press" or "button_vityaz1_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz2Set",x=58, y=-4, w=20,h=20, tooltip = "",model = {
           -- model = "models/metrostroi_train/81-720/vyitaz/v_2.mdl",z=0, ang=0, var="Vityaz2",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz3_press" or "button_vityaz3_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz5Set",x=58, y=13, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_5.mdl",z=0, ang=0, var="Vityaz5",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz1_press" or "button_vityaz1_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz8Set",x=58, y=30, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_8.mdl",z=0, ang=0, var="Vityaz8",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz4_press" or "button_vityaz4_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz0Set",x=58, y=47, w=20,h=20, tooltip = "",model = {
           -- model = "models/metrostroi_train/81-720/vyitaz/v_0.mdl",z=0, ang=0, var="Vityaz0",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz2_press" or "button_vityaz2_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz3Set",x=76, y=-4, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_3.mdl",z=0, ang=0, var="Vityaz3",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz3_press" or "button_vityaz3_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz6Set",x=76, y=13, w=20,h=20, tooltip = "",model = {
           -- model = "models/metrostroi_train/81-720/vyitaz/v_6.mdl",z=0, ang=0, var="Vityaz6",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz4_press" or "button_vityaz4_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "Vityaz9Set",x=76, y=30, w=20,h=20, tooltip = "",model = {
           -- model = "models/metrostroi_train/81-720/vyitaz/v_9.mdl",z=0, ang=0, var="Vityaz9",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz1_press" or "button_vityaz1_release" end,sndmin = 40, --sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "VityazF5Set",x=76, y=47, w=20,h=20, tooltip = "",model = {
          --  model = "models/metrostroi_train/81-720/vyitaz/v_f5.mdl",z=0, ang=0, var="VityazF5",speed=16,
			sndvol = 1, snd = function(val) return val and "button_vityaz3_press" or "button_vityaz3_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "VityazF6Set",x=96, y=-4, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_f6.mdl",z=0, ang=0, var="VityazF6",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz2_press" or "button_vityaz2_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "VityazF7Set",x=96, y=13, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_f7.mdl",z=0, ang=0, var="VityazF7",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz4_press" or "button_vityaz4_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "VityazF8Set",x=96, y=30, w=20,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_f8.mdl",z=0, ang=0, var="VityazF8",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz1_press" or "button_vityaz1_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "VityazF9Set",x=80, y=70, w=35,h=20, tooltip = "",model = {
            --model = "models/metrostroi_train/81-720/vyitaz/v_f9.mdl",z=0, ang=0, var="VityazF9",speed=16,
            sndvol = 1, snd = function(val) return val and "button_vityaz2_press" or "button_vityaz2_release" end,sndmin = 40, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
    }
}

ENT.ButtonMap["BTO"] = {
    pos = Vector(320,-21,-42), --446 -- 14 -- -0,5
    ang = Angle(0,0,0),
    width = 224,
    height = 50,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "K29Toggle", x=24,  y=26, radius=45, tooltip="", model = {
            model = "models/metrostroi_train/81-720/720_cran.mdl", ang=-90,
            var="K29",speed=4, max=0.28
        }},
        {ID = "UAVAToggle", x=24+200,  y=26, radius=45, tooltip="", model = {
            model = "models/metrostroi_train/81-720/720_cran.mdl", ang=-90,
            plomb = {var="UAVAPl", ID="UAVAPl", },
            var="UAVA",speed=4, max=0.28
        }},
    }
}

ENT.ButtonMap["FrontPneumatic"] = {
    pos = Vector(366,-45.0,-44),
    ang = Angle(0,90,90),
    width = 800,
    height = 100,
    scale = 0.1,
    hideseat=0.2,
    hide=true,
    screenHide = true,

    buttons = {
        {ID = "FrontBrakeLineIsolationToggle",x=100, y=0, w=300, h=100, tooltip=""},
        {ID = "FrontTrainLineIsolationToggle",x=500, y=0, w=300, h=100, tooltip=""},
    }
}
ENT.ClientProps["FrontBrake"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_red.mdl",
    pos = Vector(365, -20, -55), -- (-23) старое значение по Y
    ang = Angle(15,-90,0),
	scale = 0.65,
    hide = 2,
}
ENT.ClientProps["FrontTrain"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_blue.mdl",
    pos = Vector(365, 20, -55), --23 старое значение по Y
    ang = Angle( -15,-90,0),
	scale = 0.65,
    hide = 2,
}
ENT.ClientSounds["FrontBrakeLineIsolation"] = {{"FrontBrake",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}
ENT.ClientSounds["FrontTrainLineIsolation"] = {{"FrontTrain",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}


ENT.ButtonMap["RearPneumatic"] = {
    pos = Vector(-320,45,-46),
    ang = Angle(180,90,270),
    width = 900,
    height = 100,
    scale = 0.1,
    hideseat=0.2,
    hide=true,
    screenHide = true,

    buttons = {
        {ID = "RearTrainLineIsolationToggle",x=500, y=0, w=400, h=100, tooltip=""},
        {ID = "RearBrakeLineIsolationToggle",x=000, y=0, w=400, h=100, tooltip=""},
    }
}
ENT.ClientProps["RearTrain"] = {
    model = "models/metrostroi_train/bogey/disconnect_valve_blue.mdl",
    pos = Vector(-320, -30, -57), 
    ang = Angle(-15,90,0),
    hide = 2,
}
ENT.ClientProps["RearBrake"] = {
    model = "models/metrostroi_train/bogey/disconnect_valve_red.mdl",
    pos = Vector(-320, 30, -57),
    ang = Angle( 15,90,0),
    hide = 2,
}
ENT.ClientSounds["RearBrakeLineIsolation"] = {{"RearBrake",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}
ENT.ClientSounds["RearTrainLineIsolation"] = {{"RearTrain",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}

--[[ENT.ButtonMap["PassengerDoor"] = {
    pos = Vector(380,-55,40), --28
    ang = Angle(0,90,90),
    width = 730,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "PassengerDoor",x=0,y=0,w=730,h=2000, tooltip="Дверь в кабину машиниста из салона\nPass door", model = {
            var="PassengerDoor",sndid="door_cab_m",
            sndvol = 1, snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}

ENT.ButtonMap["PassengerDoor2"] = {
    pos = Vector(380,-18.5,40), --28
    ang = Angle(0,-90,90),
    width = 730,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "PassengerDoor",x=0,y=0,w=730,h=2000, tooltip="Дверь в кабину машиниста из салона\nPass door"},
    }
}

if not ENT.ClientSounds["OtsekDoor"] then ENT.ClientSounds["OtsekDoor"] = {} end --FIXME перенести нахуй в шеерд
table.insert(ENT.ClientSounds["OtsekDoor"],{"door_cab_o",function(ent,var) return var>0 and "door_cab_open" or "door_cab_close" end,1,1,90,1e3,Angle(-90,0,0)})
]]
ENT.ButtonMap["CabinDoorL"] = {
    pos = Vector(275,59.6,55),
    ang = Angle(0,00,94),
    width = 900,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoorLeft",x=0,y=0,w=900,h=2000, tooltip="", model = {
            var="CabinDoorLeft",sndid="door_cab_l",
            sndvol = 1, snd = function(_,val) return val == 1 and "door_cab_open" or val == 2 and "door_cab_roll" or val == 0 and "door_cab_close" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(0,0,0),
        }},
    }
}
ENT.ButtonMap["CabinDoorL2"] = {
    pos = Vector(320,60,55),
    ang = Angle(0,180,86),
    width = 900,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoorLeft",x=0,y=0,w=900,h=2000, tooltip="", model = {
            var="CabinDoorLeft",sndid="door_cab_l",
            sndvol = 1, snd = function(_,val) return val == 1 and "door_cab_open" or val == 2 and "door_cab_roll" or val == 0 and "door_cab_close" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(0,0,0),
        }},
    }
}
ENT.ButtonMap["CabinDoorR"] = {
    pos = Vector(320,-59.5,52),
    ang = Angle(0,180,94),
    width = 900,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoorRight",x=0,y=0,w=900,h=2000, tooltip="", model = {
            var="CabinDoorRight",sndid="door_cab_r",
            sndvol = 1, snd = function(_,val) return val == 1 and "door_cab_open" or val == 2 and "door_cab_roll" or val == 0 and "door_cab_close" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["CabinDoorR2"] = {
    pos = Vector(275,-60,52),
    ang = Angle(0,0,86),
    width = 900,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoorRight",x=0,y=0,w=900,h=2000, tooltip="", model = {
            var="CabinDoorRight",sndid="door_cab_r",
            sndvol = 1, snd = function(_,val) return val == 1 and "door_cab_open" or val == 2 and "door_cab_roll" or val == 0 and "door_cab_close" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}

--[[ENT.ButtonMap["RearDoor"] = {
    pos = Vector(-465,16,42),
    ang = Angle(0,-90,90),
    width = 0,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "RearDoor",x=0,y=0,w=642,h=2000, tooltip="Передняя дверь\nFront door", model = {
            var="RearDoor",sndid="door_cab_t",
            sndvol = 1, snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["RearDoor1"] = {
    pos = Vector(-465,16-32,42),
    ang = Angle(0,90,90),
    width = 642,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "RearDoor",x=0,y=0,w=642,h=2000, tooltip="Передняя дверь\nFront door"},
    }
}

for i=0,3 do
    ENT.ClientProps["TrainNumberL"..i] = {
        model = "models/metrostroi_train/common/bort_numbers.mdl",
        pos = Vector(57+i*6.6-4*6.6/2,66.3,18),
        ang = Angle(0,180,-5),
        skin=1,
        hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
    }
end
]]
for i=0,3 do
    ENT.ClientProps["TrainNumberR"..i] = {
        model = "models/metrostroi_train/common/bort_numbers.mdl",
        pos = Vector(50+i*6.6-4*6.6/2,-66.3,14),
        ang = Angle(0,0,-3.2),
        skin=1,
        hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
    }
end

ENT.ClientProps["lamp_f"] = {
    model = "models/metrostroi_train/81-720/lamp_revers_up.mdl",
    pos = Vector(-131.62, 4.35, 21.19),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["lamp_b"] = {
    model = "models/metrostroi_train/81-720/lamp_revers_down.mdl",
    pos = Vector(-131.80, 4.35, 21.1),
    ang = Angle(0,0,0),
    hideseat=0.8,
}

ENT.ClientProps["fireextinguisher"] = {
    model = "models/metrostroi_train/81-502/fireextinguisher.mdl",
    pos = Vector(-65,33.1,7.6),
    ang = Angle(0,0,0),
    hideseat = 0.8,
}
ENT.ClientProps["fireextinguisher2"] = {
    model = "models/metrostroi_train/81-502/fireextinguisher.mdl", scale=0.9,
    pos = Vector(592.8,-222.5,2.9),
    ang = Angle(0,140,0),
    hideseat = 0.8,
}
--1st april cabin bucket
if os.date( "%m-%d" ) == "04-01" then
ENT.ClientProps["april_bucket"] = {
    model = "models/props_junk/metalbucket01a.mdl",
    pos = Vector(343,-45,-10.58),
    ang = Angle(0,0,0),
    hideseat = 0.8,
}
print("happy bucket day!")
end

---Segments
ENT.ClientProps["speed1"] = {
    model = "models/metrostroi_train/81-720/digits/digit.mdl",
    pos = Vector(345.45, 17.1+0.095, -1),
    ang = Angle(140,0,0),
    color = Color(20,255,50),
    hideseat = 0.2,
}
ENT.ClientProps["speed2"] = {
    model = "models/metrostroi_train/81-720/digits/digit.mdl",
    pos = Vector(345.45, 16.77-0.095, -1),
    ang = Angle(140,0,0),
    color = Color(20,255,50),
    hideseat = 0.2,
}

for i=1,5 do
    ENT.ClientProps["speeddop"..i] = {
        model = "models/metrostroi_train/81-720/segments/speed_red.mdl",
        pos = Vector(-120.79, 1.32*(i-1)+1.5, 103.65),
        ang = Angle(10,0,0),
        skin = 0,
        color = Color(255,55,55),
        hideseat = 0.8,
    }
end
for i=1,5 do
    ENT.ClientProps["speedfact"..i] = {
        model = "models/metrostroi_train/81-720/segments/speed_green.mdl",
        pos = Vector(-120.84, -1.32*(i-1)+1.55, 103.62),
        ang = Angle(10,0,0),
        skin = 0,
        color = Color(90,255,80),
        hideseat = 0.8,
    }
end
for i=1,5 do
    ENT.ClientProps["speedrek"..i] = {
        model = "models/metrostroi_train/81-720/segments/speed_yellow.mdl",
        pos = Vector(-121, 1.32*(i-1)+1.5, 103.53),
        ang = Angle(10,0,0),
        skin = 0,
        color = Color(255,255,60),
        hideseat = 0.8,
    }
end

ENT.ClientProps["brake_cylinder"] = {
    model = "models/metrostroi_train/equipment/arrow_nm.mdl",
    pos = Vector(322.82,58.98,12.90),
    ang = Angle(-45.000000,0.000000,-270.000000),
    hideseat = 0.2,
}

ENT.ClientProps["train_line"] = {
    model = "models/metrostroi_train/equipment/arrow_nm.mdl",
    pos = Vector(322.94,58.57,20.10),
    ang = Angle(-40.000000,0.000000,-270.000000),
    hideseat = 0.2,
}

ENT.ClientProps["brake_line"] = {
    model = "models/metrostroi_train/equipment/arrow_tm.mdl",
    pos = Vector(322.94,58.56,20.10),
    ang = Angle(-40.000000,0.000000,-270.000000),
    hideseat = 0.2,
}

--Вольтаж
ENT.ClientProps["volt_lv"] = {
    model = "models/metrostroi_train/81-710/ezh3_voltages.mdl",
    pos = Vector(324,61.35,0.85),
    ang = Angle(41.227245,0,92.130653),
    hideseat = 0.2,
}--1,0.712

ENT.ClientProps["volt_batt_case"] = {
    model = "models/metrostroi_train/81-740/cabine/electric/voltm2.mdl",
    pos = Vector(325,61.4,2),
    ang = Angle(-3,90,0),
    hideseat = 0.2,
}--1,0.712

ENT.ClientProps["volt_hv"] = {
    model = "models/metrostroi_train/81-710/ezh3_voltages.mdl",
    pos = Vector(323.97,61.60,-3.20),
    ang = Angle(46.156513,0,94.116631),
    hideseat = 0.2,
}--1,0.733

ENT.ClientProps["volt_rail_case"] = {
    model = "models/metrostroi_train/81-740/cabine/electric/voltm.mdl",
    pos = Vector(325,61.65,-2),
    ang = Angle(-3,90,0),
    hideseat = 0.2,
}--1,0.712

ENT.ClientProps["amp_i13"] = {
    model = "models/metrostroi_train/81-710/ezh3_voltages.mdl",
    pos = Vector(324,61.85,-7.2),
    ang = Angle(42.932121,0,94.116631),
    hideseat = 0.2,
}--1,0.722

ENT.ClientProps["amp_engine_case"] = {
    model = "models/metrostroi_train/81-740/cabine/electric/amperm.mdl",
    pos = Vector(325,61.9,-6),
    ang = Angle(-3,90,0),
    hideseat = 0.2,
}--1,0.712

---Доп. модели
ENT.ClientProps["PPZpanel"] = {
    model = "models/metrostroi_train/81-740/cabine/electric/paneltex.mdl",
    pos = Vector(270,50,50),
    ang = Angle(180,270,0),
    scale = 1,
    hide = 1,
}
--ИГЛА

ENT.ClientProps["PPZpanel_IGLA"] = {
    model = "models/metrostroi_train/81-740/cabine/electric/IGLA.mdl",
    pos = Vector(270.4,38,40.5),
    ang = Angle(0,180,0),
    scale = 1,
    hide = 1,
}

ENT.ClientProps["manometresp"] = {
    model = "models/metrostroi_train/81-740/cabine/monometres.mdl",
    pos = Vector(324.5,58.3,15),
    ang = Angle(0,0,2),
    scale = 1,
    hide = 1,
}

ENT.ClientProps["vityazpanel"] = {
    model = "models/metrostroi_train/81-740/cabine/cralix/vityazpanel.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    scale = 1,
    hide = 1,
}

ENT.ClientProps["redlights740"] = {
    model = "models/metrostroi_train/81-740/body/cralix/headlights81-740up.mdl",
    pos = Vector(-0.03,0,0),
    ang = Angle(0,0,0),
    scale = 1,
    nohide=true,
}

ENT.ClientProps["redlights7401"] = {
    model = "models/metrostroi_train/81-740/body/cralix/headlights81-740down.mdl",
    pos = Vector(-0.03,0,0),
    ang = Angle(0,0,0),
    scale = 1,
    nohide=true,
}
--[[ENT.ButtonMap["EmergencyBrakeValve"] = {
	pos = Vector(325,-60,15), --446 -- 14 -- -0,5
	ang = Angle(0,180,90),
	width = 110,
	height = 150,
	scale = 0.0625,
	hideseat=0.2,

	buttons = {
		{ID = "EmergencyBrakeValveToggle", x=0,  y=0, w=110,h=150, tooltip="Стопкран"},
	}
}]]--
ENT.ClientProps["EmergencyBrakeValve"] = {
	model = "models/metrostroi_train/81-740/cabine/StopKran.mdl",
	pos = Vector(730,-58.8,2),--Vector(455,-55.2,26),
	ang = Angle(0,180,2),
	hide=1,
}
ENT.ClientProps["stopkran"] = {
    model = "models/metrostroi_train/81-717/stop_mvm.mdl",
    pos = Vector(321.5,-59.7,13.2),
    ang = Angle(0,180,2),
	hide=1,
}
--ENT.ClientSounds["EmergencyBrakeValve"] = {{"stopkran",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}
--[[
ENT.ClientProps["PassSchemes"] = {
    model = "models/metrostroi_train/81-720/720_sarmat_l.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide = 1.5,
    callback = function(ent)
        ent.PassSchemesDone = false
    end,
}
ENT.ClientProps["PassSchemesR"] = {
    model = "models/metrostroi_train/81-720/720_sarmat_r.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide = 1.5,
    callback = function(ent)
        ent.PassSchemesDone = false
    end,
}
]]
ENT.ButtonMap["GV"] = {
    pos = Vector(128,63,-52-15),
    ang = Angle(0,180,90),
    width = 170,
    height = 150,
    scale = 0.1,
    buttons = {
        {ID = "GVToggle",x=0, y=0, w= 170,h = 150, tooltip="Разъединитель БРУ (ГВ)", model = {
            var="GV",sndid = "gv_wrench",
            sndvol = 0.8,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
            snd = function(val) return val and "gv_f" or "gv_b" end,
        }},
    }
}

ENT.ClientProps["gv_wrench"] = {
    model = "models/metrostroi/81-717/reverser.mdl",
    pos = Vector(126.4,50,-60-23.5),
    ang = Angle(0,90,0),
    hide = 0.5,
}
ENT.ClientProps["door_cab_m"] = {
    model = "", --models/metrostroi_train/81-720/720_door_cab.mdl
    pos = Vector(374.9,-45.5+25.5,-12.3),
    ang = Angle(0,-90-1,0)
}
ENT.ClientProps["door_cab_o"] = {
    model = "", --models/metrostroi_train/81-720/720_cab_otsek.mdl
    pos = Vector(374.9,26,-15),
    ang = Angle(0,-90+0.45,-0.15)
}


ENT.ClientProps["KRO"] = {
    model = "models/metrostroi_train/81-740/cabine/pult/tum_r.mdl",
    pos = Vector(339.8,46.8,-4.8),
    ang = Angle(150,0,180),
    hideseat = 0.2,
}
ENT.ClientProps["KRR"] = {
    model = "models/metrostroi_train/81-740/cabine/pult/tum_r_rad.mdl",
    pos = Vector(336.55,46.8,-6.8),
    ang = Angle(150,0,180),
    hideseat = 0.2,
}
ENT.ClientProps["controller"] = {
    model = "models/metrostroi_train/81-720/720_kv.mdl",
    pos = Vector(331.4,23,-6.5),
    ang = Angle(0.000000,-90.000000,23.699429),
    hideseat = 0.2,
}

ENT.ClientProps["km013"] = {
    model = "models/metrostroi_train/81-720/720_km013.mdl",
    pos = Vector(315,-8,-24),
    ang = Angle(180,90,-110),
    hideseat = 0.2,
}
if not ENT.ClientSounds["br_013"] then ENT.ClientSounds["br_013"] = {} end
table.insert(ENT.ClientSounds["br_013"],{"km013",function(ent,_,var) return "br_013" end,1,1,50,1e3,Angle(-90,0,0)})

ENT.ClientProps["PB"] = {
    model = "models/metrostroi_train/81-720/720_pb.mdl",
    pos = Vector(340.138672,35.572510,-30),
    ang = Angle(0.000000,-90.000000,0.000000),
    hideseat = 0.2,
}
if not ENT.ClientSounds["PB"] then ENT.ClientSounds["PB"] = {} end
table.insert(ENT.ClientSounds["PB"],{"PB",function(ent,var) return var > 0 and "pb_on" or "pb_off" end,1,1,30,1e3,Angle(-90,0,0)})
local yventpos = {
    -414.5+0*117,
    -414.5+1*117+6.2,
    -414.5+2*117+5,
    -414.5+3*117+2,
    -414.5+4*117+0.5,
    -414.5+5*117-2.3,
    -414.5+6*117-2.3,
}

--------------------------------------------------------------------------------
-- Add doors
--------------------------------------------------------------------------------
local function GetDoorPosition(i,k,j)
    if j == 0
	then return Vector(184 - 35.0*k     - 338*i,-67.5*(1-2*k),4.3)

	else return Vector(184 - 35.0*(1-k) - 338*i,-66*(1-2*k),4.25)
    end
end


 ENT.Lights = {
    [1] = { "headlight",	Vector(358,0,-15),Angle(0,0,0),Color(216,161,92),farz=5244,brightness = 4.5, fov=120, texture = "models/metrostroi_train/equipment/headlight",shadows = 1,headlight=true}, --Фары
    [2] = { "headlight",    Vector(347,0,50), Angle(-1,0,0), Color(255,0,0), fov=170 ,brightness = 0.3, farz=450,texture = "models/metrostroi_train/equipment/headlight2",shadows = 0,backlight=true}, --Красные фары 
    [3] = { "headlight",    Vector(358,40,43.9), Angle(50,40,-0), Color(206,135,80), fov=100,farz=200,brightness = 0,shadows=1}, --отсеки
}

ENT.ButtonMap["CAMS"] = {
    pos = Vector(343.6,51.1,10.58),
    ang = Angle(0,-58,90),
    width = 1024,
    height = 768,
    scale = 0.012,
	system = "CAMS",
	hide=0.5,
}
ENT.ButtonMap["Vityaz"] = {
	pos = Vector(350.66,-7.66,11.85),
    ang = Angle(0,-123,90),
    width = 0,
    height = 0,
    scale = 0.007,    
    hideseat = 0.2,
}
function ENT:Initialize()
    self.BaseClass.Initialize(self)
    self.Vityaz = self:CreateRT("721Vityaz",977,1024)
    self.ASNP = self:CreateRT("721ASNP",512,128)
	self.IGLA = self:CreateRT("717IGLA",512,128)
    self.Tickers = self:CreateRT("721Ticker",1024,64)
	self.CAMS = self:CreateRT("740CAMS",1024,768)
    render.PushRenderTarget(self.Tickers,0,0,1024, 64)
    render.Clear(0, 0, 0, 0)
    render.PopRenderTarget()
    self.ReleasedPdT = 0
    self.CraneRamp = 0
    self.CraneRRamp = 0
    self.ReleasedPdT = 0
	
	self.EmergencyValveRamp = 0
	self.StopKranValveRamp = 0
	self.EmergencyValveEPKRamp = 0
	self.EmergencyBrakeValveRamp = 0
    self.FrontLeak = 0
    self.RearLeak = 0

    self.ParkingBrake = 0

    self.PreviousRingState = false
    self.PreviousCompressorState = false
    self.TISUVol = 0

    self.VentRand = {}
    self.VentState = {}
    self.VentVol = {}
    for i=1,7 do
        self.VentRand[i] = math.Rand(0.5,2)
        self.VentState[i] = 0
        self.VentVol[i] = 0
    end
	self.skinarecalled = false
end
function ENT:UpdateWagonNumber()
    for i=0,3 do
        --self:ShowHide("TrainNumberL"..i,i<count)
        --self:ShowHide("TrainNumberR"..i,i<count)
        --if i< count then
            local num = math.floor(self.WagonNumber%(10^(i+1))/10^i)
            local rightNum = self.ClientEnts["TrainNumberR"..i]
            if IsValid(rightNum) then
                rightNum:SetPos(self:LocalToWorld(Vector(238-i*6.6+4*6.6/2,-63.8,14)))
                rightNum:SetSkin(num)
            end
    end
end
local Cpos = {
    0,0.24,0.5,0.55,0.6,1
}
local lasttimetextureloaded = os.clock()
function ENT:Think()
    self.BaseClass.Think(self)
	Metrostroi740LoadTextures(self, skinsarecalled)
	
	self.skinarecalled = true
	self.ClientProps["body"] = {
    model = self:GetNW2String("skin_body_740", "models/metrostroi_train/81-740/body/81-740_4_defualt_mos.mdl") ,
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
	skin = self:GetNWInt("skin_skin_body", 0),
    hide=1,
}
for i=0,1 do
    for k=0,1 do
        self.ClientProps["door"..i.."x"..k.."a"] = {
			model = self:GetNW2String("skin_door_pass_2", "models/metrostroi_train/81-740/body/81-740_leftdoor2.mdl"),
			pos = GetDoorPosition(i,k,0),
			ang = Angle(0,90 +180*k,0),
			skin = self:GetNWInt("skin_skin_body", 0),
            hide = 1,
		}
		self.ClientProps["door"..i.."x"..k.."b"] = {
			model = self:GetNW2String("skin_door_pass_1", "models/metrostroi_train/81-740/body/81-740_leftdoor1.mdl"),
			pos = GetDoorPosition(i,k,1),
			ang = Angle(0,90 +180*k,0),
			skin = self:GetNWInt("skin_skin_body", 0),
            hide = 1,
		}
    end
end

	self.ClientProps["door_cab_l"] = {
		model = self:GetNW2String("skin_door_left","models/metrostroi_train/81-740/cabine/cabin_left.mdl"),
		pos = Vector(297.0,62.29,0),
		ang = Angle(0,-89.7,0.25),
		skin = self:GetNWInt("skin_skin_body", 0),
		hide = 1
	}
	self.ClientProps["door_cab_r"] = {
		model = self:GetNW2String("skin_door_right","models/metrostroi_train/81-740/cabine/cabin_right.mdl"),
		pos = Vector(297.5, -65.98,0),
		ang = Angle(0,90,0.2),
		skin = self:GetNWInt("skin_skin_body", 0),
		hide = 1
	}
	self.ClientProps["Pult"] = {
		model = self:GetNW2String("skin_cabin_panel", "models/metrostroi_train/81-740/cabine/Pult/pult.mdl"),
		pos = Vector(-0.01,4.65,0),
		ang = Angle(0,0,0),
		skin = self:GetNWInt("skin_skin_panel", 0),
		hide=2,
	}
	
	self.ClientProps["handrails"] = {
		model = self:GetNW2String("skin_handrails_740", "models/metrostroi_train/81-740/salon/handrails/handrails.mdl"),
		pos = Vector(-97.5,-5,0),
		ang = Angle(0,0,0),
		skin = self:GetNWInt("skin_skin_interior", 0),
		hide=2,
	}

	self.ClientProps["salon"] = {
		model = self:GetNW2String("skin_interior_740", "models/metrostroi_train/81-740/salon/salon.mdl"),
		pos = Vector(0,-312,0),
		ang = Angle(0,0,0),
		skin = self:GetNWInt("skin_skin_interior", 0),
		hide=2,
	}
	
	--print(skin_body)
    if not self.RenderClientEnts or self.CreatingCSEnts then
        return
    end
	
	
--[[
    if not self.PassSchemesDone then
        local sarmat = self.ClientEnts.PassSchemes
        local sarmatr = self.ClientEnts.PassSchemesR
        local scheme = Metrostroi.Skins["720_schemes"] and Metrostroi.Skins["720_schemes"][self.Scheme]
        if IsValid(sarmat) and IsValid(sarmatr) and scheme then
            if self:GetNW2Bool("PassSchemesInvert") then
                sarmat:SetSubMaterial(0,scheme[2])
                sarmatr:SetSubMaterial(0,scheme[1])
            else
                sarmat:SetSubMaterial(0,scheme[1])
                sarmatr:SetSubMaterial(0,scheme[2])
            end
            self.PassSchemesDone = true
        end
    end


    if self.Scheme ~= self:GetNW2Int("Scheme",1) then
        self.PassSchemesDone = false
        self.Scheme = self:GetNW2Int("Scheme",1)
    end
    if self.InvertSchemes ~= self:GetNW2Bool("PassSchemesInvert",false) then
        self.PassSchemesDone=false
        self.InvertSchemes = self:GetNW2Bool("PassSchemesInvert",false)
    end
]]
	--print(self:GetNW2String("Skin_body"))
	
	
    self:SetLightPower(3,self.Door5 and self:GetPackedBool("AppLights"),self:GetPackedBool("AppLights") and 1 or 0)
    --ANIMS
    self:Animate("brake_line", self:GetPackedRatio("BL"), 0, 0.753,  256,2)
    self:Animate("train_line", self:GetPackedRatio("TL"),   0, 0.753,  4096,2)
    self:Animate("brake_cylinder", self:GetPackedRatio("BC"), 0, 0.746,  64,12)
	
	self:SetSoundState("ring_vityaz",self:GetPackedBool("BUKPRing",false) and 1.6 or 0,1)
	
	--Вольтаж
    self:Animate("volt_lv",self:GetPackedRatio("LV"),1,0.712,92,2)
    self:Animate("volt_hv",self:GetPackedRatio("HV"),1.0,0.722,94,4)
    self:Animate("amp_i13",self:GetPackedRatio("I13"),1,0.722,92,2)

    self:Animate("controller", (self:GetPackedRatio("Controller")+3.5)/8, 0, 0.375,  2.5,false)

    self:Animate("FrontBrake", self:GetNW2Bool("FbI") and 0 or 1,0,1, 3, false)
    self:Animate("FrontTrain",  self:GetNW2Bool("FtI") and 1 or 0,0,1, 3, false)
    self:Animate("RearBrake",   self:GetNW2Bool("RbI") and 0 or 1,0,1, 3, false)
    self:Animate("RearTrain",   self:GetNW2Bool("RtI") and 1 or 0,0,1, 3, false)

    if self.LastGVValue ~= self:GetPackedBool("GV") then
        self.ResetTime = CurTime()+1.5
        self.LastGVValue = self:GetPackedBool("GV")
    end
    self:Animate("gv_wrench",self.LastGVValue and 1 or 0,0.5,1,128,1,false)
    self:ShowHideSmooth("gv_wrench",    CurTime() < self.ResetTime and 1 or 0.1)
    --self:Animate("controller", (self:GetPackedRatio("Controller")+3)/6, 0.75, 0.15,  2,false)
    --self:SetPackedRatio("BL", self.Pneumatic.BrakeLinePressure/16.0)
    --self:SetPackedRatio("TL", self.Pneumatic.TrainLinePressure/16.0)
    --self:SetPackedRatio("BC", math.min(3.2,self.Pneumatic.BrakeCylinderPressure)/6.0)

    self:Animate("KRO", self:GetPackedRatio("KRO",0), 0.525, 1,  4,false)
    self:Animate("KRR", self:GetPackedRatio("KRR",0), 0.525, 1,  4,false)
    --self:ShowHide("KRO",self:GetNW2Int("Wrench",0) == 1)
    --self:ShowHide("KRR",self:GetNW2Int("Wrench",0) == 2)
    self:Animate("km013", Cpos[self:GetPackedRatio("Cran")] or 0, 0, 0.7,  2,false)
    self:Animate("PB",  self:GetPackedBool("PB") and 1 or 0,0,0.2,  8,false)
	
	--self:Animate("EmergencyBrakeValve", self:GetPackedBool("EmergencyBrakeValve") and 1 or 0, 0, 1,  6,false)

    self:ShowHide("lamps_salon_off",self:GetPackedRatio("SalonLighting") < 0.4)
    self:ShowHide("lamps_salon_on",self:GetPackedRatio("SalonLighting") >= 0.4)
	self:ShowHide("Antenna", self:GetNW2Bool("Antenna"))
	
	--[[local emergencyValveEPK = self:GetPackedRatio("EmergencyValveEPK_dPdT",0)
    self.EmergencyValveEPKRamp = math.Clamp(self.EmergencyValveEPKRamp + 1.0*((0.5*emergencyValveEPK)-self.EmergencyValveEPKRamp)*dT,0,1)
    if self.EmergencyValveEPKRamp < 0.01 then self.EmergencyValveEPKRamp = 0 end
    self:SetSoundState("epk_brake",self.EmergencyValveEPKRamp,1.0)

    local emergencyBrakeValve = self:GetPackedRatio("EmergencyBrakeValve_dPdT", 0)
    self.EmergencyBrakeValveRamp = math.Clamp(self.EmergencyBrakeValveRamp + (emergencyBrakeValve-self.EmergencyBrakeValveRamp)*dT*8,0,1)
    self:SetSoundState("valve_brake",self.EmergencyBrakeValveRamp,0.8+math.min(0.2,self.EmergencyBrakeValveRamp*0.8))
	self:SetSoundState("valve_brake_open",self.EmergencyBrakeValveRamp > 0.0001 and CurTime()-self:GetPackedRatio("EmerValve",1e9) < 0 and 1 or 0,1)

    local emergencyValve = self:GetPackedRatio("EmergencyValve_dPdT", 0)^0.4*1.2
    self.EmergencyValveRamp = math.Clamp(self.EmergencyValveRamp + (emergencyValve-self.EmergencyValveRamp)*dT*16,0,1)
    self:SetSoundState("emer_brake",self.EmergencyValveRamp,1.0)

    local stopkranValve = self:GetPackedRatio("stopkran_dPdT", 0)^0.4*1.2
    self.StopKranValveRamp = math.Clamp(self.StopKranValveRamp + (stopkranValve-self.StopKranValveRamp)*dT*16,0,1)
    self:SetSoundState("stopkran_brake",self.StopKranValveRamp,1.0)]]
    
    local cab_lamp = self:Animate("cab_lamp",self:GetPackedBool("CabinEnabledFull") and 1 or self:GetPackedBool("CabinEnabledEmer") and 0.5 or 0,0,1,5,false)
    self:ShowHideSmooth("cab_emer",cab_lamp)
    self:ShowHideSmooth("cab_full",cab_lamp)

    self:ShowHideSmooth("lamp_f",self:Animate("lamp_forw",self:GetPackedBool("BIForward") and 1 or 0,0,1,5,false))
    self:ShowHideSmooth("lamp_b",self:Animate("lamp_back",self:GetPackedBool("BIBack") and 1 or 0,0,1,5,false))

    local accel = self:GetPackedRatio("BIAccel",0)
    --if -0.05 < accel and accel < 0.05 then accel = 0 end
    local speed = self:GetNW2Int("BISpeed",0)--CurTime()%5*20
    local limit = self:GetNW2Int("BISpeedLimit",0)
	--[[
    if IsValid(self.ClientEnts["acceleration_minus1"]) and IsValid(self.ClientEnts["acceleration_minus2"]) then
        self.ClientEnts["acceleration_minus1"]:SetSkin(math.Clamp(-accel*14,0,10))
        self.ClientEnts["acceleration_minus2"]:SetSkin(math.Clamp(-accel*14-12,0,9))
    end
    if IsValid(self.ClientEnts["acceleration_plus1"]) and IsValid(self.ClientEnts["acceleration_plus2"]) then
        self.ClientEnts["acceleration_plus1"]:SetSkin(math.Clamp(accel*14,0,10))
        self.ClientEnts["acceleration_plus2"]:SetSkin(math.Clamp(accel*14-12,0,9))
    end
	]]
    self:ShowHide("speedl",speed ~= -1)
    self:ShowHide("speed1",speed ~= -1)
    self:ShowHide("speed2",speed ~= -1)
    if speed ~= -1 then
        local blink = self:GetNW2Bool("BISpeedLimitBlink")
        if blink and CurTime()%1 <=0.5 then
            limit = 98
        end
        local nxt = self:GetNW2Int("BISpeedLimitNext",0)
        for i=1,5 do
            if IsValid(self.ClientEnts["speeddop"..i]) then self.ClientEnts["speeddop"..i]:SetSkin(math.Clamp(50-limit/2-(i-1)*10,0,10)) end
            if IsValid(self.ClientEnts["speedfact"..i]) then self.ClientEnts["speedfact"..i]:SetSkin(math.Clamp(speed/2-(i-1)*10,0,10)) end
            if IsValid(self.ClientEnts["speedrek"..i]) then self.ClientEnts["speedrek"..i]:SetSkin(math.Clamp(50-nxt/2-(i-1)*10,0,10)) end
        end
        if IsValid(self.ClientEnts["speed1"]) then self.ClientEnts["speed1"]:SetSkin(speed/10) end
        if IsValid(self.ClientEnts["speed2"]) then self.ClientEnts["speed2"]:SetSkin(speed%10) end
    else
        for i=1,5 do
            if IsValid(self.ClientEnts["speeddop"..i]) then self.ClientEnts["speeddop"..i]:SetSkin(0) end
            if IsValid(self.ClientEnts["speedfact"..i]) then self.ClientEnts["speedfact"..i]:SetSkin(0) end
            if IsValid(self.ClientEnts["speedrek"..i]) then self.ClientEnts["speedrek"..i]:SetSkin(0) end
        end
    end

    local HL1 = self:Animate("Headlights1",self:GetPackedBool("Headlights1") and 1 or 0,0,1,6,false)
    local HL2 = self:Animate("Headlights2",self:GetPackedBool("Headlights2") and 1 or 0,0,1,6,false)
    local RL  = self:Animate("RedLights",  self:GetPackedBool("RedLights") and 1 or 0,0,1,6,false)
	
	self:ShowHideSmooth("Head--_-0", HL1 or 0)
	self:ShowHideSmooth("Head0-_--", HL1 or 0)
	self:ShowHideSmooth("Head--_0-", HL2 or 0)
	self:ShowHideSmooth("Head-0_--", HL2 or 0)
	
    self:ShowHideSmooth("redlights740",RL)
    self:ShowHideSmooth("redlights7401",RL)
    local headlights = HL1*0.5+HL2*0.5
    self:SetLightPower(1,headlights>0,headlights)
    self:SetLightPower(2,RL>0,RL)
    if IsValid(self.GlowingLights[1]) then
        if self:GetPackedRatio("Headlights") < 1 and self.GlowingLights[1]:GetFarZ() ~= 4096 then
            self.GlowingLights[1]:SetFarZ(4096)
        end
        if self:GetPackedRatio("Headlights") == 1 and self.GlowingLights[1]:GetFarZ() ~= 5144 then
            self.GlowingLights[1]:SetFarZ(5144)
        end
    end
--[[
    local scurr = self:GetNW2Int("PassSchemesLED")
    local snext = self:GetNW2Int("PassSchemesLEDN")
    local led_back = self:GetPackedBool("PassSchemesLEDO",false)
    if self:GetPackedBool("PassSchemesInvert",false)  then led_back = not led_back end
	]]
    --[[local ledwork = scurr~=0 or snext~=0
    for i=1,5 do
        self:ShowHide("led_l_f"..i,not led_back and ledwork)
        self:ShowHide("led_l_b"..i,led_back and ledwork)
        self:ShowHide("led_r_f"..i,not led_back and ledwork)
        self:ShowHide("led_r_b"..i,led_back and ledwork)
    end
	
    local led = scurr
    --if snext ~= 0 and CurTime()%.5 > .25 then led = led + snext end
    --if scurr < 0 then led = math.floor(CurTime()%5*6.2) end
    if led_back then
        if ledwork then
            for i=1,5 do
                if IsValid(self.ClientEnts["led_l_b"..i]) then self.ClientEnts["led_l_b"..i]:SetSkin(math.Clamp(led-((i-1)*6),0,6)) end
                if IsValid(self.ClientEnts["led_r_b"..i]) then self.ClientEnts["led_r_b"..i]:SetSkin(math.Clamp(led-((i-1)*6),0,6)) end
            end
        end
    else
        if ledwork then
            for i=1,5 do
                if IsValid(self.ClientEnts["led_l_f"..i]) then self.ClientEnts["led_l_f"..i]:SetSkin(math.Clamp(led-((i-1)*6),0,6)) end
                if IsValid(self.ClientEnts["led_r_f"..i]) then self.ClientEnts["led_r_f"..i]:SetSkin(math.Clamp(led-((i-1)*6),0,6)) end
            end
        end
    end]]
    --
    --print(self:GetPackedRatio("async2vol"), self:GetPackedRatio("async2"))
    if not self.DoorStates then self.DoorStates = {} end
    if not self.DoorLoopStates then self.DoorLoopStates = {} end
    for i=0,1 do
        for k=0,1 do
            local st = k==1 and "DoorL" or "DoorR"
            local doorstate = self:GetPackedBool(st)
            local id,sid = st..(i+1),"door"..i.."x"..k
            local state = self:GetPackedRatio(id)
            --print(state,self.DoorStates[state])
            if (state ~= 1 and state ~= 0) ~= self.DoorStates[id] then
                if doorstate and state < 1 or not doorstate and state > 0 then
					if doorstate then self:PlayOnce(sid.."s","",1,math.Rand(0.9,1.3)) end--math.Rand(0.9,1.3))
                else
                    if state > 0 then
                        self:PlayOnce(sid.."o1","",1,math.Rand(0.9,1.3))
                    else
                        local sound = math.random(1,3)
                        self:PlayOnce(sid.."c"..sound,"",1,math.Rand(0.9,1.3))
                    end
                end
                self.DoorStates[id] = (state ~= 1 and state ~= 0)
            end
            if (state ~= 1 and state ~= 0) then
                self.DoorLoopStates[id] = math.Clamp((self.DoorLoopStates[id] or 0) + 2*self.DeltaTime,0,1)
            else
                self.DoorLoopStates[id] = math.Clamp((self.DoorLoopStates[id] or 0) - 6*self.DeltaTime,0,1)
            end
            self:SetSoundState(sid.."r",self.DoorLoopStates[id],0.9+self.DoorLoopStates[id]*0.1)
            local n_l = "door"..i.."x"..k.."a"
            local n_r = "door"..i.."x"..k.."b"
            self:Animate(n_l,state,0,1,15,1)--0.8 + (-0.2+0.4*math.random()),0)
            self:Animate(n_r,state,0,1,15,1)--0.8 + (-0.2+0.4*math.random()),0)
        end
    end
    local door_m = self:GetPackedBool("PassengerDoor")
    local door_l = self:GetPackedBool("CabinDoorLeft")
    local door_r = self:GetPackedBool("CabinDoorRight")
    local door_o = self:GetPackedBool("OtsekDoor") or self.CurrentCamera == 7
    local door_t = self:GetPackedBool("RearDoor")
    local door_cab_m = self:Animate("door_cab_m",door_m and 1 or -0.05,0,0.235, 8, 0.05)

    local door_cab_l = self:Animate("door_cab_l",door_l	/*self:GetPackedBool(159)*/ and 0.99/*self.Door3 or 0.99)*/ or 0,0,1, 4, 1)               --self:Animate("door_cab_l",door_l and 1 or -0.1,1,0.75, 2, 0.5)
    local door_cab_r = self:Animate("door_cab_r",door_r	/*self:GetPackedBool(169)*/ and  0.99/*(self.Door4 or 0.99)*/ or 0,0,1, 4, 1)              --self:Animate("door_cab_r",door_r and 1 or -0.1,0,0.25, 2, 0.5)
    local door_cab_o = self:Animate("door_cab_o",door_o and 1 or -0.05,0,0.3, 8, 0.05)
    local door_cab_t = self:Animate("door_cab_t",door_t and 1 or -0.05,0,0.25, 8, 0.05)

    local door1s = (door_cab_m > 0 or door_m)
    if self.Door1 ~= door1s then
        self.Door1 = door1s
        self:PlayOnce("PassengerDoor","bass",door1s and 1 or 0)
    end
       
    local door_cab_l = self:Animate("door_cab_l",door_l    /*self:GetPackedBool(169)*/ and 0.99/*(self.Door3 or 0.99)*/ or 0,0,1, -2, 1)               --self:Animate("door_cab_l",door_l and 1 or -0.1,1,0.75, 2, 0.5)
    local door_cab_r = self:Animate("door_cab_r",door_r    /*self:GetPackedBool(169)*/ and 0.99/*(self.Door4 or 0.99)*/ or 0,0,1, -2, 1)              --self:Animate("door_cab_r",door_r and 1 or -0.1,0,0.25, 2, 0.5)
    local door2s = door_cab_l > 0.05 and door_cab_l and 2 or (door_cab_l == 1.95 and 2 or door_l and 1 or 0)
    if self.Door2 ~= door2s or self.DoorCL ~= door_l then
        self.DoorCL = door_l
        self.Door2 = door2s
        self:PlayOnce("CabinDoorRight","bass",door2s)
    end
    
    local door3s = door_cab_r > 0.05 and door_cab_r and 2 or (door_cab_r == 1.95 and 2 or door_r and 1 or 0)
    if self.Door3 ~= door3s or self.DoorCR ~= door_r then
        self.DoorCR = door_r
        self.Door3 = door3s
        self:PlayOnce("CabinDoorRight","bass",door3s)
    end
	
    local door4s = (door_cab_t > 0 or door_t)
    if self.Door4 ~= door4s then
        self.Door4 = door4s
        self:PlayOnce("RearDoor","bass",door4s and 1 or 0)
    end
    local door5s = (door_cab_o > 0 or door_o)
    if self.Door5 ~= door5s then
        self.Door5 = door5s
        self:PlayOnce("OtsekDoor","bass",door5s and 1 or 0)
    end
    self:HidePanel("PVZ",not self.Door5)

    local dT = self.DeltaTime

    local parking_brake = math.max(0,-self:GetPackedRatio("ParkingBrakePressure_dPdT",0))
    self.ParkingBrake = self.ParkingBrake+(parking_brake-self.ParkingBrake)*dT*10
    self:SetSoundState("parking_brake",self.ParkingBrake,1.4)

    self.FrontLeak = math.Clamp(self.FrontLeak + 10*(-self:GetPackedRatio("FrontLeak")-self.FrontLeak)*dT,0,1)
    self.RearLeak = math.Clamp(self.RearLeak + 10*(-self:GetPackedRatio("RearLeak")-self.RearLeak)*dT,0,1)
    self:SetSoundState("front_isolation",self.FrontLeak,0.9+0.2*self.FrontLeak)
    self:SetSoundState("rear_isolation",self.RearLeak,0.9+0.2*self.RearLeak)

    local ramp = self:GetPackedRatio("Crane_dPdT",0)
    if ramp > 0 then
        self.CraneRamp = self.CraneRamp + ((0.2*ramp)-self.CraneRamp)*dT
    else
        self.CraneRamp = self.CraneRamp + ((0.9*ramp)-self.CraneRamp)*dT
    end
    self.CraneRRamp = math.Clamp(self.CraneRRamp + 1.0*((1*ramp)-self.CraneRRamp)*dT,0,1)
    self:SetSoundState("crane013_release",self.CraneRRamp^1.5,1.0)
    self:SetSoundState("crane013_brake",math.Clamp(-self.CraneRamp*1.5,0,1)^1.3,1.0)
    self:SetSoundState("crane013_brake2",math.Clamp(-self.CraneRamp*1.5-0.95,0,1.5)^2,1.0)

    local emergencyValve = self:GetPackedRatio("EmergencyValve_dPdT", 0)^0.4*1.2
    self.EmergencyValveRamp = math.Clamp(self.EmergencyValveRamp + (emergencyValve-self.EmergencyValveRamp)*dT*16,0,1)
    self:SetSoundState("emer_brake",self.EmergencyValveRamp,1.0)


    local state = self:GetPackedBool("RingEnabled")
    self:SetSoundState("ring",state and 0.40 or 0,1)
    local state = self:GetPackedBool("CompressorWork")
    self:SetSoundState("compressor",state and 1.0 or 0,1)
    local state = self:GetPackedBool("WorkBeep")
    self:SetSoundState("work_beep",state and 1 or 0,1)


    local speed = self:GetPackedRatio("Speed", 0)

    local ventSpeedAdd = math.Clamp(speed/30,0,1)

    local v2state = self:GetPackedBool("Vent2Work")
    for i=1,7 do
        local rand = self.VentRand[i]
        local vol = self.VentVol[i]
        local even = i%2 == 0
        local work = (even and v1state or not even and v2state)
        local target = math.min(1,(work and 1 or 0)+ventSpeedAdd*rand*0.4)*2
        if self.VentVol[i] < target then
            self.VentVol[i] = math.min(target,vol + dT/1.5*rand)
        elseif self.VentVol[i] > target then
            self.VentVol[i] = math.max(0,vol - dT/8*rand*(vol*0.3))
        end
        self.VentState[i] = (self.VentState[i] + 10*((self.VentVol[i]/2)^3)*dT)%1
        local vol1 = math.max(0,self.VentVol[i]-1)
        local vol2 = math.max(0,(self.VentVol[i-1] or self.VentVol[i+1])-1)
        self:SetSoundState("vent"..i,vol1*(0.7+vol2*0.3),0.5+0.5*vol1+math.Rand(-0.01,0.01))
        if IsValid(self.ClientEnts["vent"..i]) then
            self.ClientEnts["vent"..i]:SetPoseParameter("position",self.VentState[i])
        end
    end
    --Vector(409,25.6,-26.3)
    local speed = self:GetPackedRatio("Speed", 0)
    --local rol10 = math.Clamp(speed/5,0,1)*(1-math.Clamp((speed-50)/8,0,1))
    --local rol70 = math.Clamp((speed-50)/8,0,1)
    local rollingi = math.min(1,self.TunnelCoeff+math.Clamp((self.StreetCoeff-0.82)/0.5,0,1))
    local rollings = math.max(self.TunnelCoeff*0.6,self.StreetCoeff)
    --local tunstreet = (rollingi+rollings*0.2)
    local rol10 = math.Clamp(speed/12,0,1)*(1-math.Clamp((speed-20)/12,0,1))
    local rol10p = Lerp((speed-12)/12,0.9,1.1)
    local rol30 = math.Clamp((speed-20)/12,0,1)*(1-math.Clamp((speed-40)/12,0,1))
    local rol30p = Lerp((speed-15)/30,0.8,1.2)
    local rol55 = math.Clamp((speed-40)/12,0,1)*(1-math.Clamp((speed-65)/15,0,1))
    local rol55p = Lerp(0.8+(speed-43)/24,0.8,1.2)
    local rol75 = math.Clamp((speed-65)/15,0,1)
    local rol75p = Lerp(0.8+(speed-67)/16,0.8,1.2)
    self:SetSoundState("rolling_10",rollingi*rol10,rol10p)
    self:SetSoundState("rolling_30",rollingi*rol30,rol30p)
    self:SetSoundState("rolling_55",rollingi*rol55,rol55p)
    self:SetSoundState("rolling_75",rollingi*rol75,rol75p)

    local rol10 = math.Clamp(speed/15,0,1)*(1-math.Clamp((speed-18)/35,0,1))
    local rol10p = Lerp((speed-15)/14,0.6,0.78)
    local rol40 = math.Clamp((speed-18)/35,0,1)*(1-math.Clamp((speed-55)/40,0,1))
    local rol40p = Lerp((speed-15)/66,0.6,1.3)
    local rol70 = math.Clamp((speed-55)/20,0,1)--*(1-math.Clamp((speed-72)/5,0,1))
    local rol70p = Lerp((speed-55)/27,0.78,1.15)
    --local rol80 = math.Clamp((speed-70)/5,0,1)
    --local rol80p = Lerp(0.8+(speed-72)/15*0.2,0.8,1.2)
    self:SetSoundState("rolling_low"    ,rol10*rollings,rol10p) --15
    self:SetSoundState("rolling_medium2",rol40*rollings,rol40p) --57
    --self:SetSoundState("rolling_medium1",0 or rol40*rollings,rol40p) --57
    self:SetSoundState("rolling_high2"  ,rol70*rollings,rol70p) --70
    --rolling_10
    --rolling_45
    --rolling_60
    --rolling_70
    local state = self:GetPackedRatio("RNState")
    self.TISUVol = math.Clamp(self.TISUVol+(state-self.TISUVol)*dT*8,0,1)
    self:SetSoundState("async", self.TISUVol/1.5, 1)
    --self:SetSoundState("tisu2", self.TISUVol/1.5, 1)
    --self:SetSoundState("tisu3", 0 or self.TISUVol, 1)
    self:SetSoundState("bbe", self:GetPackedBool("BBEWork") and 1 or 0, 1)

    local work = self:GetPackedBool("AnnPlay")
    for k,v in ipairs(self.AnnouncerPositions) do
        if self.Sounds["announcer"..k] and IsValid(self.Sounds["announcer"..k]) then
            self.Sounds["announcer"..k]:SetVolume(work and (v[3] or 1)  or 0.7)
        end
    end
end

function ENT:Draw()
    self.BaseClass.Draw(self)
end

function ENT:DrawPost(special)
    self.RTMaterial:SetTexture("$basetexture", self.Vityaz)
    self:DrawOnPanel("Vityaz",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(440,520,1430,1140,0) --1024 ебет \\\витязь vityaz
    end)
    self.RTMaterial:SetTexture("$basetexture", self.ASNP)
    self:DrawOnPanel("ASNPScreen",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(245,50,605,122.5,0)
    end)
	--ИГЛА
    self.RTMaterial:SetTexture("$basetexture",self.IGLA)
    self:DrawOnPanel("IGLA_C",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(256,64,512,128,0)
    end)
--[[    self:DrawOnPanel("IGLA_R",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(256,64,512,128,0)
    end)
	]]
	self.RTMaterial:SetTexture("$basetexture", self.CAMS)
    self:DrawOnPanel("CAMS",function(...)
		--local brightness = self:GetNW2Int("CAMSBrightness",100)/100
		--surface.SetAlphaMultiplier(brightness)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(529,446,1024,768,0)
		--surface.SetAlphaMultiplier(1.0)
    end)
	self.RTMaterial:SetTexture("$basetexture", self.Tickers)
    self:DrawOnPanel("Tickers",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(512,32+8,1024+16,64+16,0)
    end)
end

function ENT:OnButtonPressed(button)
end

function ENT:OnPlay(soundid,location,range,pitch)
    if location == "stop" then
        if IsValid(self.Sounds[soundid]) then
            self.Sounds[soundid]:Pause()
            self.Sounds[soundid]:SetTime(0)
        end
        return
    end
    if soundid == "K1" then
        local id = range > 0 and "k1_on" or "k1_off"
        local speed = self:GetPackedRatio("Speed")
        self.SoundPositions["k1_on"][1] = 440-Lerp(speed/0.1,0,330)
        return id,location,1-Lerp(speed/10,0.2,0.8),pitch
    end
	if soundid:sub(1,4) == "IGLA" then
    return range > 0 and "igla_on" or "igla_off",location,1,pitch
    end
    if soundid == "K2" then
        local id = range > 0 and "k2_on" or "k2_off"
        local speed = self:GetPackedRatio("Speed")
        self.SoundPositions["k2_on"][1] = 440-Lerp(speed/0.1,0,330)
        return id,location,1-Lerp(speed/10,0.2,0.8),pitch
    end
    if soundid == "K3" then
        local id = range > 0 and "k3_on" or "k3_off"
        local speed = self:GetPackedRatio("Speed")
        self.SoundPositions["k3_on"][1] = 440-Lerp(speed/0.1,0,330)
        return id,location,1-Lerp(speed/10,0.2,0.8),pitch
    end
    if soundid == "KMR1" then
        local id = range > 0 and "kmr1_on" or "kmr1_off"
        local speed = self:GetPackedRatio("Speed")
        self.SoundPositions["kmr1_on"][1] = 440-Lerp(speed/0.1,0,330)
        return id,location,1-Lerp(speed/10,0.2,0.8),pitch
    end
    if soundid == "KMR2" then
        local id = range > 0 and "kmr2_on" or "kmr2_off"
        local speed = self:GetPackedRatio("Speed")
        self.SoundPositions["kmr2_on"][1] = 440-Lerp(speed/0.1,0,330)
        return id,location,1-Lerp(speed/10,0.2,0.8),pitch
    end
    if soundid == "QF1" then
        local id = range > 0 and "qf1_on" or "qf1_off"
        local speed = self:GetPackedRatio("Speed")
        self.SoundPositions["qf1_on"][1] = 440-Lerp(speed/0.1,0,330)
        return id,location,1-Lerp(speed/10,0.2,0.8),pitch
    end
	
    return soundid,location,range,pitch
end
Metrostroi.GenerateClientProps()