/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package back;

import java.time.LocalDate;

/**
 *
 * @author hemay
 */
public class Test {
    
    public static void main(String[] argc){
        String s="A";
        int i=2;
        s="A"+i;
        System.out.println("S: "+s);
        
        LocalDate t = LocalDate.now();
        
        System.out.println(t.toString());
    }
    
}
