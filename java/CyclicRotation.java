import java.util.*; 

public class CyclicRotation
{
    public static void main( String[] args )
    {
        LinkedList<Integer> object = new LinkedList<Integer>(); 
        int[] A = {3, 8, 9, 7, 6};        
        int K = 9;
        for (int a : A) {
            object.add(a);
        }
        for (int i=0; i<K; i++) {
            object.addFirst(object.getLast());
            object.removeLast();
        }
        for (int b : object) {
            System.out.println(b);
        }
        // Back to int array
        int[] B = new int[object.size()];
        int i = 0;
        for (int b : object) {
            B[i] = b;
            i = i + 1;
        }
    }
}