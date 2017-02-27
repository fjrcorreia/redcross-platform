/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pt.fjrcorreia.redcross.common.xml;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author Francisco Correia <francisco-j-correia@telecom.pt>
 */
public class DOMUtils {

    private static final Logger log = LoggerFactory.getLogger(DOMUtils.class);

    //
    private static final String JAVA_CLASS_PATH = "java.class.path";
    private static final String JAVA_LIBRARY_PATH = "java.library.path";

    public static Document loadDocument(String docFileName) {
        File docFile = locateFile(docFileName, null);

        if (docFile == null) {
            log.error("Could not find file: {}", docFileName);
            return null;
        }

        return loadDocument(docFile);
    }

    public static Document loadDocument(File docFile) {

        InputStream docStream;
        try {
            docStream = new FileInputStream(docFile);
        } catch (FileNotFoundException ex) {
            log.error("Could not open Stream for file ({}): {}", docFile.getName(), ex.getMessage());
            return null;
        }

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;

        try {
            builder = factory.newDocumentBuilder();
        } catch (ParserConfigurationException ex) {
            log.error("Could create a document Builder: " + ex.getMessage());
            return null;
        }

        Document doc = null;
        try {
            doc = builder.parse(docStream);
        } catch (SAXException | IOException ex) {
            log.error("Error Reading data : {}", ex.getMessage());
            return null;
        }

        return doc;
    }

    public static File locateFile(String fileName, Class baseClass) {
        File targetFile = new File(fileName);

        if (targetFile.exists()) {
            return targetFile;
        }

        URL targetResource;

        if (baseClass != null) {
            targetResource = baseClass.getClassLoader().getResource(fileName);

            if (targetResource == null) {
                targetResource = baseClass.getClass().getClassLoader().getSystemResource(fileName);
            }

        } else {
            targetResource = DOMUtils.class.getResource(fileName);

            if (targetResource == null) {
                targetResource = ClassLoader.getSystemResource(fileName);
            }
        }

        System.out.println("looking....");
        if (targetResource != null) {
            targetFile = new File(targetResource.getFile());
            if (targetFile.exists()) {
                System.out.println("Found resource");
                return targetFile;
            }

            System.out.println("URL not a file? (" + targetResource + ")");
        }

        String javaClassPath = System.getProperty(JAVA_CLASS_PATH);

        String[] classPaths = javaClassPath.split(File.pathSeparator);

        for (String path : classPaths) {
            File dirPath = new File(path);

            if (dirPath.exists() && dirPath.isDirectory()) {
                System.out.println("looking@" + dirPath.getAbsolutePath());
                File sysFile = new File(dirPath, fileName);
                if (sysFile.exists()) {
                    System.out.println("Found(" + dirPath.getAbsolutePath() + ")!");
                    return sysFile;
                }
            }

        }

        String javaLibraryPath = System.getProperty(JAVA_LIBRARY_PATH);

        String[] libraryPaths = javaLibraryPath.split(File.pathSeparator);

        for (String path : libraryPaths) {
            File dirPath = new File(path);

            if (dirPath.exists() && dirPath.isDirectory()) {
                System.out.println("looking@" + dirPath.getAbsolutePath());
                File sysFile = new File(dirPath, fileName);
                if (sysFile.exists()) {
                    System.out.println("Found(" + dirPath.getAbsolutePath() + ")!");
                    return sysFile;
                }
            }

        }

        return null;
    }

    public static int deleteLevel1NodeName(Document document, String nodeName) {
        Node rootNode = document.getChildNodes().item(0);
        int countDeleted = 0;

        NodeList l1NodeList = rootNode.getChildNodes();

        for (int i = 0; i < l1NodeList.getLength(); ++i) {
            Node node = l1NodeList.item(i);

            if (node.getNodeName().compareTo(nodeName) == 0) {
                rootNode.removeChild(node);
                ++countDeleted;
                break;
            }
        }

        return countDeleted;
    }

    public static Node findLevel1NodeName(Node baseNode, String nodeName) {

        Node targetNode = null;

        NodeList l1NodeList = baseNode.getChildNodes();

        for (int i = 0; i < l1NodeList.getLength(); ++i) {
            Node node = l1NodeList.item(i);

            if (node.getNodeName().compareTo(nodeName) == 0) {
                targetNode = node;
                return targetNode;
            }
        }

        return targetNode;
    }

    public static Node findLevel1NodeValue(Node baseNode, String nodeValue) {

        Node targetNode = null;

        NodeList l1NodeList = baseNode.getChildNodes();

        for (int i = 0; i < l1NodeList.getLength(); ++i) {
            Node node = l1NodeList.item(i);

            if (Node.ELEMENT_NODE != node.getNodeType()) {
                continue;
            }

            if (nodeValue.compareTo(node.getTextContent()) == 0) {
                targetNode = node;
                return targetNode;
            }
        }

        return targetNode;
    }

    public static void outputDocument(Document doc, OutputStream docOut) throws TransformerException {

        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer trans;

        trans = tf.newTransformer();
        trans.transform(new DOMSource(doc), new StreamResult(docOut));

    }

    public static Element getParameterElement(Document doc, String paramName) {

        Element root = doc.getDocumentElement();

        Node parameters = findLevel1NodeName(root, "parameters");

        if (parameters == null) {
            //not yet implemented
            return null;
        }

        NodeList parametersList = parameters.getChildNodes();
        for (int i = 0; i < parametersList.getLength(); ++i) {
            Node paramNode = parametersList.item(i);
            if (Node.ELEMENT_NODE != paramNode.getNodeType()) {
                continue;
            }

            if (findLevel1NodeValue(paramNode, paramName) != null) {
                return (Element) paramNode;
            }
        }

        return null;
    }
}
