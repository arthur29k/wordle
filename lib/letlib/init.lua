--����� ������ ���������� ��� ������ ��������� ��������
--�����: akero
--������: 1.0

local letlib = {}

function letlib.itWork_QuestionMark()
    sampAddChatMessage("��, ��������", -1)
end

function letlib.about()
    sampShowDialog(12001, "LetLib by akero", "����� ������ ���������� ��� ������ wordle ��������, � ��� � ������ ������������ :3", "��", "�����" ,0)
end

return letlib