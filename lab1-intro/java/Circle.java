class Circle {

  public static void main(String[] args) {
    int size = 15; // Integer.parseInt(args[0]);
    Circle c = new Circle(size);
    for (int i = 1; i <= size; i++ ) {
      System.out.println(c.circleLine(i));
    }
  }

  public Circle(int size) {
    this.size = size;
  }

  private int size;

  private String circleLine(int i){
    StringBuilder result = new StringBuilder(size);
    for (int jj = 1; jj <= 2*size; jj++) {
      if (shouldPaint(i,jj))
        { result.append('*'); }
      else
        { result.append(' '); }
    }
    return result.toString();
  }

  private Boolean shouldPaint(int i, int jj){
    int j = jj/2;
    return shouldPaintS(size,i,j);
  }

  private Boolean shouldPaintS(int s, int i, int j){
    return Math.abs (sqr(i) + sqr(j) - sqr(s)) <= s+1;
  }

  private static double sqr(double b){
    // System.out.println("dbl called"); // BAD!
    return Math.pow(b,2);
  }

  // public void printS(String[] args) {
  //   if(shouldPaintS(10, 10, 10)){
  //     System.out.println("Painting");
  //   }
  // }
  //test comment
  //edit by student
}
