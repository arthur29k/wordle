script_author("akero")
script_name('Wordle')
script_version('1.0')

------------------------------------------LIBS----------------------------------------------
local sampev = require("lib.samp.events")
require "strings"
-----------------------------------------LOCALES--------------------------------------------
local debugmode = false
local version = (thisScript().version)
local active = false
local msgcolor = ('0xFF32EFD2')
local word = ("NONE")
-----------------------------------------SOUNDS---------------------------------------------
local soundPath = getWorkingDirectory() .. "\\resource\\wordle"
local notif_sound = loadAudioStream(soundPath .. "\\wordle_notif_sound.mp3")
assert(notif_sound, 'Error in loading notif_sound! Did you install it?')
--------------------------------------------------------------------------------------------

function main()
    while not isSampAvailable() do
        wait(100)
    end 
    print("Привет прогнивший мир!")
    sampAddChatMessage("[Wordle] {ffffff}Скрипт запущен, используйте /wordle для активации", msgcolor)
    sampAddChatMessage('[Wordle] {ffffff}Автор скрипта: akero. Версия: ' .. tostring(version), msgcolor)

    sampRegisterChatCommand("wordle", activate)
    sampRegisterChatCommand("debuger", debuger)
    wait(-1)
end

function debuger() --Debug Command
    debugmode = not debugmode
    print(debugmode and "Debug mode ON" or "Debug mode OFF")
end

function activate(arg) --Команда /wordle
    if active == true and arg:match(".+") then
            sampAddChatMessage("[Wordle] {ffffff}Искомое слово заменено на: «" .. arg .. "»", msgcolor)
            word = arg:lower()
            if debugmode == true then
                print("Searching word is: "..word)
            end 
        elseif active == false then
        if arg:match(".+") then
            active = true
            sampAddChatMessage("[Wordle] {ffffff}Запущен поиск слова «" .. arg .. "» в чате", msgcolor)
            word = arg:lower()
            if debugmode == true then
                print("Searching word is: "..word)
            end
        else 
            sampAddChatMessage("[Wordle] {ffffff}Используй: /wordle [Искомое слово]", msgcolor)
        end
    else
        active = false
        sampAddChatMessage("[Wordle] {ffffff}Поиск слова в чате остановлен", msgcolor)
        if debugmode == true then
            print("active="..tostring(active))
        end
    end
end

function sampev.onServerMessage(color, text) --Проверка текста в чате
    if active == true then
        local lowtext = text:lower()
        if lowtext:find(word) then
            sampAddChatMessage("[Wordle] {ffffff}В чате обнаружено искомое слово! Поиск остановлен", msgcolor)
            setAudioStreamState(notif_sound, 1)
            active = false
        end
    end
end

function onScriptTerminate(script, game_quit) --Краш скрипта
    if script == thisScript() and not game_quit and not reload_script then
        sampAddChatMessage("[Wordle] {ffffff}Скрипт приостановил работу, проверьте консоль SAMPFUNCS", msgcolor)
    end
end