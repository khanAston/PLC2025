with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;

procedure RecordTest is

    type Month is 
        (JAN, FEB, MAR, APR, MAY, JUN, 
         JUL, AUG, SEP, OCT, NOV, DEC); -- Ada enumerated type
         
    -- define printing and parsing of Month values
    package Month_IO is
        new Ada.Text_IO.Enumeration_IO(Month);
    use Month_IO;         
         
    type Day_Number is new Integer range 1 .. 31;
    
    -- define printing and parsing of Day_Number
    package Day_Number_IO is
        new Ada.Text_IO.Integer_IO(Day_Number);
    use Day_Number_IO;

    type Year is range -9999 .. 9999;
    
    -- define printing and parsing of Year
    package Year_IO is
        new Ada.Text_IO.Integer_IO(Year);
    use Year_IO;

    type Date is
        record -- list components that each value will have
            d : Day_Number;
            m : Month;
            y : Year;
        end record;
    
    -- display a date to the terminal
    procedure Put_Date(d : Date) is
    begin
        Put(d.d,0); -- access a component
        Put("/");
        Put(d.m);
        Put("/");
        Put(d.y,0);
    end Put_Date;
    
    someday : Date;
begin
    -- construction of a record value:
    someday := ( 1, JAN, 1901 );
--     someday := ( m => JAN, d => 1, y => 1901 );
    Put_Date(someday);
    Put_Line("");
    
    -- modify a component
    someday.d := someday.d + 1;
    Put_Date(someday);
    Put_Line("");
end RecordTest;