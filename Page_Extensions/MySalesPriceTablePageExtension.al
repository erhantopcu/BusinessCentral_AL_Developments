pageextension 50500 "MySalesPriceTablePageExtension" extends "Sales Prices"
{
    layout
    {
        addafter("Sales Code")
        {

            field(Description2; Rec.Description2)
            {
                ApplicationArea = All;
                Caption = 'Description2';
                ToolTip = 'Description from Customer Table';
            }
        }
    }
}

