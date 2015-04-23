/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srcr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import se.sics.jasper.Query;
import se.sics.jasper.SICStus;
import se.sics.jasper.SPException;

public class SRCR {

    protected static SICStus sp;

    public SRCR(String pathToFile) {
        try {
            loadSICStus();
            loadSICStusScrpt(pathToFile);
        } catch (SPException ex) {
            Logger.getLogger(SRCR.class.getName()).log(Level.SEVERE, null, ex);
            System.exit(1);
        }
    }

    

    public Boolean check(String queryS) {
        try {
            HashMap map = new HashMap();
            return sp.query(queryS, map);
        } catch (SPException ex) {
            //Logger.getLogger(Prolog.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    
    
     public String getString(String queryS) throws SPException, InterruptedException, Exception{
       
        StringBuilder results = new StringBuilder();
      
            //String queryS = “predicate(‘term’,X).”;
            
            HashMap map = new HashMap();
            Query query = sp.openPrologQuery(queryS,map);
            while (query.nextSolution()) {
                //System.out.println(map.toString());
                
                results.append(map.toString());
            } 
            query.close();
       
        return results.toString();
    }

    public List<String> getStringResults(String queryS) throws InterruptedException, Exception {
      
        ArrayList<String> results = new ArrayList<>();
        HashMap map = new HashMap();
        Query query = null;
        
        
        //System.out.println("chegou  aqui "+ queryS);
        
        
        try {
            
            query = sp.openPrologQuery(queryS, map);
        } catch (SPException ex) {
            Logger.getLogger(SRCR.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            while (query.nextSolution()) {
                //System.out.println("resl " +map.toString());
                
                results.add(map.toString());
            }
        } catch (Exception ex) {
            Logger.getLogger(SRCR.class.getName()).log(Level.SEVERE, null, ex);
        }
        query.close();

        return results;
    }
    private static void loadSICStus() throws SPException {
        sp = new SICStus();
    }

    public static void loadSICStusScrpt(String path) throws SPException {
        sp.load(path);

    }
/*
    public static void main(String[] args) throws SPException, InterruptedException, Exception {
        //loadSICStus();
        //loadSICStusScrpt("/Users/brunopereira/Documents/SourceTree/SRCR/Tp2/TP2.pl");

       SICStus sp;
      String server; 
   
      sp = new SICStus(args,null);
      
      
      sp.load("/Users/brunopereira/Documents/SourceTree/SRCR/Tp2/TP2.pl");

      String queryS = null;
      HashMap map = new HashMap();
      Query query = null;
      int vez=0;
        if(vez==0){
            map = new HashMap();
            query = sp.openPrologQuery("listening.",map);
                while (query.nextSolution()) {
                    System.out.println(map.toString());
                }
                
            vez++;
            }
            
        
    }
*/
    }
