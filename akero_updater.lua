script_name("akero_updater")

local workdir = getWorkingDirectory()
local isLetlib = doesFileExist(workdir.."\\lib\\letlib\\init.lua")

function main()
    while not isSampAvailable() do
        wait(100)
    end
    print("Начал проверку на наличие библиотек...")
    if not isLetlib then
        print("Не обнаружил библиотеку LetLib, предлагаю установку")
        local active = true
        while active do
            wait(1000)
            sampShowDialog(12000, "Akero Updater | Отсутствует библиотека!", "{ffffff}У вас не установлена критически важная для работы скриптов библиотека:\n«{32efd2}LetLib{ffffff}»\nЖелаете ли вы установить её? (В случае отказа скрипты работать не будут)", "Ок", "Отмена", 0)
            local result, button, aba, huava = sampHasDialogRespond(12000)
            if result then
                if button == 1 then
                    sampAddChatMessage("Это должна быть кнопка ОК", -1)
                    active = false
                end
                if button == 0 then
                    sampAddChatMessage("А это должно быть отменой", -1)
                    active = false
                end
            end
        end
    end
    if isLetlib then
        print("Обнаружил нужные библиотеки, завершаю работу")
    end
end