--Очень нужная библиотека для работы некоторых скриптов
--Автор: akero
--Версия: 1.0

local letlib = {}

function letlib.itWork_QuestionMark()
    sampAddChatMessage("Да, работает", -1)
end

function letlib.about()
    sampShowDialog(12001, "LetLib by akero", "Очень нужная бибилотека для работы wordle работает, а еще и диалог показывается :3", "Ок", "Круто" ,0)
end

return letlib