page 50100 MyGanttChartPage
{
    PageType = Card;
    SourceTable = MyGanttChartTable;
    ApplicationArea = All;
    Caption = 'GantChart';
    UsageCategory = ReportsAndAnalysis;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("TaskID"; 'task Name') { }
                field("StartDate"; 'End Date') { }
                field("ResourceID"; '') { }
            }
        }
    }
}