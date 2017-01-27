/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pt.fjrcorreia.redcross;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Francisco Correia {@literal <fjrcorreia@github.com>}
 */
public class SampleUtilTest {
    
    public SampleUtilTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of sum method, of class SampleUtil.
     */
    @Test
    public void testSum() {
        System.out.println("sum");
        int a = 4;
        int b = 5;
        int expResult = 9;
        int result = SampleUtil.sum(a, b);
        assertEquals(expResult, result);
    }
    
}
