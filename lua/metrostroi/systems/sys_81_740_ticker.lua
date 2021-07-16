--------------------------------------------------------------------------------
-- 81-740 tickers
--------------------------------------------------------------------------------
-- Copyright (C) 2013-2018 Metrostroi Team & FoxWorks Aerospace s.r.o.
-- Contains proprietary code. See license.txt for additional information.
--------------------------------------------------------------------------------
-- Fixed by LiWinDom (STEAM_0:0:190697714)
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("81_740_Ticker")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize()

end

if TURBOSTROI then return end

function TRAIN_SYSTEM:Inputs()
    return {}
end

function TRAIN_SYSTEM:Outputs()
    return {}
end

function TRAIN_SYSTEM:TriggerInput(name,value)
end

if CLIENT then
    function TRAIN_SYSTEM:ClientInitialize()
    end
	local function createFont(font, size)
        surface.CreateFont("Metrostroi_740_ticker", {
            font = font,
            size = size,
            weight = 00,
            blursize = false,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = true,
            outline = false,
            extended = true,
            scanlines = false,
        })
    end
    createFont("Moscow_metro_round_fix", 42)
    function TRAIN_SYSTEM:ClientThink()
        local str = self.Train:GetNW2String("TickerMessage","")
        local col = Color(self.Train:GetNW2Int("TickerColorR",255), self.Train:GetNW2Int("TickerColorG",0), self.Train:GetNW2Int("TickerColorB",0))
        local pos = self.Train:GetNW2Int("TickerState",0)
        if self.Train:ShouldDrawPanel("Tickers") and (self.Text ~= str or self.Position ~= pos) then
            self.Text = str
            self.Position = pos
            self.Color = col
            render.PushRenderTarget(self.Train.Tickers,0,0,1000,64)
            render.Clear(0, 0, 0, 0)
            cam.Start2D()
            self:Tickers(self.Train)
            cam.End2D()
            render.PopRenderTarget()
        end
    end
    function TRAIN_SYSTEM:PrintText(x, text, color)
	    local Train = self.Train
        local drawColor = color or Color(200, 0, 0)
        local str = {utf8.codepoint(text, 1, -1)}
        for i = 0, #str - 1 do
            local xpos = i * 35.5 + x * 3.505

            --if i*26.5+x*3.005+20 < 0 then continue end
            --if (i-33)*26.5+x*3.005+20 > 0 then continue end
            if -18.5 < xpos and xpos < 41 * 23 then
                local char = utf8.char(str[i + 1])
                draw.SimpleText(char, "Metrostroi_740_ticker", xpos + 40, 30, drawColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end
    end
--draw.SimpleText(char,"Metrostroi_Tickers",(x+i)*20.5+8,34,Color(0,255,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)

    function TRAIN_SYSTEM:Tickers(Train)
        if self.Text  ~= "" then
            self:PrintText(self.Position, self.Text, self.Color)
        end
    end
    return
end

function TRAIN_SYSTEM:Initialize()
    self.Advert = 1
    self.AdvertSymbol = 0
    self.CurrentAdvert = ""
    self.isMoving = true
    self.CurColor = Color(255, 0, 0)
    self.Status = -1
    self.ShowStation = false
    self.Station = nil
    self.Next = false
end
function TRAIN_SYSTEM:CANReceive(source,sourceid,target,targetid,textdata,numdata)
    if textdata == "Curr" then
        self.Station = numdata
    elseif textdata == "Next" then
        self.Next = numdata
    end

    self.ShowStation = true
end
function TRAIN_SYSTEM:Think()
    local Train = self.Train
    local Power = Train.Panel.TickerPower > 0
    local Work = Train.Panel.TickerWork > 0 and Metrostroi.TickerAdverts
    if Power then
        self.AdvertSymbol = self.AdvertSymbol - 90*Train.DeltaTime
        if ((self.AdvertSymbol < -utf8.len(self.CurrentAdvert)*10-20) or self.ShowStation == true) then
            self.AdvertSymbol = 40*(7+math.random(0,3))--40*7
            self.isMoving = true
            
            if Work and self.Status >= 0 then
                if self.Station == nil then
                    self.Status = 0
                end

                if self.Status == 1 or self.ShowStation == true then
                    self.ShowStation = false
                    if self.Station then
                        self.CurColor = Color(0, 255, 0)
                        if self.Next == true then
                            self.CurrentAdvert = Format("следующая станция %s",self.Station)
                            self.Status = 2
                        else
                            self.Status = 1
                            self.CurrentAdvert = Format("станция %s",self.Station)

                            if utf8.len(self.CurrentAdvert) <= 27 then 
                                self.isMoving = false
                            end
                        end
                    else
                        self.Status = 0
                    end
                elseif self.Status == 0 then
                    self.isMoving = false
                    self.CurColor = Color(255, 164, 32)
                    self.CurrentAdvert = os.date("%d.%m.%Yг.    %H:%M")
                    if os.date("%a") == "Mon" then
                        self.CurrentAdvert = "ПН    "..self.CurrentAdvert
                    elseif os.date("%a") == "Tue" then
                        self.CurrentAdvert = "ВТ    "..self.CurrentAdvert
                    elseif os.date("%a") == "Wed" then
                        self.CurrentAdvert = "СР    "..self.CurrentAdvert
                    elseif os.date("%a") == "Thu" then
                        self.CurrentAdvert = "ЧТ    "..self.CurrentAdvert
                    elseif os.date("%a") == "Fri" then
                        self.CurrentAdvert = "ПТ    "..self.CurrentAdvert
                    elseif os.date("%a") == "Sat" then
                        self.CurrentAdvert = "СБ    "..self.CurrentAdvert
                    elseif os.date("%a") == "Sun" then
                        self.CurrentAdvert = "ВС    "..self.CurrentAdvert
                    else
                        self.CurrentAdvert = os.date("%a")
                    end
                    if self.Station ~= nil then
                        self.Status = 1
                    end 
                else
                    self.CurColor = Color(255, 0, 0)
                    self.CurrentAdvert = Metrostroi.TickerAdverts[self.Advert].."   В вагонах действует бесплатная Wi-Fi сеть MT_FREE."
                    self.Advert = math.random(1, table.getn(Metrostroi.TickerAdverts))
                    self.Status = 0
                end
            else
                self.Station = nil
				self.CurColor = Color(255, 255, 255)
                self.CurrentAdvert = "НИИ Фабрики SENT БЕГУЩАЯ СТРОКА v2.1"
				if os.date( "%m-%d" ) == "04-01" then
				    self.CurrentAdvert = "СИСТЕМА ПОИСКА ПИДАРАСОВ АКТИВИРОВАНА"
				end
                self.Status = 0
                self.AdvertSymbol = 40*8
            end
        end
    else
        self.Station = nil
        self.isMoving = true
        self.CurColor = Color(255, 255, 255)
        self.AdvertSymbol = 40*8
        self.CurrentAdvert = ""
		if os.date( "%m-%d" ) == "04-01" then
		    self.CurrentAdvert = "Ты думал здесь что-то будет?"
		end
        self.Status = -1
    end
    --[[
    local str = ""
    for p, c in utf8.codes(self.CurrentAdvert) do
        str = str..utf8.char(c+10)
    end]]
    Train:SetNW2String("TickerMessage",self.CurrentAdvert)
    --Train:SetNW2Int("TickerState",math.ceil(math.min(0,self.AdvertSymbol)))
    colR, colG, colB = self.CurColor:Unpack()
    Train:SetNW2Int("TickerColorR", colR)
    Train:SetNW2Int("TickerColorG", colG)
    Train:SetNW2Int("TickerColorB", colB)
    if self.isMoving == true then
        Train:SetNW2Int("TickerState",math.ceil(self.AdvertSymbol))
    else
        Train:SetNW2Int("TickerState",0)
    end
end
