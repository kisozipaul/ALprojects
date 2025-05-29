pageextension 50120 "CRONUS Social Media Card" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("Social Media")
            {
                Caption = 'Social Media';

                field(Facebook; Rec.Facebook)
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("X, formerly Twitter"; Rec."X, formerly Twitter")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field(Instagram; Rec.Instagram)
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field(LinkedIn; Rec.LinkedIn)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }
}
