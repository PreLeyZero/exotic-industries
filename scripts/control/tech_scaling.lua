-- Read cost of last technology in the game (exclude infinite technologies)
-- Calculate reasearch cost of each technology and set technology_price_multiplier accordingly

local ei_tech_scaling = {}

--====================================================================================================
--TECH SCALING
--====================================================================================================

function ei_tech_scaling.init()
    
    if not storage.ei["tech_scaling"] then
        storage.ei["tech_scaling"] = {}
    end

    -- switch for max Cost
    local maxCost = ei_lib.switch_string(
        ei_data["tech_scaling"].switch_table,
        ei_lib.config("tech-scaling__maxCost")
    )

    -- set max Cost and start price
    storage.ei["tech_scaling"].maxCost = maxCost
    storage.ei["tech_scaling"].startPrice = ei_lib.config("tech-scaling__startPrice")

    -- count total number of technologies
    storage.ei["tech_scaling"].techCount = ei_lib.getn(prototypes.technology)
end

function ei_tech_scaling.on_research_finished()
    maxCost = storage.ei["tech_scaling"].maxCost
    startPrice = storage.ei["tech_scaling"].startPrice
    techCount = storage.ei["tech_scaling"].techCount

    -- do this for player force -> no support for multiple forces yet
    force = game.forces[1]

    local currentTechs = 0
    -- do this for each technology
    for _,tech in pairs(force.technologies) do
        if tech.enabled then
            if tech.prototype.research_unit_count_formula == nil then
                if tech.researched then
                    currentTechs = currentTechs + 1
                end
            end
        end
    end
    
    local formulaType = ei_lib.config("tech-scaling__curveForm")
    local multiplier = ei_tech_scaling.get_multiplier(maxCost, techCount, startPrice, currentTechs, formulaType)
    local additional_multiplier = ei_lib.config("tech-scaling__additionalMultiplier")

    local total_multiplier = multiplier * additional_multiplier

    if total_multiplier > 1000 then
        total_multiplier = 1000
    end

    -- set multiplier
    game.difficulty_settings.technology_price_multiplier = total_multiplier
end

--FORMULA DERIVATION
------------------------------------------------------------------------------------------------------
-- we plot cost (in y) over n number of technologies (in x) -> (y, n)
-- assume start point: A = (0, C)           ...C is the start price
-- assume end point:   B = (N, X)           ...C is the max cost

-- Linear: Form y = ax + b <-> cost(n) = a*n + b
-- b: use point A -> cost(0) = a*0 + b =!= C <-> b = C
-- a: use point B -> cost(N) = a*N + b =!= X <-> a = (X - b)/N 

-- Quadratic: Form y = ax^2 + bx + c <-> cost(n) = a*n^2 + c | here we wont need b
-- c: use point A -> c = C
-- a: use point B -> cost(N) = a*N^2 + C =!= X <-> a = (X - C)/N^2

-- Exp: Form y = exp(b*x) + c <-> cost(n) = exp(b*n) + c
-- c: use point A -> cost(0) = 1 + c =!= C <-> c = C - 1
-- b: use point B -> cost(N) = exp(b*N) + C - 1 <-> b = ln(X + 1 - C)/N

-- we got:  cost_lin(n) = (X - C)/N * n + C
--          cost_qua(n) = (X - C)/N^2 * n^2 + C
--          cost_exp(n) = exp(n/N * ln(X + 1 - C)) + C - 1

-- since we need technology_price_multiplier use Ansatz: cost(n) =!= f(...) * C
-- we get:  f_lin(...) = (X - C)/(N*C) * n + 1
--          f_qua(...) = (X - C)/(N^2 * C) * n^2 + 1
--          f_exp(...) = (exp(n/N * ln(X + 1 - C)) - 1)/C + 1

-- we use the following variables for X, N, C, n
-- X .. maxCost
-- N .. techCount
-- C .. startPrice
-- n .. currentTechs

-- NOTE: Linear will increase strongly in early game, but will make late game "easier"
--       Exponential will increase slowly in early game, but will make late game much harder
--       Quadratic will begin to get more difficult earlier in the game then exp but wont be as steep as exp

-- OVERALL USAGE:
-- we can integrate the 3 curves to get their area, which corresponds to the total needed science packs
-- integrate from 0 to N ofc
-- S cost_lin(n) dn = N/2 * (X + C)
-- S cost_qua(n) dn = N/3 * (X + 2C)
-- S cost_exp(n) dn = N(C - 1 + (X + 1 - C)/ln(X + 1 - C))

-- for big X we can assume ln(X + 1 - C) ~ ln(X) f.e. ln(X=10k) ~ 9
--              -> Area(exp) = N(C - 1 + 1/9 * (X + 1 - C)) ~ N*X/9
--              -> Area(lin) ~ N*X/2
--              -> Area(qua) ~ N*X/3

-- therfore overall exponential is cheapest, then quadratic and linear is most difficult

function ei_tech_scaling.get_multiplier(X, N, C, n, formulaType)
    -- set default formulaType to quadratic
    formulaType = formulaType or "quadratic"

    if formulaType == "linear" then
        return (X - C)/(N*C)*n + 1
    end

    if formulaType == "quadratic" then
        return (X - C)/(N^2 * C) * n^2 + 1
    end

    if formulaType == "exponential" then
        return (math.exp(n/N * math.log(X + 1 - C)) - 1)/C + 1
    end

    return 1
end


return ei_tech_scaling