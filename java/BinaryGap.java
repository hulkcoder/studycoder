public class BinaryGap 
{
    public static void main( String[] args )
    {
        int myint = 9654;
        String mybyte = Integer.toBinaryString(myint);
        System.out.println("Binary: " + mybyte);
        int totalbinarygap = 0;        
        boolean binarystartcount = false;
        for (int i = (mybyte.length()-1); i >= 0; i--) {            
            switch (String.valueOf(mybyte.charAt(i))) {
                case "0":
                    if (binarystartcount) {
                        totalbinarygap = totalbinarygap + 1;
                        binarystartcount = false;
                    }                    
                    break;
                case "1":                    
                    binarystartcount = true;
                    break;
                default:
                    break;
            }
        }
        System.out.println("Binary Gap: " +totalbinarygap);        
    }
}