-- ===============================
-- LOADER YAYCAT - Alex7043
-- ===============================

-- Função para carregar a YayCat
function loadYayCat()
    print("🔧 Carregando YayCat Library...")
    
    -- URL da sua biblioteca no GitHub
    local githubURL = "https://raw.githubusercontent.com/Alex7043/YayCat/main/YayCat.lua"
    
    -- Tentar carregar
    local success, result = pcall(function()
        local scriptSource = game:HttpGet(githubURL)
        return loadstring(scriptSource)()
    end)
    
    if success then
        print("✅ YayCat carregada com sucesso!")
        return result
    else
        warn("❌ Erro ao carregar YayCat: " .. result)
        return nil
    end
end

-- Interface de loading
local loadingScreen = Instance.new("ScreenGui")
local loadingFrame = Instance.new("Frame")
local loadingText = Instance.new("TextLabel")

loadingScreen.Name = "YayCatLoader"
loadingScreen.Parent = game.CoreGui

loadingFrame.Size = UDim2.new(0, 300, 0, 150)
loadingFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
loadingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = loadingScreen

loadingText.Size = UDim2.new(1, -20, 1, -20)
loadingText.Position = UDim2.new(0, 10, 0, 10)
loadingText.BackgroundTransparency = 1
loadingText.Text = "🔧 Carregando YayCat...\n\nPor favor, aguarde..."
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextSize = 18
loadingText.Font = Enum.Font.Gotham
loadingText.TextWrapped = true
loadingText.Parent = loadingFrame

-- Carregar e inicializar
local YayCat = loadYayCat()

if YayCat then
    -- Remover tela de loading
    loadingScreen:Destroy()
    
    -- Setup automático
    YayCat.quickSetup()
    
    -- Notificação
    game.StarterGui:SetCore("SendNotification", {
        Title = "YayCat",
        Text = "Carregada com sucesso!",
        Icon = "rbxassetid://4483345998",
        Duration = 5
    })
else
    loadingText.Text = "❌ Erro ao carregar YayCat!\n\nVerifique sua conexão."
end
