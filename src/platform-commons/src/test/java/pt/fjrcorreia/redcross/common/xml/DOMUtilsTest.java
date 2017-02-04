/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pt.fjrcorreia.redcross.common.xml;

import java.io.File;
import java.io.OutputStream;
import java.net.URL;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Ignore;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class DOMUtilsTest {

    public static final String XML_TEST_FILE = "xml/sample.xml";

    public DOMUtilsTest() {
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
     * Test of loadDocument method, of class DOMUtils.
     */
    @Test
    public void testLoadDocument_String() {
        Document doc = DOMUtils.loadDocument(XML_TEST_FILE);
        assertNotNull(doc);
    }

    /**
     * Test of loadDocument method, of class DOMUtils.
     */
    @Ignore
    @Test
    public void testLoadDocument_File() {
        File file = new File(XML_TEST_FILE);
        assertNotNull(file);
        assertTrue(file.exists());
        
        
        

    }

    /**
     * Test of locateFile method, of class DOMUtils.
     */
    @Test
    public void testLocateFile() {
        File file = DOMUtils.locateFile(XML_TEST_FILE, this.getClass());
        assertNotNull(file);
        assertTrue(file.exists());
        
    }


}
