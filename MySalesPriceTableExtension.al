tableextension 50500 "MySalesPriceTableExtension" extends "Sales Price"
{
    fields
    {
        field(50500; "Description"; Text[100])
        {
            TableRelation = Item;
            //FieldClass = FlowField;
            Caption = 'Description';
            Editable = false;
            //CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));

        }
        field(50501; "Description2"; Text[100])
        {
            TableRelation = Item;
            FieldClass = FlowField;
            Caption = 'Description2';
            Editable = false;
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));

        }
    }
}