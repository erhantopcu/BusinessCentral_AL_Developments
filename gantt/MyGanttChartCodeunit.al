codeunit 50100 MyGanttChartCodeunit
{
    Subtype = Test;

    procedure CreateTask(TaskID: Code[20]; TaskName: Text[100]; StartDate: Date; EndDate: Date; ResourceID: Code[20])
    begin
        // Yeni görev oluşturma işlemleri
        // TaskID, TaskName, StartDate, EndDate ve ResourceID parametrelerini kullanarak iş mantığını uygulayın
    end;

    procedure UpdateTask(TaskID: Code[20]; TaskName: Text[100]; StartDate: Date; EndDate: Date; ResourceID: Code[20])
    begin
        // Görev güncelleme işlemleri
        // TaskID, TaskName, StartDate, EndDate ve ResourceID parametrelerini kullanarak iş mantığını uygulayın
    end;

    procedure DeleteTask(TaskID: Code[20])
    begin
        // Görev silme işlemleri
        // TaskID parametresini kullanarak iş mantığını uygulayın
    end;
}