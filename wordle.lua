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
    print("������ ���������� ���!")
    sampAddChatMessage("[Wordle] {ffffff}������ �������, ����������� /wordle ��� ���������", msgcolor)
    sampAddChatMessage('[Wordle] {ffffff}����� �������: akero. ������: ' .. tostring(version), msgcolor)

    sampRegisterChatCommand("wordle", activate)
    sampRegisterChatCommand("debuger", debuger)
    wait(-1)
end

function debuger() --Debug Command
    debugmode = not debugmode
    print(debugmode and "Debug mode ON" or "Debug mode OFF")
end

function activate(arg) --������� /wordle
    if active == true and arg:match(".+") then
            sampAddChatMessage("[Wordle] {ffffff}������� ����� �������� ��: �" .. arg .. "�", msgcolor)
            word = arg:lower()
            if debugmode == true then
                print("Searching word is: "..word)
            end 
        elseif active == false then
        if arg:match(".+") then
            active = true
            sampAddChatMessage("[Wordle] {ffffff}������� ����� ����� �" .. arg .. "� � ����", msgcolor)
            word = arg:lower()
            if debugmode == true then
                print("Searching word is: "..word)
            end
        else 
            sampAddChatMessage("[Wordle] {ffffff}���������: /wordle [������� �����]", msgcolor)
        end
    else
        active = false
        sampAddChatMessage("[Wordle] {ffffff}����� ����� � ���� ����������", msgcolor)
        if debugmode == true then
            print("active="..tostring(active))
        end
    end
end

function sampev.onServerMessage(color, text) --�������� ������ � ����
    if active == true then
        local lowtext = text:lower()
        if lowtext:find(word) then
            sampAddChatMessage("[Wordle] {ffffff}� ���� ���������� ������� �����! ����� ����������", msgcolor)
            setAudioStreamState(notif_sound, 1)
            active = false
        end
    end
end

function onScriptTerminate(script, game_quit) --���� �������
    if script == thisScript() and not game_quit and not reload_script then
        sampAddChatMessage("[Wordle] {ffffff}������ ������������ ������, ��������� ������� SAMPFUNCS", msgcolor)
    end
end