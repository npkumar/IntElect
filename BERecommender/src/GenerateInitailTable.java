import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.io.File;
import java.util.ArrayList;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.JTableHeader;

/*
 * 
 * Initail minimilistic output.
 * 
 * */

class GenerateInitialTable extends JFrame {

	private	JPanel		topPanel;
	private	JTable		table;
	private	JScrollPane scrollPane;

	private JMenuBar menubar;
	private JMenu file;
	private JMenuItem export;
	private JMenuItem expand;
	private JMenuItem keys;
	
	
	public GenerateInitialTable(final ArrayList<Elective> electives){
		
		
		setTitle( "Basic Elective Recommendations" );
		setSize( 1200, 300 );
		setBackground( Color.gray );

		
		topPanel = new JPanel();
		topPanel.setLayout( new BorderLayout() );
		getContentPane().add( topPanel );

		// Create columns names
		String columnNames[] = { "ELECTIVE","FULLTIME","PARTTIME","FAVOUR" };

		// Create multidata array
		String[][] dataValues = new String[electives.size()][4];
		
		ArrayList<String> values = new ArrayList<String>();
		
		String[] valuesArray = new String[electives.size() * 4];
		
		// Store all data.
		for (Elective e: electives){
			values.add(e.getName());
			values.add(e.getSetf());
			values.add(e.getSetp());
			values.add(e.getCf());
		}
		
		values.toArray(valuesArray);
		
		for (int i=0; i<electives.size(); i++){
			for (int j=0; j<4; j++){
				dataValues[i][j] = valuesArray[j + i*4];
			}
		}
		
		//Render cells. Optional
		BETableCellRenderer renderer = new BETableCellRenderer();
		
		// Create a new table instance
		table = new JTable( dataValues, columnNames );
		table.setDefaultRenderer(Object.class, renderer);
		
		table.getColumnModel().getColumn(1).setPreferredWidth(160);
		
		//table.getColumnModel().setColumnMargin(10);
		
		table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
		
		table.setBackground(Color.WHITE);
		// Add the table to a scrolling pane
		scrollPane = new JScrollPane( table );
		topPanel.add( scrollPane, BorderLayout.CENTER );
		
		//Header bold 
		JTableHeader header = table.getTableHeader();
		header.setFont(new Font("Serif", Font.BOLD, 15));
		
		
		/*=====================================*/
	      /* Create the menus and menu items   */
	      /*=====================================*/
	      menubar = new JMenuBar();
	      file = new JMenu("File");
	      file.setMnemonic(KeyEvent.VK_F);
	      
	      export = new JMenuItem("Export");
	      export.setMnemonic(KeyEvent.VK_E);
	      export.setToolTipText("Export for spreedsheet application");
	      export.addActionListener(new ActionListener() {
	          public void actionPerformed(ActionEvent event) {
	        	  JFileChooser jfc = new JFileChooser();
	        	  jfc.setDialogTitle("Specify a file to save.");
	        	  int userSelection = jfc.showSaveDialog(GenerateInitialTable.this);
	        	  
	        	  if (userSelection == JFileChooser.APPROVE_OPTION){
	        		  File fileToSave = jfc.getSelectedFile();
	        		  System.out.println("Saving to " + fileToSave);
	        		  new SpreadSheet().toExcel(table, fileToSave);
	        	  }
	          }

	      });
	      file.add(export);
	      
	      expand = new JMenuItem("Expand");
	      expand.setMnemonic(KeyEvent.VK_X);
	      expand.setToolTipText("Get more details regarding the electives.");
	      expand.addActionListener(new ActionListener(){

			public void actionPerformed(ActionEvent event) {
				new GenerateTable(electives);
			}
	    	  
	      });
	      
	      file.add(expand);
	      
	      keys = new JMenuItem("Keys");
	      keys.setMnemonic(KeyEvent.VK_X);
	      keys.setToolTipText("See all subject info and codes.");
	      keys.addActionListener(new ActionListener(){

			public void actionPerformed(ActionEvent event) {
				new DisplayKeys();
			}
	    	  
	      });
	      
	      file.add(keys);
	      
	      
	      
	      menubar.add(file);
	      setJMenuBar(menubar);
		
		setLocationRelativeTo(null);
		
		setVisible(true);
		setResizable(false);
	}
	


	private class BETableCellRenderer extends DefaultTableCellRenderer{
		public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column){
			Component c = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column); 

			if (! table.isRowSelected(row))
			{
			    if( row % 2 == 0)
			        c.setBackground(Color.LIGHT_GRAY);
			    else
			        c.setBackground(table.getBackground());
			    if (column == 0 || column == 3){
			    	c.setBackground(new Color(208, 242, 240));
			        c.setFont(new Font("Serif", Font.BOLD, 15));
			    }
			}
			return c; 
		} 
	}
	
	
 }
	