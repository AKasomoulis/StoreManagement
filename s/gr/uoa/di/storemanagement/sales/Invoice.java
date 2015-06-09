package gr.uoa.di.storemanagement.sales;

import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class Invoice {
	
	private static final String pdfPath = "/home/vasilis/Desktop/invoice.pdf";
	private Document document;
	
	public Invoice() {
		
	}

	 public void createPdf(String info) {
		 
		 document = new Document();
		 try {
			PdfWriter.getInstance(document, new FileOutputStream(pdfPath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	     
		document.open();
	     
	    try {
			document.add(new Paragraph(info));
		} catch (DocumentException e) {
			e.printStackTrace();
		}

	    document.close();
		 
	 }
	 
	 public void openPdf() {
//		 try {
//			Runtime.getRuntime().exec("cmd" + " " + pdfPath);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		 
//		 Desktop desktop = Desktop.getDesktop();
//		 File file = new File(pdfPath);
//		 try {
//			desktop.open(file);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		 
//		 try {
//			Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + pdfPath);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
	 }
}
