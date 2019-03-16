public class BinaryGapLength 
{
    public static void main( String[] args )
    {
        int myint = 9;
        String mybyte = Integer.toBinaryString(myint);
        System.out.println("Binary: " + mybyte);
        int highestbinarygaplength = 0;
        int totalbinarygap = 0;        
        boolean binarystartcount = false;
        for (int i = (mybyte.length()-1); i >= 0; i--) {            
            switch (String.valueOf(mybyte.charAt(i))) {
                case "0":
                    if (binarystartcount) {
                        totalbinarygap = totalbinarygap + 1;                        
                    }                    
                    break;
                case "1":               
                    if (totalbinarygap == 0) {
                        binarystartcount = true;
                    } else {
                        if (totalbinarygap > highestbinarygaplength) {
                            highestbinarygaplength = totalbinarygap;
                        }
                        totalbinarygap = 0;
                    }
                    break;
                default:
                    break;
            }
        }
        System.out.println("Highest Binary Gap Length: " +highestbinarygaplength);        
    }
}