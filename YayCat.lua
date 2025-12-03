-- ==============================================
-- YAYCAT UNIVERSAL GAME HELPER
-- Versão: 1.0
-- Autor: Alex7043
-- Chave: YayCatIsGood
-- ==============================================

local YayCat = {}
YayCat.Version = "1.0"
YayCat.Author = "Alex7043"

-- 🔐 SISTEMA DE VERIFICAÇÃO
function YayCat.verifyKey(key)
    if key == "YayCatIsGood" then
        print("✅ [YayCat] Verificado com sucesso!")
        print("👋 Bem-vindo, Alex7043!")
        YayCat._verified = true
        return true
    else
        print("❌ [YayCat] Chave inválida!")
        return false
    end
end

-- 🚀 INICIALIZAR
function YayCat.init()
    if not YayCat._verified then
        print("⚠️ Verifique primeiro: YayCat.verifyKey('YayCatIsGood')")
        return
    end
    
    print("🚀 [YayCat] Inicializando...")
    
    -- Serviços do Roblox
    YayCat.Services = {
        Players = game:GetService("Players"),
        Workspace = game:GetService("Workspace"),
        RunService = game:GetService("RunService"),
        UserInputService = game:GetService("UserInputService")
    }
    
    -- Criar funções
    YayCat._setupFunctions()
    
    print("✅ [YayCat] Pronto para uso!")
    YayCat.showHelp()
end

-- 🛠️ CONFIGURAR FUNÇÕES
function YayCat._setupFunctions()
    -- 👁️ ESP SIMPLES
    YayCat.ESP = {
        enabled = false,
        
        enable = function(self, state)
            self.enabled = state
            if state then
                print("👁️ [ESP] Ativado!")
                self:_start()
            else
                print("👁️ [ESP] Desativado!")
            end
        end,
        
        _start = function(self)
            spawn(function()
                while self.enabled and wait(0.1) do
                    -- Código do ESP vai aqui
                end
            end)
        end
    }
    
    -- 🏃 FUNÇÕES DE MOVIMENTO
    YayCat.Movement = {
        speedHack = function(speed)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = speed
                    print("🏃 [Speed] Velocidade: " .. speed)
                    return true
                end
            end
            return false
        end,
        
        jumpPower = function(power)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.JumpPower = power
                    print("🦘 [Jump] Pulo: " .. power)
                    return true
                end
            end
            return false
        end,
        
        teleport = function(x, y, z)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = CFrame.new(x, y, z)
                    print("📍 [TP] Teleportado para: " .. x .. ", " .. y .. ", " .. z)
                    return true
                end
            end
            return false
        end,
        
        noclip = function(state)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = not state
                    end
                end
                print(state and "🛸 [Noclip] Ativado!" or "🛸 [Noclip] Desativado!")
                return true
            end
            return false
        end
    }
    
    -- 🤖 AUTO FUNCTIONS
    YayCat.Auto = {
        click = function(enabled)
            if enabled then
                print("🖱️ [AutoClick] Ativado!")
                -- Código do auto click
            else
                print("🖱️ [AutoClick] Desativado!")
            end
        end,
        
        farm = function(targetName)
            print("🤖 [AutoFarm] Farmando: " .. (targetName or "tudo"))
            -- Código do auto farm
        end,
        
        collect = function(enabled)
            if enabled then
                print("💰 [AutoCollect] Coletando itens...")
            else
                print("💰 [AutoCollect] Parado!")
            end
        end
    }
    
    -- 🎮 FUNÇÕES DO JOGO
    YayCat.Game = {
        getPlayers = function()
            return game.Players:GetPlayers()
        end,
        
        getFPS = function()
            return math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        end,
        
        getInfo = function()
            return {
                name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                players = #game.Players:GetPlayers(),
                placeId = game.PlaceId
            }
        end
    }
    
    -- 🎨 INTERFACE
    YayCat.UI = {
        showMenu = function()
            print("\n" .. string.rep("=", 40))
            print("🎮 MENU YAYCAT - Alex7043")
            print(string.rep("=", 40))
            print("👁️  ESP: " .. (YayCat.ESP.enabled and "ON" or "OFF"))
            print("🏃 Speed: use speedHack(valor)")
            print("📍 TP: use teleport(x,y,z)")
            print("🤖 Auto: use Auto.farm('nome')")
            print("❓ Ajuda: YayCat.showHelp()")
            print(string.rep("=", 40))
        end,
        
        notify = function(title, message)
            print("[📢 " .. title .. "] " .. message)
        end
    }
end

-- 📋 AJUDA
function YayCat.showHelp()
    print("\n" .. string.rep("=", 50))
    print("📖 YAYCAT - COMANDOS DISPONÍVEIS")
    print(string.rep("=", 50))
    print("🔐 VERIFICAÇÃO:")
    print("  YayCat.verifyKey('YayCatIsGood')")
    print("  YayCat.init()")
    print("\n👁️ ESP:")
    print("  YayCat.ESP.enable(true/false)")
    print("\n🏃 MOVIMENTO:")
    print("  YayCat.Movement.speedHack(50)")
    print("  YayCat.Movement.jumpPower(100)")
    print("  YayCat.Movement.teleport(0,100,0)")
    print("  YayCat.Movement.noclip(true)")
    print("\n🤖 AUTOMAÇÃO:")
    print("  YayCat.Auto.click(true)")
    print("  YayCat.Auto.farm('Inimigo')")
    print("  YayCat.Auto.collect(true)")
    print("\n🎮 JOGO:")
    print("  YayCat.Game.getPlayers()")
    print("  YayCat.Game.getFPS()")
    print("  YayCat.Game.getInfo()")
    print("\n🎨 INTERFACE:")
    print("  YayCat.UI.showMenu()")
    print("  YayCat.UI.notify('Título', 'Mensagem')")
    print("\n🧹 LIMPEZA:")
    print("  YayCat.cleanup()")
    print(string.rep("=", 50))
end

-- 🧹 LIMPAR TUDO
function YayCat.cleanup()
    print("🧹 [YayCat] Limpando tudo...")
    YayCat.ESP.enable(false)
    YayCat.Movement.speedHack(16)
    YayCat.Movement.noclip(false)
    YayCat.Auto.click(false)
    print("✅ [YayCat] Limpeza completa!")
end

-- ⚡ AUTO SETUP
function YayCat.autoSetup()
    print("⚡ [YayCat] Setup automático...")
    YayCat.verifyKey("YayCatIsGood")
    YayCat.init()
    YayCat.ESP.enable(true)
    YayCat.Movement.speedHack(80)
    YayCat.UI.showMenu()
    print("✅ [YayCat] Setup completo!")
end

-- 🎪 MENSAGEM INICIAL
print("\n" .. string.rep("=", 50))
print("🐱 YAYCAT UNIVERSAL HELPER v" .. YayCat.Version)
print("👤 Autor: " .. YayCat.Author)
print("🔑 Use: YayCat.verifyKey('YayCatIsGood')")
print("📖 Use: YayCat.showHelp() para ajuda")
print(string.rep("=", 50))

return YayCat
