import java.lang.reflect.*;

public class Reflection
{
    public static void main( String[] args )
    {
        try {
            Class c = Class.forName("java.lang.String");
            Class i[] =  c.getInterfaces();
            for (int j = 0; j < i.length; j++) {
                System.out.println(i[j].toString());
            }            
            Method m[] = c.getDeclaredMethods();
            for (int k = 0; k < m.length; k++) {
                System.out.println(m[k].toString());
                System.out.println("decl class = " +
                              m[k].getDeclaringClass());
                Class pvec[] = m[k].getParameterTypes();
                for (int j = 0; j < pvec.length; j++)
                System.out.println("param #" + j + " " + pvec[j]);
                Class evec[] = m[k].getExceptionTypes();
                for (int j = 0; j < evec.length; j++) {
                    System.out.println("exc #" + j + " " + evec[j]);
                }                
                System.out.println("return type = " + m[k].getReturnType());
                System.out.println("-----");                            
            }            
            /* Check whether the object is the class.
            boolean b1 = c.isInstance(new String("a"));
            System.out.println(b1);*/
            Constructor  ct[] =  c.getDeclaredConstructors();
            for (int n = 0; n < ct.length; n++) 
            {
                System.out.println("name  = " + ct[n].getName());
                System.out.println("decl class = " + ct[n].getDeclaringClass());
                Class pvec[] = ct[n].getParameterTypes();
                for (int j = 0; j < pvec.length; j++) 
                {
                    System.out.println("param #" + j + " " + pvec[j]);
                }
                Class evec[] = ct[n].getExceptionTypes();
                for (int j = 0; j < evec.length; j++) 
                {
                    System.out.println("exc #" + j + " " + evec[j]);                
                    System.out.println("-----");
                }
            } 
        } catch (Throwable e) {
            System.err.println(e);
        }
    }
}