with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;


procedure Drinks is

    type DrinkCategoryVariant is
        (Water, Milk, Juice); -- Ada enumerated type

    type DrinkCategory(variant : DrinkCategoryVariant) is
        record
            case variant is
                when Water => null;
                when Milk =>
                    fatContent : Float;
                when Juice =>
                    fruit : String(1..10);
            end case;
        end record;

    drink1 : DrinkCategory := (variant => Water);
    drink2 : DrinkCategory := (variant => Milk, fatContent => 3.0);
    drink3 : DrinkCategory := (variant => Milk, fatContent => 1.0);
    drink4 : DrinkCategory := (variant => Juice, fruit => "orange    ");

    function DrinkColour(drink: DrinkCategory) return String is begin
        case drink.variant is
            when Water => return "clear";
            when Milk => return "white";
            when Juice =>
                if    drink.fruit = "orange    " then return "orange";
                elsif drink.fruit = "lemon     " then return "yellow";
                else  return "unknown";
                end if;
        end case;
    end DrinkColour;

begin
    null;
end Drinks;
