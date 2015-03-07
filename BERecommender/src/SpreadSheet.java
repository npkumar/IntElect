import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.swing.JTable;
import javax.swing.table.TableModel;

/*
 * 
 * Tabbed output from JTable to be openned
 * with a spreadsheet application.
 * 
 * */

public class SpreadSheet {

	public void toExcel(JTable table, File file){
		try{
	        TableModel model = table.getModel();
	        PrintWriter excel = new PrintWriter(file);

	        // Column names
	        for(int i = 0; i < model.getColumnCount(); i++){
	            excel.write(model.getColumnName(i) + "\t");
	        }

	        excel.write("\n");

	        // Data sheet
	        for(int i=0; i< model.getRowCount(); i++) {
	            for(int j=0; j < model.getColumnCount(); j++) {
	                excel.write(model.getValueAt(i,j).toString()+"\t");
	            }
	            excel.write("\n");
	        }

	        excel.close();

	    }catch(IOException e){
	    	System.out.println(e); 
	    }
	}
}
