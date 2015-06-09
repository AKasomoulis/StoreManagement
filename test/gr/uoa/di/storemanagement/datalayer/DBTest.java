package gr.uoa.di.storemanagement.datalayer;

import java.io.FileOutputStream;
import java.io.IOException;
 
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
 
/**
 * First iText example: Hello World.
 */
public class DBTest {
 
    /** Path to the resulting PDF file. */
    public static final String RESULT
        = "/home/vasilis/Desktop/Getting Started.pdf";
 
    /**
     * Creates a PDF file: hello.pdf
     * @param    args    no arguments needed
     */
    public static void main(String[] args)
    	throws DocumentException, IOException {
    	new DBTest().createPdf(RESULT);
    }
 
    /**
     * Creates a PDF document.
     * @param filename the path to the new PDF document
     * @throws    DocumentException 
     * @throws    IOException 
     */
    public void createPdf(String filename)
	throws DocumentException, IOException {
        // step 1
        Document document = new Document();
        // step 2
        PdfWriter.getInstance(document, new FileOutputStream(filename));
        // step 3
        document.open();

        
        
        String txt = 
"                Oak Castle Gallery Pty. Ltd.\n"+
"                     ABN 99 999 999 999\n"+
"                 Telephone (08) 8357 7122\n"+
"               P.O. Box 517, Glenside SA 5065\n"+
"                Email info@oakcastle.com.au\n"+
"                    Web oakcastle.com.au\n"+
"												\n"+
"                      \n"+
"DATE: " + +  " \n"+
"------------------------------------------------------------\n"+
"To:\n"+
"[SENSS]\n"+
"Sensational Silver Pty Ltd\n"+
"P.O. Box 517\n"+
"GLENSIDE  SA  5065\n"+
"				\n"+
"Date:               19/04/2004 (Monday)\n"+
"Order Number:       E1243\n"+
"A.B.N.:             73 054 928 693\n"+
"Payment Terms:      14 days\n"+
"Payment Due:        03/05/2004 (Monday)\n"+
"					\n"+		
"------------------------------------------------------------\n"+
"			\n"+	
"BADGE - MAN ON HORSE\n"+
"  10 @ $4.29                                          $42.90*\n"+
"				\n"+
"TWO COLOUR WEST/ SHIRT\n"+
"  20 @ $98.94                                      $1,978.90*\n"+
"			\n"+
"SMITHS CHICKEN  200G\n"+
"  4 @ $3.79                                           $15.18*\n"+
"			\n"+
"PADDED RUGBY\n"+
"  1 @ $120.94                                        $120.95*\n"+
"				\n"+
"FARMERS UNION ICED COFFEE 600ML\n"+
"  10 @ $2.20                                          $22.00*\n"+
"  Your Code: ICE0123A\n"+
"     \n"+
"2 LT FARM/UNION ICED COFFEE\n"+
"  3 @ $4.95                                           $14.85*\n"+
"    \n"+
"------------------------------------------------------------\n"+
"TOTAL AMOUNT:                                      $2,194.78\n"+
"       \n"+
"Total includes GST of: $199.53\n"+
"   * indicates taxable supply \n";
        
        // step 4
        document.add(new Paragraph(txt));
        // step 5
        document.close();
    }
}



