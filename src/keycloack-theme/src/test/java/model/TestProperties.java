/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class TestProperties extends HashMap<String, Object> {

  

    
    
    
    public TestProperties update(String key, Map<String, Object> map){
        Object value = super.get(key);
        if (value != null && value instanceof Map){
            Map m = (Map)value;
            m.putAll(map);
        }else{
            value = map;
        }
        
        super.put(key, value);
        return this;
    }
    
     public TestProperties update(String key, Properties values){
         Object value = super.get(key);
         Map<String, Object> map = null;
         if (value == null){
             map = new HashMap<String, Object>();
         }else if (value instanceof Map){
             map = (Map) value;
         }else {
             System.out.println("update failed for ["+key+"]: no compatible!");
         }
         
         
         for (Object keyVal : values.keySet()){
             map.put((String)keyVal, values.get(keyVal));
         }
         super.put(key, map);
         return this;
     }
    
}
