with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;


procedure UnionTest is

    type Month is 
        (JAN, FEB, MAR, APR, MAY, JUN, 
         JUL, AUG, SEP, OCT, NOV, DEC); -- Ada enumerated type
         
    -- define printing and parsing of Month values
    package Month_IO is
        new Ada.Text_IO.Enumeration_IO(Month);
    use Month_IO;         
         
    type MDay_Number is new Integer range 1 .. 31;
    
    -- define printing and parsing of Day_Number
    package MDay_Number_IO is
        new Ada.Text_IO.Integer_IO(MDay_Number);
    use MDay_Number_IO;

    type YDay_Number is new Integer range 1 .. 366;
    
    -- define printing and parsing of Day_Number
    package YDay_Number_IO is
        new Ada.Text_IO.Integer_IO(YDay_Number);
    use YDay_Number_IO;

    type Year is range -9999 .. 9999;
    
    -- define printing and parsing of Year
    package Year_IO is
        new Ada.Text_IO.Integer_IO(Year);
    use Year_IO;

    type DateVariant is (DMY, DY);

    type Date(variant : DateVariant := DMY) is -- DMY is default
        record
            y : Year; -- common to all variants
            case variant is
                when DMY => -- variant one
                    md : MDay_Number;
                    m : Month;
                when DY => -- variant two
                    yd : YDay_Number;
            end case;
        end record;
    
    -- how to display a date to the terminal:
    procedure Put_Date(d : Date) is
    begin
        case d.variant is
            when DMY =>
                Put(d.md,0);
                Put("/");
                Put(d.m);
                Put("/");
                Put(d.y,0);
            when DY =>
                Put(d.yd,0);
                Put("//");
                Put(d.y,0);
        end case;
    end Put_Date;
    
    someday1 : Date;
    someday2 : Date;
begin
    -- construction of a record value:
    someday1 := ( variant => DMY, m => JAN, md => 1, y => 1901 );
    someday2 := ( variant => DY, yd => 111, y => 1901 );
    Put_Date(someday1);
    Put_Line("");
    
    -- modify a component
    someday1.md := someday1.md + 1;
    Put_Date(someday1);
    Put_Line("");
        
    someday2.md := someday2.md + 1; -- will raise run-time error
    
end UnionTest;