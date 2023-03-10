local model = {}

--====================================================================================================
--INFORMATRON MESSAGER
--====================================================================================================

function model.notify(page)

    -- notfy for this page in the informatron

    if page == "black-hole" then
        game.print({"exotic-industries.message-informatron", "Black hole generators"})
    end

end

--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_research_finished(event)

    local research = event.research

    -- research of LuaTechnology

end

return model