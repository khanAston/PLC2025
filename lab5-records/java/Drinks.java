public class Drinks {

  // A Java union type
  public static abstract class DrinkCategory{
    public abstract String drinkColour();
  }

  public static class Water extends DrinkCategory {
    public String drinkColour(){ return "clear"; }
  }

  public static class Milk extends DrinkCategory {
    public double fatContent;
    public Milk(double fatContent){ this.fatContent = fatContent; }
    public String drinkColour(){ return "white"; }
  }
  public static class Juice extends DrinkCategory {
    public String fruit;
    public Juice(String fruit){ this.fruit = fruit; }
    public String drinkColour(){ 
      switch(fruit){
        case "orange": return "orange";
        case "lemon": return "yellow";
        default: return "unknown";
      }
    }
  }

  public DrinkCategory drink1 = new Water();
  public DrinkCategory drink2 = new Milk(3);
  public DrinkCategory drink3 = new Milk(1);
  public DrinkCategory drink4 = new Juice("orange");
}