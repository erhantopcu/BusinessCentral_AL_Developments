pageextension 54144 OpenRatesCurrencies extends Currencies
{
    actions
    {
        addlast(processing)
        {
            action(GetOpenRates)
            {
                Caption = 'Get OpenRates';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                trigger OnAction()
                var
                    OpenRates: Codeunit "OpenRatesMgt";
                begin
                    OpenRates.GetRateForDate(Today());
                end;
            }
        }
    }
}