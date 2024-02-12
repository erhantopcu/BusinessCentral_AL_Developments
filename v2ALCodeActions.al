// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.P2;

using Microsoft.Sales.Customer;

pageextension 54148 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('WelcomeToCustomerList');
    end;

    /* begin
        Message(GenerateAwesomeMessage(Today()));
    end;

    local procedure GenerateAwesomeMessage(Today: Date): Text
    var
        d: Integer;
        m: Integer;
        y: Integer;
    begin
        d := 3;
        m := 4;
        y := 5;

        //burayı procedure olarak (extension yukardaki variable kullanarak) dönüştürebiliyor.
        Awesome2(d, m);

    end;

    local procedure Awesome2(var d: Integer; var m: Integer): Text
    begin
        for d := m to m * 5 do begin
            for m := d to d * 5 do begin
                if d = m then
                    exit('TEST!!!')
            end;
        end;
    end; */
}