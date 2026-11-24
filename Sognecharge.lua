-- ==================================================
-- SOGNECHARGE ADDON (Octowow 1.18.1)
-- ==================================================

-- 1. Gjør GetStance global slik at SuperMacro/iWin ikke krasjer
function GetStance()
    for i = 1, GetNumShapeshiftForms() do
        local _, _, isActive = GetShapeshiftFormInfo(i)
        if isActive then 
            return i 
        end
    end
    return 0
end
_G["GetStance"] = GetStance

-- 2. Hovedfunksjon med innebygd Battle Stance-sjekk
function Charge()
    -- Sjekk for mål / velg nærmeste fiende om ikke eksisterer
    if not UnitExists("target") or UnitIsDead("target") then
        ClearTarget()
        TargetNearestEnemy()
        if not UnitExists("target") or UnitIsDead("target") then return end
    end

    local s = GetStance()

    -- A) VENNLIG MÅL: Bytt til Defensive Stance (2) og bruk Intervene
    if UnitIsFriend("player", "target") then
        if s ~= 2 then
            CastShapeshiftForm(2)
            return
        end
        CastSpellByName("Intervene")
        return
    end

    -- B) FIENDENTLIG MÅL (IKKE FRIENDLY TARGET):
    if not UnitAffectingCombat("player") then
        -- Ute av combat: Bytt til Battle Stance (1) og bruk Charge
        if s ~= 1 then
            CastShapeshiftForm(1)
            return
        end
        CastSpellByName("Charge")
    else
        -- I combat: Bytt til Berserker Stance (3) og bruk Intercept
        if s ~= 3 then
            CastShapeshiftForm(3)
            return
        end
        CastSpellByName("Intercept")
    end
end
_G["Charge"] = Charge

-- 3. Registrer slash-kommandoer slik at du kan skrive /charge direkte
SLASH_CHARGE1 = "/charge"
SLASH_CHARGE2 = "/sc"
SLASH_CHARGE3 = "/sognecharge"
SlashCmdList["CHARGE"] = function()
    Charge()
end