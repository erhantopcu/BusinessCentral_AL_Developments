report 54101 "Detailed Sales Invoice List"
{

    // 6GEN Erhan Topçu 02.02.2024 -  changes added
    DefaultLayout = RDLC;
    RDLCLayout = './Sales/Reports/Detailed Sales Invoice List.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'Ayrıntılı Satış Fatura Listesi';
    PreviewMode = PrintLayout; //added
    UsageCategory = ReportsAndAnalysis;
    DataAccessIntent = ReadOnly; //added

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.")
                                WHERE(Reversed = CONST(false));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Posting Date", "Document Date", "Sell-to Customer No.", "Bill-to Customer No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID; USERID)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(Sales_Invoice_Header__GETFILTERS; "Sales Invoice Header".GETFILTERS)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Sales_Invoice_Line__GETFILTERS; "Sales Invoice Line".GETFILTERS)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Detailed_Sales_Invoice_ListCaption; Detailed_Sales_Invoice_ListCaptionLbl)
            {
            }
            column(Sales_Invoice_Line_QuantityCaption; "Sales Invoice Line".FIELDCAPTION(Quantity))
            {
            }
            column(Sales_Invoice_Line_AmountCaption; Sales_Invoice_Line_AmountCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Sales_Invoice_Line__No__Caption; "Sales Invoice Line".FIELDCAPTION("No."))
            {
            }
            column(Sales_Invoice_Line__Unit_Price_Caption; Sales_Invoice_Line__Unit_Price_CaptionLbl)
            {
            }
            column(Sales_Invoice_Header___Currency_Code_Caption; FIELDCAPTION("Currency Code"))
            {
            }
            column(Sales_Invoice_Header___Sell_to_Customer_Name_Caption; FIELDCAPTION("Sell-to Customer Name"))
            {
            }
            column(Sales_Invoice_Header___External_Document_No__Caption; FIELDCAPTION("External Document No."))
            {
            }
            column(Sales_Invoice_Header___Posting_Date_Caption; FIELDCAPTION("Posting Date"))
            {
            }
            column(Sales_Invoice_Line__Variant_Code_Caption; "Sales Invoice Line".FIELDCAPTION("Variant Code"))
            {
            }
            column(KurCaption; KurCaptionLbl)
            {
            }
            column(Birim_Fiyat_LPBCaption; Birim_Fiyat_LPBCaptionLbl)
            {
            }
            column(Line_Amount__LCY_Caption; Line_Amount__LCY_CaptionLbl)
            {
            }
            column(Customer_No_Caption; Customer_No_CaptionLbl)
            {
            }
            column(Document_DateCaption; Document_DateCaptionLbl)
            {
            }
            column(G_L_Register_No_Caption; G_L_Register_No_CaptionLbl)
            {
            }
            column(VAT_Amount__LCY_Caption; VAT_Amount__LCY_CaptionLbl)
            {
            }
            column(VAT_AmountCaption; VAT_AmountCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_; "No.")
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(<> 0));
                RequestFilterFields = "No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "VAT Bus. Posting Group";
                column(Sales_Invoice_Line__No__; "No.")
                {
                }
                column(Description_________Description_2_; Description + ' ' + "Description 2")
                {
                }
                column(Sales_Invoice_Line__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(Sales_Invoice_Line_Quantity; Quantity)
                {
                }
                column(Sales_Invoice_Line_Amount; Amount)
                {
                    AutoFormatExpression = GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Sales_Invoice_Line__Unit_Price_; "Unit Price")
                {
                    AutoFormatExpression = GetCurrencyCode;
                    AutoFormatType = 2;
                }
                column(Sales_Invoice_Header___Currency_Code_; "Sales Invoice Header"."Currency Code")
                {
                }
                column(Sales_Invoice_Header___Sell_to_Customer_Name_; "Sales Invoice Header"."Sell-to Customer Name")
                {
                }
                column(Sales_Invoice_Header___External_Document_No__; "Sales Invoice Header"."External Document No.")
                {
                }
                column(Sales_Invoice_Header___Posting_Date_; "Sales Invoice Header"."Posting Date")
                {
                }
                column(Sales_Invoice_Line__Variant_Code_; "Variant Code")
                {
                }
                column(CurrencyFactor; CurrencyFactor)
                {
                    DecimalPlaces = 0 : 3;
                }
                column(UnitPriceLCY; UnitPriceLCY)
                {
                    AutoFormatType = 2;
                }
                column(AmtLCY; AmtLCY)
                {
                    AutoFormatType = 1;
                }
                column(Sales_Invoice_Header___Sell_to_Customer_No__; "Sales Invoice Header"."Sell-to Customer No.")
                {
                }
                column(Sales_Invoice_Header___Document_Date_; "Sales Invoice Header"."Document Date")
                {
                }
                column(CustLedEntry__G_L_Register_No__; "Sales Invoice Header"."Document Date")
                {
                }
                column(VATAmtLCY; VATAmtLCY)
                {
                    AutoFormatType = 1;
                }
                column(Amount_Including_VAT____Amount; "Amount Including VAT" - Amount)
                {
                    AutoFormatExpression = GetCurrencyCode;
                    AutoFormatType = 1;
                }
                column(Sales_Invoice_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Invoice_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    IF Quantity <> 0 THEN BEGIN
                        UnitPriceLCY := ROUND(CurrencyFactor * Amount / Quantity, GLSetup."Unit-Amount Rounding Precision");
                        "Unit Price" := ROUND(Amount / Quantity, GLSetup."Unit-Amount Rounding Precision");
                    END ELSE BEGIN
                        UnitPriceLCY := 0;
                        "Unit Price" := 0;
                    END;

                    AmtLCY := ROUND(CurrencyFactor * Amount, GLSetup."Amount Rounding Precision");
                    AmtIncludingVATLCY := ROUND(CurrencyFactor * "Amount Including VAT", GLSetup."Amount Rounding Precision");
                    VATAmtLCY := AmtIncludingVATLCY - AmtLCY;


                    IF PrintToExcel THEN
                        MakeExcelDataBody;
                end;

                trigger OnPreDataItem()
                begin
                    IF "Sales Invoice Header"."Currency Factor" <> 0 THEN
                        CurrencyFactor := 1 / "Sales Invoice Header"."Currency Factor"
                    ELSE
                        CurrencyFactor := 1;

                    GLSetup.GET;
                    CustLedEntry.SETRANGE(CustLedEntry."Document No.", "Sales Invoice Header"."No.");
                    CustLedEntry.SETRANGE(CustLedEntry."Document Type", CustLedEntry."Document Type"::Invoice);
                    CustLedEntry.SETRANGE(CustLedEntry."Customer No.", "Sales Invoice Header"."Bill-to Customer No.");
                    IF CustLedEntry.FIND('-') THEN;
                end;
            }

            trigger OnPostDataItem()
            begin
                IF PrintToExcel THEN
                    CreateExcelbook;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("Seçenekler")
                {
                    Caption = 'Seçenekler';
                    field(PrintToExcel; PrintToExcel)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Excel''e Yazdır';
                        Visible = true;
                        Editable = true;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        IF PrintToExcel THEN
            MakeExcelInfo;
    end;

    var
        CurrencyFactor: Decimal;
        UnitPriceLCY: Decimal;
        AmtLCY: Decimal;
        VATAmtLCY: Decimal;
        AmtIncludingVATLCY: Decimal;
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        Text100: Label 'Şirket Adı';
        Text101: Label 'Veri';
        Text102: Label 'Satış Fatura Satırları Raporu';
        Text103: Label 'Dönem: %1';
        Text104: Label 'Rapor No.';
        Text105: Label 'Rapor Adı';
        Text106: Label 'Kullanıcı Kimliği';
        Text107: Label 'Tarih';
        Text108: Label 'Filtreler';
        Text109: Label 'No';
        Text110: Label 'Varyant Kodu';
        Text111: Label 'Müşteri No';
        Text112: Label 'Müşteri Adı';
        Text113: Label 'Deftere Nakil Tarihi';
        Text114: Label 'Harici Belge No';
        Text115: Label 'Miktar';
        Text116: Label 'Döviz Cinsi';
        Text117: Label 'Kur';
        Text118: Label 'Birim Fiyat (LPB)';
        Text119: Label 'Satır Tutarı (LPB)';
        Text120: Label 'Birim Fiyat';
        Text121: Label 'Satır Tutarı';
        Text122: Label 'G/M Kayıt No';
        Text123: Label 'Brüt Ağırlık';
        Text124: Label 'Net Ağırlık';
        Text125: Label 'Açıklama';
        GLSetup: Record "General Ledger Setup";
        CustLedEntry: Record "Cust. Ledger Entry";
        Text126: Label 'Belge Tarihi';
        Text128: Label 'KDV Tutarı (LPB)';
        Text129: Label 'KDV Tutarı';
        CurrReport_PAGENOCaptionLbl: Label 'Sayfa';
        Detailed_Sales_Invoice_ListCaptionLbl: Label 'Detaylı Satış Faturası Listesi';
        Sales_Invoice_Line_AmountCaptionLbl: Label 'Satır Tutarı';
        DescriptionCaptionLbl: Label 'Açıklama';
        Sales_Invoice_Line__Unit_Price_CaptionLbl: Label 'Birim Fiyat';
        KurCaptionLbl: Label 'Kur';
        Birim_Fiyat_LPBCaptionLbl: Label 'Birim Fiyat LPB';
        Line_Amount__LCY_CaptionLbl: Label 'Satır Tutarı (LPB)';
        Customer_No_CaptionLbl: Label 'Müşteri No';
        Document_DateCaptionLbl: Label 'Belge Tarihi';
        G_L_Register_No_CaptionLbl: Label 'G/M Kayıt No';
        VAT_Amount__LCY_CaptionLbl: Label 'KDV Tutarı (LPB)';
        VAT_AmountCaptionLbl: Label 'KDV Tutarı';

    procedure MakeExcelInfo()
    begin
        ExcelBuf.SetUseInfoSheet;
        ExcelBuf.AddInfoColumn(FORMAT(Text100), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(COMPANYNAME, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text105), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(FORMAT(Text102), FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text104), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(REPORT::"Detailed Sales Invoice List", FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text106), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(USERID, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text107), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(TODAY, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text108), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn("Sales Invoice Header".GETFILTERS, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text108), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn("Sales Invoice Line".GETFILTERS, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;

        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(FORMAT(Text109), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text110), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text125), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text111), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text112), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text126), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text113), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text114), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text122), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text115), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text116), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text117), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);

        ExcelBuf.AddColumn(FORMAT(Text120), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text121), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text129), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);

        ExcelBuf.AddColumn(FORMAT(Text118), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text119), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text128), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);


        ExcelBuf.AddColumn(FORMAT(Text123), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text124), FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
    end;

    procedure MakeExcelDataBody()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Sales Invoice Line"."No.", FALSE, '', FALSE, FALSE, FALSE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line"."Variant Code", FALSE, '', FALSE, FALSE, FALSE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line".Description, FALSE, '', FALSE, FALSE, FALSE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."Sell-to Customer No.", FALSE, '', FALSE, FALSE, FALSE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."Sell-to Customer Name", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."Document Date", FALSE, '', FALSE, FALSE, FALSE, '@', ExcelBuf."Cell Type"::Date);
        ExcelBuf.AddColumn("Sales Invoice Header"."Posting Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.AddColumn("Sales Invoice Header"."External Document No.", FALSE, '', FALSE, FALSE, FALSE, '@', ExcelBuf."Cell Type"::Text);
        /*ExcelBuf.AddColumn(CustLedEntry."G/L Register No.", FALSE, '', FALSE, FALSE, FALSE, '@', ExcelBuf."Cell Type"::Text);*/
        ExcelBuf.AddColumn("Sales Invoice Line".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."Currency Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(CurrencyFactor, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);

        ExcelBuf.AddColumn("Sales Invoice Line"."Unit Price", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line".Amount, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line"."Amount Including VAT" - "Sales Invoice Line".Amount, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);

        ExcelBuf.AddColumn(UnitPriceLCY, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(AmtLCY, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(VATAmtLCY, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);


        ExcelBuf.AddColumn("Sales Invoice Line"."Gross Weight", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line"."Net Weight", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
    end;

    procedure CreateExcelbook()
    begin
        ExcelBuf.WriteSheet(PadStr(Text102, 30), CompanyName, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.OpenExcel();

        //ExcelBuf.CreateBookAndOpenExcel('', Text101, Text102, COMPANYNAME, USERID);
        //ExcelBuf.GiveUserControl;
        ERROR('');
    end;
}

