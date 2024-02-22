table 54100 "MyApp Setup"
{
    Caption = 'MyApp Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(10; "Important Setup 1"; Date)
        {
            Caption = 'Important Setup 1';
        }
        field(11; "Important Account"; Code[20])
        {
            Caption = 'Important Account';
        }
        field(12; "Important Item"; Code[20])
        {
            Caption = 'Important Item';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
