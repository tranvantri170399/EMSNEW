	package com.example.demo.controller;

import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.example.demo.entities.ExamResult;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class ExportFile {
	private List<ExamResult> listExamResult;

	public ExportFile(List<ExamResult> listExamResult) {
		this.listExamResult = listExamResult;
	}
	
	private void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.BLUE);
		cell.setPadding(5);
		 
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);
        
        
        cell.setPhrase(new Phrase("Tên Học Sinh", font));
        table.addCell(cell);
        
        cell.setPhrase(new Phrase("Bài Kiểm Tra", font));
        table.addCell(cell);
//         
        cell.setPhrase(new Phrase("Học Kỳ", font));
        table.addCell(cell);
//         
        cell.setPhrase(new Phrase("Môn", font));
        table.addCell(cell);
//         
        cell.setPhrase(new Phrase("Mã Môn", font));
        table.addCell(cell);   
        
      cell.setPhrase(new Phrase("Điểm", font));
      table.addCell(cell);  
           
	}
	
	 private void writeTableData(PdfPTable table) {
	        for (ExamResult examResult : listExamResult) {
	        	 table.addCell(String.valueOf(examResult.getStudent().getLname()));
	            table.addCell(String.valueOf(examResult.getExam().getName()));
	            table.addCell(String.valueOf(examResult.getExam().getCourse().getSemester().getName()));
	            table.addCell(String.valueOf(examResult.getExam().getCourse().getName()));
	            table.addCell(String.valueOf(examResult.getExam().getId()));
	            table.addCell(String.valueOf(examResult.getMark()));
	        }
	    }
	 
	 public void export(HttpServletResponse response) throws DocumentException, IOException {
	        Document document = new Document(PageSize.A4);
	        PdfWriter.getInstance(document, response.getOutputStream());
	         
	        document.open();
	        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN);
	        font.setSize(18);
	        font.setColor(Color.BLUE);
	         
	        Paragraph p = new Paragraph("Bang điểm sinh viên theo kỳ", font);
	        p.setAlignment(Paragraph.ALIGN_CENTER);
	        p.setFont(font);
	         
	        document.add(p);
	         
	        PdfPTable table = new PdfPTable(6);
	        
	        table.setWidthPercentage(100f);
	        table.setWidths(new float[] {1.5f, 3.5f, 3.0f, 3.0f, 1.5f,1.5f});
	        table.setSpacingBefore(10);
	         
	        writeTableHeader(table);
	        writeTableData(table);
	         
	        document.add(table);
	         
	        document.close();
	         
	    }
}
