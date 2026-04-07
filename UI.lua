-- ╔═══════════════════════════════════════════════════════════════╗
-- ║         iDepHub UI Library  —  By LangerPG  |  v2.0           ║            ║
-- ╚═══════════════════════════════════════════════════════════════╝

-- ══════════════════════════════════════════════════════════════════
--   SERVICIOS (internos a la librería)
-- ══════════════════════════════════════════════════════════════════
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")
local LocalPlayer      = Players.LocalPlayer

-- ══════════════════════════════════════════════════════════════════
--   TEMA
-- ══════════════════════════════════════════════════════════════════
local T = {
    Bg          = Color3.fromRGB(8,   8,   8),
    Sidebar     = Color3.fromRGB(4,   4,   4),
    Header      = Color3.fromRGB(5,   5,   5),
    Accent      = Color3.fromRGB(0,   195, 220),
    AccentDark  = Color3.fromRGB(0,   110, 135),
    Text        = Color3.fromRGB(230, 230, 230),
    TextRed     = Color3.fromRGB(0,   195, 220),
    TextDim     = Color3.fromRGB(95,  95,  95),
    Elem        = Color3.fromRGB(13,  13,  13),
    ElemHov     = Color3.fromRGB(20,  20,  20),
    Border      = Color3.fromRGB(0,   195, 220),
    BorderDim   = Color3.fromRGB(30,  30,  30),
    SliderFill  = Color3.fromRGB(0,   195, 220),
    SliderBg    = Color3.fromRGB(26,  26,  26),
    ToggleOn    = Color3.fromRGB(0,   195, 220),
    ToggleOff   = Color3.fromRGB(36,  36,  36),
    TabActive   = Color3.fromRGB(18,  18,  18),
    TabInactive = Color3.fromRGB(9,   9,   9),
}

local playerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════════════════════
--   SCREEN GUI
-- ══════════════════════════════════════════════════════════════════
local screenGui = Instance.new("ScreenGui")
screenGui.Name           = "iDepHubUI"
screenGui.ResetOnSpawn   = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder   = 999
screenGui.Parent         = playerGui

-- ══════════════════════════════════════════════════════════════════
--   VENTANA PRINCIPAL
-- ══════════════════════════════════════════════════════════════════
local mainFrame = Instance.new("Frame")
mainFrame.Name              = "MainFrame"
mainFrame.Size              = UDim2.new(0, 446, 0, 394)
mainFrame.AnchorPoint       = Vector2.new(0.5, 0.5)
mainFrame.Position          = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3  = T.Bg
mainFrame.BorderSizePixel   = 0
mainFrame.ClipsDescendants  = true
mainFrame.Parent            = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 6)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color     = T.Border
mainStroke.Thickness = 1.5
mainStroke.Parent    = mainFrame

-- ══════════════════════════════════════════════════════════════════
--   TOP BAR (título + botón cerrar)
-- ══════════════════════════════════════════════════════════════════
local topBar = Instance.new("Frame")
topBar.Name             = "TopBar"
topBar.Size             = UDim2.new(1, 0, 0, 38)
topBar.BackgroundColor3 = T.Header
topBar.BorderSizePixel  = 0
topBar.ZIndex           = 5
topBar.Parent           = mainFrame

local topBarFill = Instance.new("Frame")
topBarFill.Size             = UDim2.new(1, 0, 0.6, 0)
topBarFill.Position         = UDim2.new(0, 0, 0.4, 0)
topBarFill.BackgroundColor3 = T.Header
topBarFill.BorderSizePixel  = 0
topBarFill.ZIndex           = 5
topBarFill.Parent           = topBar

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 6)
topBarCorner.Parent = topBar

local topLine = Instance.new("Frame")
topLine.Size             = UDim2.new(1, 0, 0, 1)
topLine.Position         = UDim2.new(0, 0, 1, -1)
topLine.BackgroundColor3 = T.Border
topLine.BorderSizePixel  = 0
topLine.ZIndex           = 6
topLine.Parent           = topBar

local dot = Instance.new("Frame")
dot.Size             = UDim2.new(0, 8, 0, 8)
dot.Position         = UDim2.new(0, 12, 0.5, -4)
dot.BackgroundColor3 = T.Accent
dot.BorderSizePixel  = 0
dot.ZIndex           = 7
dot.Parent           = topBar
Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size               = UDim2.new(1, -92, 1, 0)
titleLabel.Position           = UDim2.new(0, 28, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text               = "💠 iDepHub [Duelos]"
titleLabel.TextColor3         = T.Text
titleLabel.TextSize           = 14
titleLabel.Font               = Enum.Font.GothamSemibold
titleLabel.TextXAlignment     = Enum.TextXAlignment.Left
titleLabel.ZIndex             = 7
titleLabel.Parent             = topBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size             = UDim2.new(0, 26, 0, 26)
closeBtn.Position         = UDim2.new(1, -33, 0.5, -13)
closeBtn.BackgroundColor3 = Color3.fromRGB(0, 130, 155)
closeBtn.BorderSizePixel  = 0
closeBtn.Text             = "X"
closeBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize         = 14
closeBtn.Font             = Enum.Font.GothamSemibold
closeBtn.AutoButtonColor  = false
closeBtn.ZIndex           = 8
closeBtn.Parent           = topBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 4)

closeBtn.MouseButton1Click:Connect(function() mainFrame.Visible = false end)
closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.1), {BackgroundColor3 = T.Accent}):Play()
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 130, 155)}):Play()
end)

-- ══════════════════════════════════════════════════════════════════
--   CUERPO  (sidebar + contenido)
-- ══════════════════════════════════════════════════════════════════
local bodyFrame = Instance.new("Frame")
bodyFrame.Size              = UDim2.new(1, 0, 1, -60)
bodyFrame.Position          = UDim2.new(0, 0, 0, 38)
bodyFrame.BackgroundTransparency = 1
bodyFrame.BorderSizePixel   = 0
bodyFrame.Parent            = mainFrame

-- ══════════════════════════════════════════════════════════════════
--   FOOTER
-- ══════════════════════════════════════════════════════════════════
local footer = Instance.new("Frame")
footer.Name             = "Footer"
footer.Size             = UDim2.new(1, 0, 0, 22)
footer.Position         = UDim2.new(0, 0, 1, -22)
footer.BackgroundColor3 = Color3.fromRGB(4, 4, 4)
footer.BorderSizePixel  = 0
footer.ZIndex           = 5
footer.Parent           = mainFrame

local footerLine = Instance.new("Frame")
footerLine.Size             = UDim2.new(1, 0, 0, 1)
footerLine.Position         = UDim2.new(0, 0, 0, 0)
footerLine.BackgroundColor3 = T.Border
footerLine.BorderSizePixel  = 0
footerLine.ZIndex           = 6
footerLine.Parent           = footer

local footerLabel = Instance.new("TextLabel")
footerLabel.Size                  = UDim2.new(1, 0, 1, 0)
footerLabel.Position              = UDim2.new(0, 0, 0, 0)
footerLabel.BackgroundTransparency = 1
footerLabel.Text                  = "By LangerPG"
footerLabel.TextColor3            = T.TextRed
footerLabel.TextSize              = 11
footerLabel.Font                  = Enum.Font.GothamSemibold
footerLabel.TextXAlignment        = Enum.TextXAlignment.Center
footerLabel.ZIndex                = 6
footerLabel.Parent                = footer

-- ─── Sidebar ────────────────────────────────────────────────────
local sidebar = Instance.new("Frame")
sidebar.Name             = "Sidebar"
sidebar.Size             = UDim2.new(0, 118, 1, 0)
sidebar.BackgroundColor3 = T.Sidebar
sidebar.BorderSizePixel  = 0
sidebar.Parent           = bodyFrame

local sidebarLine = Instance.new("Frame")
sidebarLine.Size             = UDim2.new(0, 1, 1, 0)
sidebarLine.Position         = UDim2.new(0, 117, 0, 0)
sidebarLine.BackgroundColor3 = T.Border
sidebarLine.BorderSizePixel  = 0
sidebarLine.Parent           = bodyFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding   = UDim.new(0, 3)
tabLayout.Parent    = sidebar

local sidebarPad = Instance.new("UIPadding")
sidebarPad.PaddingTop   = UDim.new(0, 8)
sidebarPad.PaddingLeft  = UDim.new(0, 6)
sidebarPad.PaddingRight = UDim.new(0, 6)
sidebarPad.Parent       = sidebar

-- ─── Área de contenido ──────────────────────────────────────────
local contentFrame = Instance.new("Frame")
contentFrame.Name             = "Content"
contentFrame.Size             = UDim2.new(1, -118, 1, 0)
contentFrame.Position         = UDim2.new(0, 118, 0, 0)
contentFrame.BackgroundColor3 = T.Bg
contentFrame.BorderSizePixel  = 0
contentFrame.ClipsDescendants = true
contentFrame.Parent           = bodyFrame

-- ══════════════════════════════════════════════════════════════════
--   SISTEMA DE TABS
-- ══════════════════════════════════════════════════════════════════
local registeredTabs = {}

local function SelectTab(target)
    for _, td in ipairs(registeredTabs) do
        td.page.Visible = false
        td.accent.Visible = false
        TweenService:Create(td.btn,    TweenInfo.new(0.12), {BackgroundColor3 = T.TabInactive}):Play()
        TweenService:Create(td.nameLbl,TweenInfo.new(0.12), {TextColor3       = T.TextDim    }):Play()
    end
    target.page.Visible   = true
    target.accent.Visible = true
    TweenService:Create(target.btn,    TweenInfo.new(0.12), {BackgroundColor3 = T.TabActive}):Play()
    TweenService:Create(target.nameLbl,TweenInfo.new(0.12), {TextColor3       = T.Text     }):Play()
end

local function NewTab(name, icon, order)
    local btn = Instance.new("TextButton")
    btn.Name             = "Tab_"..name
    btn.Size             = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = T.TabInactive
    btn.BorderSizePixel  = 0
    btn.Text             = ""
    btn.AutoButtonColor  = false
    btn.LayoutOrder      = order
    btn.Parent           = sidebar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

    local accentBar = Instance.new("Frame")
    accentBar.Name             = "Accent"
    accentBar.Size             = UDim2.new(0, 3, 0, 20)
    accentBar.Position         = UDim2.new(0, 0, 0.5, -10)
    accentBar.BackgroundColor3 = T.Accent
    accentBar.BorderSizePixel  = 0
    accentBar.Visible          = false
    accentBar.Parent           = btn
    Instance.new("UICorner", accentBar).CornerRadius = UDim.new(0, 2)

    local iconLbl = Instance.new("TextLabel")
    iconLbl.Size                 = UDim2.new(0, 22, 1, 0)
    iconLbl.Position             = UDim2.new(0, 9, 0, 0)
    iconLbl.BackgroundTransparency = 1
    iconLbl.Text                 = icon
    iconLbl.TextSize             = 14
    iconLbl.Font                 = Enum.Font.GothamSemibold
    iconLbl.TextXAlignment       = Enum.TextXAlignment.Center
    iconLbl.Parent               = btn

    local nameLbl = Instance.new("TextLabel")
    nameLbl.Name                 = "Label"
    nameLbl.Size                 = UDim2.new(1, -36, 1, 0)
    nameLbl.Position             = UDim2.new(0, 35, 0, 0)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text                 = name
    nameLbl.TextColor3           = T.TextDim
    nameLbl.TextSize             = 12
    nameLbl.Font                 = Enum.Font.Gotham
    nameLbl.TextXAlignment       = Enum.TextXAlignment.Left
    nameLbl.TextTruncate         = Enum.TextTruncate.AtEnd
    nameLbl.Parent               = btn

    local page = Instance.new("ScrollingFrame")
    page.Size                  = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel        = 0
    page.ScrollBarThickness     = 3
    page.ScrollBarImageColor3   = T.Accent
    page.CanvasSize             = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize    = Enum.AutomaticSize.Y
    page.Visible                = false
    page.Parent                 = contentFrame

    local pageLayout = Instance.new("UIListLayout")
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pageLayout.Padding   = UDim.new(0, 8)
    pageLayout.Parent    = page

    local pagePad = Instance.new("UIPadding")
    pagePad.PaddingTop    = UDim.new(0, 10)
    pagePad.PaddingBottom = UDim.new(0, 10)
    pagePad.PaddingLeft   = UDim.new(0, 9)
    pagePad.PaddingRight  = UDim.new(0, 10)
    pagePad.Parent        = page

    local tabData = {btn = btn, accent = accentBar, nameLbl = nameLbl, page = page}
    table.insert(registeredTabs, tabData)

    btn.MouseButton1Click:Connect(function() SelectTab(tabData) end)
    btn.MouseEnter:Connect(function()
        if page.Visible then return end
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = T.TabActive}):Play()
    end)
    btn.MouseLeave:Connect(function()
        if page.Visible then return end
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = T.TabInactive}):Play()
    end)

    return page
end

-- ══════════════════════════════════════════════════════════════════
--   HELPERS DE INSTANCIAS
-- ══════════════════════════════════════════════════════════════════
local _ord = 0
local function nextOrd() _ord += 1; return _ord end

local function Stroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or T.BorderDim; s.Thickness = thickness or 1; s.Parent = parent
    return s
end

local function Corner(parent, r)
    Instance.new("UICorner", parent).CornerRadius = UDim.new(0, r or 4)
end

local function ElemBase(parent, h)
    local f = Instance.new("Frame")
    f.Size             = UDim2.new(1, 0, 0, h)
    f.BackgroundColor3 = T.Elem
    f.BorderSizePixel  = 0
    f.LayoutOrder      = nextOrd()
    f.Parent           = parent
    Corner(f, 4)
    local s = Stroke(f, T.BorderDim, 1)
    return f, s
end

-- ══════════════════════════════════════════════════════════════════
--   SECCIÓN
-- ══════════════════════════════════════════════════════════════════
local function NewSection(parent, title)
    local sec = Instance.new("Frame")
    sec.Size              = UDim2.new(1, 0, 0, 0)
    sec.BackgroundTransparency = 1
    sec.BorderSizePixel   = 0
    sec.AutomaticSize     = Enum.AutomaticSize.Y
    sec.LayoutOrder       = nextOrd()
    sec.Parent            = parent

    local secLayout = Instance.new("UIListLayout")
    secLayout.SortOrder = Enum.SortOrder.LayoutOrder
    secLayout.Padding   = UDim.new(0, 4)
    secLayout.Parent    = sec

    local hdr = Instance.new("Frame")
    hdr.Size             = UDim2.new(1, 0, 0, 24)
    hdr.BackgroundTransparency = 1
    hdr.LayoutOrder      = nextOrd()
    hdr.Parent           = sec

    local hdrTxt = Instance.new("TextLabel")
    hdrTxt.Size              = UDim2.new(1, 0, 1, -2)
    hdrTxt.BackgroundTransparency = 1
    hdrTxt.Text              = title
    hdrTxt.TextColor3        = T.TextRed
    hdrTxt.TextSize          = 11
    hdrTxt.Font              = Enum.Font.GothamSemibold
    hdrTxt.TextXAlignment    = Enum.TextXAlignment.Left
    hdrTxt.Parent            = hdr

    local hdrLine = Instance.new("Frame")
    hdrLine.Size             = UDim2.new(1, 0, 0, 1)
    hdrLine.Position         = UDim2.new(0, 0, 1, -1)
    hdrLine.BackgroundColor3 = T.AccentDark
    hdrLine.BorderSizePixel  = 0
    hdrLine.Parent           = hdr

    return sec
end

-- ══════════════════════════════════════════════════════════════════
--   TOGGLE
-- ══════════════════════════════════════════════════════════════════
local function NewToggle(parent, label, sub, default, callback)
    local f, stroke = ElemBase(parent, 46)

    local lbl = Instance.new("TextLabel")
    lbl.Size              = UDim2.new(1, -58, 0, 18)
    lbl.Position          = UDim2.new(0, 10, 0, 7)
    lbl.BackgroundTransparency = 1
    lbl.Text              = label
    lbl.TextColor3        = T.Text
    lbl.TextSize          = 13
    lbl.Font              = Enum.Font.GothamBold
    lbl.TextXAlignment    = Enum.TextXAlignment.Left
    lbl.TextTruncate      = Enum.TextTruncate.AtEnd
    lbl.Parent            = f

    local subLbl = Instance.new("TextLabel")
    subLbl.Size              = UDim2.new(1, -58, 0, 12)
    subLbl.Position          = UDim2.new(0, 10, 0, 26)
    subLbl.BackgroundTransparency = 1
    subLbl.Text              = sub
    subLbl.TextColor3        = T.TextDim
    subLbl.TextSize          = 10
    subLbl.Font              = Enum.Font.Gotham
    subLbl.TextXAlignment    = Enum.TextXAlignment.Left
    subLbl.TextTruncate      = Enum.TextTruncate.AtEnd
    subLbl.Parent            = f

    local track = Instance.new("Frame")
    track.Size             = UDim2.new(0, 36, 0, 19)
    track.Position         = UDim2.new(1, -46, 0.5, -9)
    track.BackgroundColor3 = default and T.ToggleOn or T.ToggleOff
    track.BorderSizePixel  = 0
    track.Parent           = f
    Corner(track, 10)

    local knob = Instance.new("Frame")
    knob.Size             = UDim2.new(0, 13, 0, 13)
    knob.Position         = default and UDim2.new(1, -16, 0.5, -6) or UDim2.new(0, 3, 0.5, -6)
    knob.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
    knob.BorderSizePixel  = 0
    knob.Parent           = track
    Corner(knob, 7)

    local state  = default or false
    local locked = false

    -- ── Overlay de bloqueo ──────────────────────────────────────────
    local lockOverlay = Instance.new("Frame")
    lockOverlay.Name                  = "LockOverlay"
    lockOverlay.Size                  = UDim2.new(1, 0, 1, 0)
    lockOverlay.BackgroundColor3      = Color3.fromRGB(0, 0, 0)
    lockOverlay.BackgroundTransparency = 0.40
    lockOverlay.BorderSizePixel       = 0
    lockOverlay.ZIndex                = 10
    lockOverlay.Visible               = false
    lockOverlay.Parent                = f
    Corner(lockOverlay, 4)

    -- Icono de candado
    local lockIcon = Instance.new("TextLabel")
    lockIcon.Size                 = UDim2.new(0, 18, 1, 0)
    lockIcon.Position             = UDim2.new(0.5, -42, 0, 0)
    lockIcon.BackgroundTransparency = 1
    lockIcon.Text                 = "🔒"
    lockIcon.TextSize             = 13
    lockIcon.Font                 = Enum.Font.GothamSemibold
    lockIcon.TextColor3           = Color3.fromRGB(200, 200, 200)
    lockIcon.TextXAlignment       = Enum.TextXAlignment.Center
    lockIcon.TextYAlignment       = Enum.TextYAlignment.Center
    lockIcon.ZIndex               = 11
    lockIcon.Parent               = lockOverlay

    -- Texto "Locked"
    local lockTxt = Instance.new("TextLabel")
    lockTxt.Size                 = UDim2.new(0, 56, 1, 0)
    lockTxt.Position             = UDim2.new(0.5, -22, 0, 0)
    lockTxt.BackgroundTransparency = 1
    lockTxt.Text                 = "Locked"
    lockTxt.TextSize             = 13
    lockTxt.Font                 = Enum.Font.GothamSemibold
    lockTxt.TextColor3           = Color3.fromRGB(200, 200, 200)
    lockTxt.TextXAlignment       = Enum.TextXAlignment.Left
    lockTxt.TextYAlignment       = Enum.TextYAlignment.Center
    lockTxt.ZIndex               = 11
    lockTxt.Parent               = lockOverlay

    local btn = Instance.new("TextButton")
    btn.Size                 = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text                 = ""
    btn.Parent               = f

    local function setState(newState)
        state = newState
        TweenService:Create(track, TweenInfo.new(0.15), {
            BackgroundColor3 = state and T.ToggleOn or T.ToggleOff,
        }):Play()
        TweenService:Create(knob, TweenInfo.new(0.15), {
            Position = state and UDim2.new(1, -16, 0.5, -6) or UDim2.new(0, 3, 0.5, -6),
        }):Play()
    end

    local function setLocked(isLocked)
        locked = isLocked
        lockOverlay.Visible = isLocked
        -- Si se bloquea, forzar toggle OFF visualmente
        if isLocked then
            setState(false)
        end
    end

    btn.MouseButton1Click:Connect(function()
        if locked then return end
        setState(not state)
        if callback then callback(state) end
    end)
    btn.MouseEnter:Connect(function()
        if locked then return end
        TweenService:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = T.ElemHov}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.1), {Color = Color3.fromRGB(48, 48, 48)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        if locked then return end
        TweenService:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = T.Elem}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.1), {Color = T.BorderDim}):Play()
    end)

    -- Devuelve: frame, setState, setLocked
    return f, setState, setLocked
end

-- ══════════════════════════════════════════════════════════════════
--   SLIDER
-- ══════════════════════════════════════════════════════════════════
local function NewSlider(parent, label, sub, minVal, maxVal, default, callback)
    local f, stroke = ElemBase(parent, 60)

    local lbl = Instance.new("TextLabel")
    lbl.Size              = UDim2.new(0.62, 0, 0, 18)
    lbl.Position          = UDim2.new(0, 10, 0, 7)
    lbl.BackgroundTransparency = 1
    lbl.Text              = label
    lbl.TextColor3        = T.Text
    lbl.TextSize          = 13
    lbl.Font              = Enum.Font.GothamBold
    lbl.TextXAlignment    = Enum.TextXAlignment.Left
    lbl.TextTruncate      = Enum.TextTruncate.AtEnd
    lbl.Parent            = f

    local subLbl = Instance.new("TextLabel")
    subLbl.Size              = UDim2.new(0.62, 0, 0, 12)
    subLbl.Position          = UDim2.new(0, 10, 0, 25)
    subLbl.BackgroundTransparency = 1
    subLbl.Text              = sub
    subLbl.TextColor3        = T.TextDim
    subLbl.TextSize          = 10
    subLbl.Font              = Enum.Font.Gotham
    subLbl.TextXAlignment    = Enum.TextXAlignment.Left
    subLbl.TextTruncate      = Enum.TextTruncate.AtEnd
    subLbl.Parent            = f

    local valLbl = Instance.new("TextLabel")
    valLbl.Size              = UDim2.new(0.38, -12, 0, 18)
    valLbl.Position          = UDim2.new(0.62, 0, 0, 7)
    valLbl.BackgroundTransparency = 1
    valLbl.Text              = tostring(default)
    valLbl.TextColor3        = T.TextRed
    valLbl.TextSize          = 13
    valLbl.Font              = Enum.Font.GothamSemibold
    valLbl.TextXAlignment    = Enum.TextXAlignment.Right
    valLbl.Parent            = f

    local trackBg = Instance.new("Frame")
    trackBg.Size             = UDim2.new(1, -20, 0, 6)
    trackBg.Position         = UDim2.new(0, 10, 1, -16)
    trackBg.BackgroundColor3 = T.SliderBg
    trackBg.BorderSizePixel  = 0
    trackBg.Parent           = f
    Corner(trackBg, 3)

    local pct0 = (default - minVal) / (maxVal - minVal)
    local fill = Instance.new("Frame")
    fill.Size             = UDim2.new(pct0, 0, 1, 0)
    fill.BackgroundColor3 = T.SliderFill
    fill.BorderSizePixel  = 0
    fill.Parent           = trackBg
    Corner(fill, 3)

    local knob = Instance.new("Frame")
    knob.Size             = UDim2.new(0, 12, 0, 12)
    knob.Position         = UDim2.new(pct0, -6, 0.5, -6)
    knob.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
    knob.BorderSizePixel  = 0
    knob.Parent           = trackBg
    Corner(knob, 6)

    local trackBtn = Instance.new("TextButton")
    trackBtn.Size                 = UDim2.new(1, 0, 5, 0)
    trackBtn.Position             = UDim2.new(0, 0, -2, 0)
    trackBtn.BackgroundTransparency = 1
    trackBtn.Text                 = ""
    trackBtn.Parent               = trackBg

    local draggingSl = false

    local function updateSl(x)
        local relX = math.clamp((x - trackBg.AbsolutePosition.X) / trackBg.AbsoluteSize.X, 0, 1)
        local value = math.floor(minVal + relX * (maxVal - minVal) + 0.5)
        local p = (value - minVal) / (maxVal - minVal)
        fill.Size      = UDim2.new(p, 0, 1, 0)
        knob.Position  = UDim2.new(p, -6, 0.5, -6)
        valLbl.Text    = tostring(value)
        if callback then callback(value) end
    end

    trackBtn.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSl = true; updateSl(inp.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if draggingSl and inp.UserInputType == Enum.UserInputType.MouseMovement then
            updateSl(inp.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then draggingSl = false end
    end)

    f.MouseEnter:Connect(function()
        TweenService:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = T.ElemHov}):Play()
    end)
    f.MouseLeave:Connect(function()
        TweenService:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = T.Elem}):Play()
    end)

    return f
end

-- ══════════════════════════════════════════════════════════════════
--   BUTTON
-- ══════════════════════════════════════════════════════════════════
local function NewButton(parent, label, sub, callback)
    local f, stroke = ElemBase(parent, 46)

    local lbl = Instance.new("TextLabel")
    lbl.Size              = UDim2.new(1, -50, 0, 18)
    lbl.Position          = UDim2.new(0, 10, 0, 7)
    lbl.BackgroundTransparency = 1
    lbl.Text              = label
    lbl.TextColor3        = T.Text
    lbl.TextSize          = 13
    lbl.Font              = Enum.Font.GothamBold
    lbl.TextXAlignment    = Enum.TextXAlignment.Left
    lbl.TextTruncate      = Enum.TextTruncate.AtEnd
    lbl.Parent            = f

    local subLbl = Instance.new("TextLabel")
    subLbl.Size              = UDim2.new(1, -50, 0, 12)
    subLbl.Position          = UDim2.new(0, 10, 0, 26)
    subLbl.BackgroundTransparency = 1
    subLbl.Text              = sub
    subLbl.TextColor3        = T.TextDim
    subLbl.TextSize          = 10
    subLbl.Font              = Enum.Font.Gotham
    subLbl.TextXAlignment    = Enum.TextXAlignment.Left
    subLbl.TextTruncate      = Enum.TextTruncate.AtEnd
    subLbl.Parent            = f

    local arrow = Instance.new("TextLabel")
    arrow.Size              = UDim2.new(0, 28, 1, 0)
    arrow.Position          = UDim2.new(1, -34, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text              = "›"
    arrow.TextColor3        = T.TextRed
    arrow.TextSize          = 22
    arrow.Font              = Enum.Font.GothamSemibold
    arrow.Parent            = f

    local btn = Instance.new("TextButton")
    btn.Size                 = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text                 = ""
    btn.Parent               = f

    btn.MouseButton1Click:Connect(function()
        TweenService:Create(f, TweenInfo.new(0.05), {BackgroundColor3 = T.AccentDark}):Play()
        task.delay(0.12, function()
            TweenService:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = T.ElemHov}):Play()
        end)
        if callback then callback() end
    end)
    btn.MouseEnter:Connect(function()
        TweenService:Create(f,      TweenInfo.new(0.1), {BackgroundColor3 = T.ElemHov}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.1), {Color = T.Accent}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(f,      TweenInfo.new(0.1), {BackgroundColor3 = T.Elem}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.1), {Color = T.BorderDim}):Play()
    end)

    return f
end

-- ══════════════════════════════════════════════════════════════════
--   KEYBIND
-- ══════════════════════════════════════════════════════════════════
local function NewKeybind(parent, label, sub, defaultKey, callback)
    local f, stroke = ElemBase(parent, 46)
    local currentKey = defaultKey
    local listening  = false

    local lbl = Instance.new("TextLabel")
    lbl.Size              = UDim2.new(1, -82, 0, 18)
    lbl.Position          = UDim2.new(0, 10, 0, 7)
    lbl.BackgroundTransparency = 1
    lbl.Text              = label
    lbl.TextColor3        = T.Text
    lbl.TextSize          = 13
    lbl.Font              = Enum.Font.GothamBold
    lbl.TextXAlignment    = Enum.TextXAlignment.Left
    lbl.TextTruncate      = Enum.TextTruncate.AtEnd
    lbl.Parent            = f

    local subLbl = Instance.new("TextLabel")
    subLbl.Size              = UDim2.new(1, -82, 0, 12)
    subLbl.Position          = UDim2.new(0, 10, 0, 26)
    subLbl.BackgroundTransparency = 1
    subLbl.Text              = sub
    subLbl.TextColor3        = T.TextDim
    subLbl.TextSize          = 10
    subLbl.Font              = Enum.Font.Gotham
    subLbl.TextXAlignment    = Enum.TextXAlignment.Left
    subLbl.TextTruncate      = Enum.TextTruncate.AtEnd
    subLbl.Parent            = f

    local keyBg = Instance.new("Frame")
    keyBg.Size             = UDim2.new(0, 56, 0, 24)
    keyBg.Position         = UDim2.new(1, -65, 0.5, -12)
    keyBg.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    keyBg.BorderSizePixel  = 0
    keyBg.Parent           = f
    Corner(keyBg, 4)
    local keyStroke = Stroke(keyBg, T.BorderDim, 1)

    local keyLbl = Instance.new("TextLabel")
    keyLbl.Size                 = UDim2.new(1, 0, 1, 0)
    keyLbl.BackgroundTransparency = 1
    keyLbl.Text                 = defaultKey.Name
    keyLbl.TextColor3           = T.TextRed
    keyLbl.TextSize             = 11
    keyLbl.Font                 = Enum.Font.GothamSemibold
    keyLbl.Parent               = keyBg

    local keyBtn = Instance.new("TextButton")
    keyBtn.Size                 = UDim2.new(1, 0, 1, 0)
    keyBtn.BackgroundTransparency = 1
    keyBtn.Text                 = ""
    keyBtn.Parent               = keyBg

    keyBtn.MouseButton1Click:Connect(function()
        if listening then return end
        listening   = true
        keyLbl.Text = "..."
        keyLbl.TextColor3 = T.Text
        TweenService:Create(keyStroke, TweenInfo.new(0.1), {Color = T.Accent}):Play()

        local conn
        conn = UserInputService.InputBegan:Connect(function(inp, gp)
            if gp then return end
            if inp.UserInputType == Enum.UserInputType.Keyboard then
                currentKey        = inp.KeyCode
                keyLbl.Text       = inp.KeyCode.Name
                keyLbl.TextColor3 = T.TextRed
                TweenService:Create(keyStroke, TweenInfo.new(0.1), {Color = T.BorderDim}):Play()
                listening = false
                conn:Disconnect()
            end
        end)
    end)

    UserInputService.InputBegan:Connect(function(inp, gp)
        if gp or listening then return end
        if inp.UserInputType == Enum.UserInputType.Keyboard then
            if inp.KeyCode == currentKey and callback then callback() end
        end
    end)

    f.MouseEnter:Connect(function()
        TweenService:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = T.ElemHov}):Play()
    end)
    f.MouseLeave:Connect(function()
        TweenService:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = T.Elem}):Play()
    end)

    return f
end

-- ══════════════════════════════════════════════════════════════════
--   LABEL
-- ══════════════════════════════════════════════════════════════════
local function NewLabel(parent, text)
    local f, _ = ElemBase(parent, 30)

    local lbl = Instance.new("TextLabel")
    lbl.Size                 = UDim2.new(1, -20, 1, 0)
    lbl.Position             = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text                 = text
    lbl.TextColor3           = T.TextDim
    lbl.TextSize             = 12
    lbl.Font                 = Enum.Font.GothamBold
    lbl.TextXAlignment       = Enum.TextXAlignment.Left
    lbl.TextWrapped          = true
    lbl.Parent               = f

    return f
end

-- ══════════════════════════════════════════════════════════════════
--   COLOR PICKER  — colapsable
-- ══════════════════════════════════════════════════════════════════
local function NewColorPicker(parent, label, sub, defaultColor, callback)
    local SQ_H  = 115
    local HUE_W = 16
    local GAP   = 14
    local PAD   = 10
    local SQ_Y  = 8
    local BODY_H = SQ_Y + SQ_H + 10

    local container = Instance.new("Frame")
    container.Size              = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize     = Enum.AutomaticSize.Y
    container.BackgroundTransparency = 1
    container.BorderSizePixel   = 0
    container.LayoutOrder       = nextOrd()
    container.Parent            = parent

    local cLayout = Instance.new("UIListLayout")
    cLayout.SortOrder = Enum.SortOrder.LayoutOrder
    cLayout.Padding   = UDim.new(0, 0)
    cLayout.Parent    = container

    local header = Instance.new("Frame")
    header.Size             = UDim2.new(1, 0, 0, 46)
    header.BackgroundColor3 = T.Elem
    header.BorderSizePixel  = 0
    header.LayoutOrder      = 1
    header.Parent           = container
    Corner(header, 4)
    local hStroke = Stroke(header, T.BorderDim, 1)

    local lbl = Instance.new("TextLabel")
    lbl.Size                  = UDim2.new(1, -70, 0, 18)
    lbl.Position              = UDim2.new(0, 10, 0, 7)
    lbl.BackgroundTransparency = 1
    lbl.Text                  = label
    lbl.TextColor3            = T.Text
    lbl.TextSize              = 13
    lbl.Font                  = Enum.Font.GothamBold
    lbl.TextXAlignment        = Enum.TextXAlignment.Left
    lbl.TextTruncate          = Enum.TextTruncate.AtEnd
    lbl.Parent                = header

    local subLbl = Instance.new("TextLabel")
    subLbl.Size                  = UDim2.new(1, -70, 0, 12)
    subLbl.Position              = UDim2.new(0, 10, 0, 26)
    subLbl.BackgroundTransparency = 1
    subLbl.Text                  = sub
    subLbl.TextColor3            = T.TextDim
    subLbl.TextSize              = 10
    subLbl.Font                  = Enum.Font.Gotham
    subLbl.TextXAlignment        = Enum.TextXAlignment.Left
    subLbl.TextTruncate          = Enum.TextTruncate.AtEnd
    subLbl.Parent                = header

    local preview = Instance.new("Frame")
    preview.Size             = UDim2.new(0, 36, 0, 28)
    preview.Position         = UDim2.new(1, -46, 0, 9)
    preview.BackgroundColor3 = defaultColor
    preview.BorderSizePixel  = 0
    preview.Parent           = header
    Corner(preview, 4)
    Stroke(preview, T.BorderDim, 1)

    local headerBtn = Instance.new("TextButton")
    headerBtn.Size                 = UDim2.new(1, 0, 1, 0)
    headerBtn.BackgroundTransparency = 1
    headerBtn.Text                 = ""
    headerBtn.Parent               = header

    local body = Instance.new("Frame")
    body.Size             = UDim2.new(1, 0, 0, BODY_H)
    body.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    body.BorderSizePixel  = 0
    body.ClipsDescendants = true
    body.Visible          = false
    body.LayoutOrder      = 2
    body.Parent           = container
    Corner(body, 4)

    local H, S, V = Color3.toHSV(defaultColor)

    local square = Instance.new("Frame")
    square.Size             = UDim2.new(1, -(PAD + GAP + HUE_W + PAD), 0, SQ_H)
    square.Position         = UDim2.new(0, PAD, 0, SQ_Y)
    square.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
    square.BorderSizePixel  = 0
    square.ClipsDescendants = true
    square.Parent           = body
    Corner(square, 3)

    local wOver = Instance.new("Frame")
    wOver.Size               = UDim2.new(1, 0, 1, 0)
    wOver.BackgroundColor3   = Color3.new(1, 1, 1)
    wOver.BackgroundTransparency = 0
    wOver.BorderSizePixel    = 0
    wOver.ZIndex             = 2
    wOver.Parent             = square
    local wGrad = Instance.new("UIGradient")
    wGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1),
    })
    wGrad.Rotation = 0
    wGrad.Parent   = wOver

    local bOver = Instance.new("Frame")
    bOver.Size               = UDim2.new(1, 0, 1, 0)
    bOver.BackgroundColor3   = Color3.new(0, 0, 0)
    bOver.BackgroundTransparency = 0
    bOver.BorderSizePixel    = 0
    bOver.ZIndex             = 3
    bOver.Parent             = square
    local bGrad = Instance.new("UIGradient")
    bGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 0),
    })
    bGrad.Rotation = 90
    bGrad.Parent   = bOver

    local sqKnob = Instance.new("Frame")
    sqKnob.Size             = UDim2.new(0, 11, 0, 11)
    sqKnob.AnchorPoint      = Vector2.new(0.5, 0.5)
    sqKnob.Position         = UDim2.new(S, 0, 1 - V, 0)
    sqKnob.BackgroundColor3 = Color3.new(1, 1, 1)
    sqKnob.BorderSizePixel  = 0
    sqKnob.ZIndex           = 10
    sqKnob.Parent           = square
    Corner(sqKnob, 6)
    local sqKnobStroke = Instance.new("UIStroke")
    sqKnobStroke.Color     = Color3.new(0, 0, 0)
    sqKnobStroke.Thickness = 1.5
    sqKnobStroke.Parent    = sqKnob

    local sqBtn = Instance.new("TextButton")
    sqBtn.Size                 = UDim2.new(1, 0, 1, 0)
    sqBtn.BackgroundTransparency = 1
    sqBtn.Text                 = ""
    sqBtn.ZIndex               = 11
    sqBtn.Parent               = square

    local hueBar = Instance.new("Frame")
    hueBar.Size             = UDim2.new(0, HUE_W, 0, SQ_H)
    hueBar.Position         = UDim2.new(1, -(PAD + HUE_W), 0, SQ_Y)
    hueBar.BackgroundColor3 = Color3.new(1, 1, 1)
    hueBar.BorderSizePixel  = 0
    hueBar.Parent           = body
    Corner(hueBar, 3)

    local hueGrad = Instance.new("UIGradient")
    hueGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,     Color3.fromHSV(0,     1, 1)),
        ColorSequenceKeypoint.new(0.167, Color3.fromHSV(0.167, 1, 1)),
        ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333, 1, 1)),
        ColorSequenceKeypoint.new(0.5,   Color3.fromHSV(0.5,   1, 1)),
        ColorSequenceKeypoint.new(0.667, Color3.fromHSV(0.667, 1, 1)),
        ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833, 1, 1)),
        ColorSequenceKeypoint.new(1,     Color3.fromHSV(0,     1, 1)),
    })
    hueGrad.Rotation = 90
    hueGrad.Parent   = hueBar

    local hueKnob = Instance.new("Frame")
    hueKnob.Size             = UDim2.new(1, 4, 0, 3)
    hueKnob.AnchorPoint      = Vector2.new(0, 0.5)
    hueKnob.Position         = UDim2.new(0, -2, H, 0)
    hueKnob.BackgroundColor3 = Color3.new(1, 1, 1)
    hueKnob.BorderSizePixel  = 0
    hueKnob.ZIndex           = 10
    hueKnob.Parent           = hueBar
    local hueKnobStroke = Instance.new("UIStroke")
    hueKnobStroke.Color     = Color3.new(0, 0, 0)
    hueKnobStroke.Thickness = 1
    hueKnobStroke.Parent    = hueKnob

    local hueBtn = Instance.new("TextButton")
    hueBtn.Size                 = UDim2.new(1, 0, 1, 0)
    hueBtn.BackgroundTransparency = 1
    hueBtn.Text                 = ""
    hueBtn.ZIndex               = 11
    hueBtn.Parent               = hueBar

    local function getColor() return Color3.fromHSV(H, S, V) end

    local function refresh()
        local c = getColor()
        preview.BackgroundColor3 = c
        square.BackgroundColor3  = Color3.fromHSV(H, 1, 1)
        if callback then callback(c) end
    end

    local function updateFromSquare(mx, my)
        local rx = math.clamp((mx - square.AbsolutePosition.X) / square.AbsoluteSize.X, 0, 1)
        local ry = math.clamp((my - square.AbsolutePosition.Y) / square.AbsoluteSize.Y, 0, 1)
        S = rx; V = 1 - ry
        sqKnob.Position = UDim2.new(rx, 0, ry, 0)
        refresh()
    end

    local function updateFromHue(my)
        local ry = math.clamp((my - hueBar.AbsolutePosition.Y) / hueBar.AbsoluteSize.Y, 0, 1)
        H = ry
        hueKnob.Position        = UDim2.new(0, -2, ry, 0)
        square.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
        refresh()
    end

    local dragSq, dragHue = false, false

    sqBtn.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragSq = true; updateFromSquare(inp.Position.X, inp.Position.Y)
        end
    end)
    hueBtn.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragHue = true; updateFromHue(inp.Position.Y)
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if inp.UserInputType ~= Enum.UserInputType.MouseMovement then return end
        if dragSq  then updateFromSquare(inp.Position.X, inp.Position.Y) end
        if dragHue then updateFromHue(inp.Position.Y) end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragSq = false; dragHue = false
        end
    end)

    local expanded = false
    headerBtn.MouseButton1Click:Connect(function()
        expanded = not expanded
        body.Visible = expanded
        TweenService:Create(header, TweenInfo.new(0.1), {
            BackgroundColor3 = expanded and T.ElemHov or T.Elem,
        }):Play()
        TweenService:Create(hStroke, TweenInfo.new(0.1), {
            Color = expanded and Color3.fromRGB(48, 48, 48) or T.BorderDim,
        }):Play()
    end)

    header.MouseEnter:Connect(function()
        TweenService:Create(header, TweenInfo.new(0.1), {BackgroundColor3 = T.ElemHov}):Play()
        TweenService:Create(hStroke, TweenInfo.new(0.1), {Color = Color3.fromRGB(48, 48, 48)}):Play()
    end)
    header.MouseLeave:Connect(function()
        if not expanded then
            TweenService:Create(header, TweenInfo.new(0.1), {BackgroundColor3 = T.Elem}):Play()
        end
        TweenService:Create(hStroke, TweenInfo.new(0.1), {Color = T.BorderDim}):Play()
    end)

    preview.BackgroundColor3 = defaultColor
    square.BackgroundColor3  = Color3.fromHSV(H, 1, 1)
    refresh()

    return container
end

-- ══════════════════════════════════════════════════════════════════
--   DRAG  (arrastrar la ventana por el topBar)
-- ══════════════════════════════════════════════════════════════════
local isDragging, dragStart, frameStart = false, nil, nil

topBar.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart  = inp.Position
        frameStart = mainFrame.Position
    end
end)

topBar.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(inp)
    if isDragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = inp.Position - dragStart
        mainFrame.Position = UDim2.new(
            frameStart.X.Scale, frameStart.X.Offset + delta.X,
            frameStart.Y.Scale, frameStart.Y.Offset + delta.Y
        )
    end
end)

-- ══════════════════════════════════════════════════════════════════
--   API PÚBLICA  (lo que devuelve la librería)
-- ══════════════════════════════════════════════════════════════════
return {
    NewTab         = NewTab,
    NewSection     = NewSection,
    NewToggle      = NewToggle,
    NewSlider      = NewSlider,
    NewButton      = NewButton,
    NewKeybind     = NewKeybind,
    NewLabel       = NewLabel,
    NewColorPicker = NewColorPicker,
    SelectTab      = SelectTab,
    registeredTabs = registeredTabs,
    mainFrame      = mainFrame,
}
