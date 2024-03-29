page 54100 "MyApp Setup"
{
    Caption = 'MyApp Setup';
    PageType = Card;
    SourceTable = "MyApp Setup";


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General Setup';
                field("Important Setup 1"; Rec."Important Setup 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Important Setup 1 field.';
                }
                field("Important Account"; Rec."Important Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Important Account field.';
                }
                field("Important Item"; Rec."Important Item")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Important Item field.';
                }
            }
        }
    }
}