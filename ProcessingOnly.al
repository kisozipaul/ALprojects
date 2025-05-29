report 50104 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin
                Clear(Counter);
                if not ReplaceExisting then
                    SetRange("Name 2", ''); // Only customers with empty Name 2
            end;

            trigger OnAfterGetRecord()
            begin
                if Customer2.Get("No.") then begin
                    Customer2."Name 2" := Name2ToApply;
                    Customer2.Modify;
                    Counter += 1;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Ready! %1 customers were updated.', Counter);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(Name2ToApply; Name2ToApply)
                    {
                        ApplicationArea = All;
                        Caption = 'Name2 To Apply';
                        ToolTip = 'Specifies the Name 2 value to apply to customers.';
                    }

                    field(ReplaceExisting; ReplaceExisting)
                    {
                        ApplicationArea = All;
                        Caption = 'Replace Existing?';
                        ToolTip = 'If false, only customers with an empty Name 2 field will be updated.';
                    }
                }
            }
        }
    }

    var
        Name2ToApply: Text;
        Customer2: Record Customer;
        ReplaceExisting: Boolean;
        Counter: Integer;
}
