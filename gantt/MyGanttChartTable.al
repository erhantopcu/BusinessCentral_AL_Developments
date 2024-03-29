table 50100 MyGanttChartTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; TaskID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Task ID';
        }

        field(2; TaskName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Name';
        }

        field(3; StartDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Start Date';
        }

        field(4; EndDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'End Date';
        }

        field(5; ResourceID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Resource ID';
        }
    }

    keys
    {
        key(PK; TaskID)
        {
            Clustered = true;
        }
    }
}