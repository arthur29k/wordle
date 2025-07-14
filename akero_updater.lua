script_name("akero_updater")

local workdir = getWorkingDirectory()
local isLetlib = doesFileExist(workdir.."\\lib\\letlib\\init.lua")

function main()
    while not isSampAvailable() do
        wait(100)
    end
    print("����� �������� �� ������� ���������...")
    if not isLetlib then
        print("�� ��������� ���������� LetLib, ��������� ���������")
        local active = true
        while active do
            wait(1000)
            sampShowDialog(12000, "Akero Updater | ����������� ����������!", "{ffffff}� ��� �� ����������� ���������� ������ ��� ������ �������� ����������:\n�{32efd2}LetLib{ffffff}�\n������� �� �� ���������� �? (� ������ ������ ������� �������� �� �����)", "��", "������", 0)
            local result, button, aba, huava = sampHasDialogRespond(12000)
            if result then
                if button == 1 then
                    sampAddChatMessage("��� ������ ���� ������ ��", -1)
                    active = false
                end
                if button == 0 then
                    sampAddChatMessage("� ��� ������ ���� �������", -1)
                    active = false
                end
            end
        end
    end
    if isLetlib then
        print("��������� ������ ����������, �������� ������")
    end
end