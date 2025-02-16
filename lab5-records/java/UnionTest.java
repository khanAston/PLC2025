public class UnionTest
{

    enum Month {JAN, FEB, MAR, APR, MAY, JUN, 
                JUL, AUG, SEP, OCT, NOV, DEC};

    public static abstract class Date
    {
        public int year;
        // not enough data -- therefore abstract
        
        public Date(int y) { year = y; }
    }
    
    public static class DateDMY extends Date
    {
        public int mday;
        public Month month;
        
        public DateDMY(int d, Month m, int y) 
        {
            super(y);
            mday = d;
            month = m;
        }
        
        public String toString()
        {
            return "" + mday + "/" + month + "/" + year;
        }
    }
    
    public static class DateDY extends Date
    {
        public int yday;
        
        public DateDY(int d, int y) 
        {
            super(y);
            yday = d;
        }
        
        public String toString()
        {
            return "" + yday + "//" + year;
        }
    }
    
    
    
    public static void main(String[] args)
    {
        Date someday;
    
        someday = new DateDMY(1,Month.JAN,1901);
        System.out.println(someday);
        
        someday = new DateDY(111,1901);
        System.out.println(someday);
        
        if ( someday instanceof DateDMY )
        {
            System.out.println("someday is a DMY");
        }
        else if ( someday instanceof DateDY )
        {
            System.out.println("someday is a DY");
        }
        else
        {
            System.out.println("someday is neither DY nor DMY");
        }
        
    }    
}