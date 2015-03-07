import javax.swing.*; 

import java.awt.*; 
import java.awt.event.*; 

import java.text.BreakIterator;

import java.util.ArrayList;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.MissingResourceException;
 
import CLIPSJNI.*;



class BERecommender implements ActionListener
  {  
   JLabel displayLabel;
   JButton nextButton;
   JButton prevButton;
   JPanel choicesPanel;
   ButtonGroup choicesButtons;
   ResourceBundle autoResources;
 
   JMenuBar menubar;
   ImageIcon icon;
   JMenu file;
   JMenu help;
   JMenuItem exitMenuItem;
   JMenuItem aboutMenuItem;
   JMenuItem creditsMenuItem;
   
   Environment clips;
   boolean isExecuting = false;
   Thread executionThread;
      
   BERecommender()
     {  
      try
        {
         autoResources = ResourceBundle.getBundle("resources.AutoResources",Locale.getDefault());
        }
      catch (MissingResourceException mre)
        {
         mre.printStackTrace();
         return;
        }
      
      
      
      JFrame frame = new JFrame(autoResources.getString("Title"));  
      frame.getContentPane().setLayout(new GridLayout(3,1));  
      frame.setSize(510,380); //350x200     
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);  
      frame.setResizable(false);
      
      /*===========================*/
      /* Create the display panel. */
      /*===========================*/
      
      JPanel displayPanel = new JPanel(); 
      displayLabel = new JLabel();
      displayPanel.add(displayLabel);
      
      /*===========================*/
      /* Create the choices panel. */
      /*===========================*/
     
      choicesPanel = new JPanel(); 
      //choicesPanel.setLayout(new BoxLayout(frame.getContentPane(),BoxLayout.Y_AXIS));
      
      choicesButtons = new ButtonGroup();
      
      /*===========================*/
      /* Create the buttons panel. */
      /*===========================*/

      JPanel buttonPanel = new JPanel(); 
      
      prevButton = new JButton(autoResources.getString("Prev"));
      prevButton.setActionCommand("Prev");
      buttonPanel.add(prevButton);
      prevButton.addActionListener(this);
      
      nextButton = new JButton(autoResources.getString("Next"));
      nextButton.setActionCommand("Next");
      buttonPanel.add(nextButton);
      nextButton.addActionListener(this);
     
      /*=====================================*/
      /* Add the panels to the content pane. */
      /*=====================================*/
      
      frame.getContentPane().add(displayPanel); 
      frame.getContentPane().add(choicesPanel); 
      frame.getContentPane().add(buttonPanel); 

      /*=====================================*/
      /* Create the menubar and menu items   */
      /*=====================================*/
      menubar = new JMenuBar();
      //icon = new ImageIcon(getClass().getResource("exit.png"));
      
      //File Menu
      file = new JMenu("File");
      file.setMnemonic(KeyEvent.VK_F);
      
      exitMenuItem = new JMenuItem("Exit", icon);
      exitMenuItem.setMnemonic(KeyEvent.VK_C);
      exitMenuItem.setToolTipText("Exit application");
      exitMenuItem.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent event) {
        	  System.exit(0);
          }

      });
      file.add(exitMenuItem);
      
      //Help Menu
      help = new JMenu("Help");
      help.setMnemonic(KeyEvent.VK_H);
      
      aboutMenuItem = new JMenuItem("About");
      aboutMenuItem.setToolTipText("About this application");
      aboutMenuItem.addActionListener(new ActionListener(){

		public void actionPerformed(ActionEvent event) {
			JOptionPane.showMessageDialog(null, "NUS ISS Basic Electives Recommendation System.", "About", 1);;
		}
    	  
      });
      

      creditsMenuItem = new JMenuItem("Credits");
      creditsMenuItem.setToolTipText("People involved in this project.");
      creditsMenuItem.addActionListener(new ActionListener(){

		public void actionPerformed(ActionEvent event) {
			String line = System.getProperty("line.separator");
			String names= "ABI" + line + "DC" + line + "KK"
					 + line +  "NPK" + line + "Mail us at:  intelect-ke25[at]gmail[dot]com";
			JOptionPane.showMessageDialog(null, names, "Credits", 1);
		}
    	  
      });

      help.add(aboutMenuItem);
      help.add(creditsMenuItem);
      
      menubar.add(file);
      menubar.add(help);
      
      
      /*========================*/
      /* Load the electives program. */
      /*========================*/
      
      clips = new Environment();
      
      clips.load("basic_electives.clp");
      
      clips.reset();
      runAuto();

      /*====================*/
      /* Display the frame. */
      /*====================*/
      frame.setJMenuBar(menubar);
      frame.setLocationRelativeTo(null);
      frame.setVisible(true);  
     }  

   /****************/
   /* nextUIState: */
   /****************/  
   private void nextUIState() throws Exception
     {
      /*=====================*/
      /* Get the state-list. */
      /*=====================*/
      
      String evalStr = "(find-all-facts ((?f state-list)) TRUE)";
      
      String currentID = clips.eval(evalStr).get(0).getFactSlot("current").toString();

      /*===========================*/
      /* Get the current UI state. */
      /*===========================*/
      
      evalStr = "(find-all-facts ((?f UI-state)) (eq ?f:id " + currentID + "))";
      
      PrimitiveValue fv = clips.eval(evalStr).get(0);
      
      /*========================================*/
      /* Determine the Next/Prev button states. */
      /*========================================*/
      
      if (fv.getFactSlot("state").toString().equals("final"))
        { 
         nextButton.setActionCommand("Final");
         nextButton.setText("Show My Recommendations");
         prevButton.setText("Try Again");
         prevButton.setActionCommand("Restart");
         prevButton.setVisible(true);
        }
      else if (fv.getFactSlot("state").toString().equals("initial"))
        {
         nextButton.setActionCommand("Next");
         nextButton.setText(autoResources.getString("Continue"));
         prevButton.setVisible(false);
        }
      else
        { 
         nextButton.setActionCommand("Next");
         nextButton.setText(autoResources.getString("Next"));
         prevButton.setVisible(false);
        }
      
      /*=====================*/
      /* Set up the choices. */
      /*=====================*/
      
      choicesPanel.removeAll();
      choicesButtons = new ButtonGroup();
      
      //get valid choices from rule
      PrimitiveValue pv = fv.getFactSlot("valid-answers");
      
      //get current selected value for response
      String selected = fv.getFactSlot("response").toString();
     
      Box vbox = Box.createVerticalBox();
      
      //build up the radio buttons based on valid choices.      
      for (int i = 0; i < pv.size(); i++) 
        {
         PrimitiveValue bv = pv.get(i);
         JRadioButton rButton;
         
         if (bv.toString().equals(selected))
            { rButton = new JRadioButton(autoResources.getString(bv.toString()),true); 
              vbox.add(rButton);
            }
         else
            { rButton = new JRadioButton(autoResources.getString(bv.toString()),false); 
            vbox.add(rButton);
            }
                     
         rButton.setActionCommand(bv.toString());
         choicesButtons.add(rButton);
         
         choicesPanel.add(vbox);
         
        }
        
      choicesPanel.repaint();
      
      /*====================================*/
      /* Set the label to the display text. */
      /*====================================*/

      String theText = autoResources.getString(fv.getFactSlot("display").symbolValue());
            
      wrapLabelText(displayLabel,theText);
      
      executionThread = null;
      
      isExecuting = false;
     }

   /*########################*/
   /* ActionListener Methods */
   /*########################*/

   /*******************/
   /* actionPerformed */
   /*******************/  
   public void actionPerformed(
     ActionEvent ae) 
     { 
      try
        { onActionPerformed(ae); }
      catch (Exception e)
        { e.printStackTrace(); }
     }
 
   /***********/
   /* runAuto */
   /***********/  
   public void runAuto()
     {
      Runnable runThread = 
         new Runnable()
           {
            public void run()
              {
               clips.run();
               
               SwingUtilities.invokeLater(
                  new Runnable()
                    {
                     public void run()
                       {
                        try 
                          { nextUIState(); }
                        catch (Exception e)
                          { e.printStackTrace(); }
                       }
                    });
              }
           };
      
      isExecuting = true;
      
      executionThread = new Thread(runThread);
      
      executionThread.start();
     }

   /*********************/
   /* onActionPerformed */
   /*********************/  
   public void onActionPerformed(
     ActionEvent ae) throws Exception 
     { 
      if (isExecuting) return;
      
      /*=====================*/
      /* Get the state-list. */
      /*=====================*/
      
      String evalStr = "(find-all-facts ((?f state-list)) TRUE)";
      
      String currentID = clips.eval(evalStr).get(0).getFactSlot("current").toString();

      /*=========================*/
      /* Handle the Next button. */
      /*=========================*/
      
      if (ae.getActionCommand().equals("Next"))
        {
         if (choicesButtons.getButtonCount() == 0)
           { clips.assertString("(next " + currentID + ")"); 
           		System.out.println(clips.eval("(facts)"));
           }
         else
           {
            clips.assertString("(next " + currentID + " " +
                               choicesButtons.getSelection().getActionCommand() + 
                               ")");
            System.out.println(clips.eval("(facts)"));
           }
           
         runAuto();
        }
      else if (ae.getActionCommand().equals("Restart"))
        { 
         clips.reset(); 
         runAuto();
         
        }
      else if (ae.getActionCommand().equals("Final")){
    	  //String recoString = getFulltimeFinalSubjects();
    	  
    	  //Print DS all 
    	  ArrayList<Elective> list = getFullTimeSubjects();
    	  for (Elective e: list)
    		  System.out.println(e);
    	  
    	  //JOptionPane.showMessageDialog(null, "Recommended " + recoString, "Your Recommendations!", 1);
    	  GenerateInitialTable result = new GenerateInitialTable(list);
    	  
      }
      else if (ae.getActionCommand().equals("Prev"))
        {
         clips.assertString("(prev " + currentID + ")");
         runAuto();
        }
     }

   private String getFulltimeFinalSubjects() throws Exception{
	   
	   String line = System.getProperty("line.separator");
	   StringBuffer sb = new StringBuffer();
	   sb.append(line);
	   
	   ArrayList<Elective> list = getFullTimeSubjects();
	   for (Elective e: list){
		   sb.append(e);
		   sb.append(line);
	   }
	   
	   return sb.toString();
   }
   
   private String getFinalSubjects() throws Exception{
	
	String line = System.getProperty("line.separator");
	
	StringBuffer sb = new StringBuffer();
	sb.append(line);
	
	ArrayList<String> subjects = new ArrayList<String>();
	
	//Pretty string formatting
	String one = getFONESubject().replace("(", "").replace(")", "");
	String two = getFTWOSubject().replace("(", "").replace(")", "");
	String three = getFTHREESubject().replace("(", "").replace(")", "");
	String four = getFFOURSubject().replace("(", "").replace(")", "");
	String five = getFFIVESubject().replace("(", "").replace(")", "");
	String six = getFSIXSubject().replace("(", "").replace(")", "");
	String seven = getFSEVENSubject().replace("(", "").replace(")", "");
	String eight = getFEIGHTSubject().replace("(", "").replace(")", "");
	
	
	subjects.add(one);
	subjects.add(two);
	subjects.add(three);
	subjects.add(four);
	subjects.add(five);
	subjects.add(six);
	subjects.add(seven);
	subjects.add(eight);
	
	for (String s: subjects){
		sb.append(s);
		sb.append(line);
	}
	
	return sb.toString();
}

/*****************/
   /* wrapLabelText */
   /*****************/  
   private void wrapLabelText( JLabel label, String text){
	  
      FontMetrics fm = label.getFontMetrics(label.getFont());
      Container container = label.getParent();
      int containerWidth = container.getWidth();
      int textWidth = SwingUtilities.computeStringWidth(fm,text);
      int desiredWidth;

      if (textWidth <= containerWidth)
        { desiredWidth = containerWidth; }
      else
        { 
         int lines = (int) ((textWidth + containerWidth) / containerWidth);
                  
         desiredWidth = (int) (textWidth / lines);
        }
                 
      BreakIterator boundary = BreakIterator.getWordInstance();
      boundary.setText(text);
   
      StringBuffer trial = new StringBuffer();
      StringBuffer real = new StringBuffer("<html><center>");
   
      int start = boundary.first();
      for (int end = boundary.next(); end != BreakIterator.DONE;
           start = end, end = boundary.next())
        {
         String word = text.substring(start,end);
         trial.append(word);
         int trialWidth = SwingUtilities.computeStringWidth(fm,trial.toString());
         if (trialWidth > containerWidth) 
           {
            trial = new StringBuffer(word);
            real.append("<br>");
            real.append(word);
           }
         else if (trialWidth > desiredWidth)
           {
            trial = new StringBuffer("");
            real.append(word);
            real.append("<br>");
           }
         else
           { real.append(word); }
        }
   
      real.append("</html>");
   
      label.setText(real.toString());
     }
   
   
   public ArrayList<Elective> getFullTimeSubjects() throws Exception{
	   PrimitiveValue pv, fv = null;

	   ArrayList<String> funcs = new ArrayList<String>();
	   ArrayList<Elective> electives = new ArrayList<Elective>();
	  
	   String evalStr = "(find-all-facts ((?f student)) TRUE)";
	      
       String answer = clips.eval(evalStr).get(0).getFactSlot("fulltime").toString();

       if (answer.equalsIgnoreCase("Yes")){
		   funcs.add("(getFONESubject)");
		   funcs.add("(getFTWOSubject)");
		   funcs.add("(getFTHREESubject)");
		   funcs.add("(getFFOURSubject)");
		   funcs.add("(getFFIVESubject)");
		   funcs.add("(getFSIXSubject)");
		   funcs.add("(getFSEVENSubject)");
		   funcs.add("(getFEIGHTSubject)");
       }else{
		   funcs.add("(getPONESubject)");
		   //funcs.add("(getPTWOSubject)");
		   funcs.add("(getPTHREESubject)");
		   funcs.add("(getPFOURSubject)");
		   funcs.add("(getPFIVESubject)");
		   funcs.add("(getPSIXSubject)");
		   funcs.add("(getPSEVENSubject)");
		   funcs.add("(getPEIGHTSubject)");
    	   
       }
	   for (String fun: funcs){
		   Elective elective = new Elective();
		   pv = clips.eval(fun);
		   fv = pv.get(0);
		   elective.setCode(fv.getFactSlot("code").toString());
		   elective.setName(fv.getFactSlot("name").toString().replace("(", "").replace(")", ""));
		   elective.setStream(fv.getFactSlot("stream").toString());
		   elective.setSetf(fv.getFactSlot("setf").toString());
		   elective.setSetp(fv.getFactSlot("setp").toString());
		   elective.setType(fv.getFactSlot("type").toString());
		   elective.setPrg(fv.getFactSlot("prg").toString());
		   elective.setMode(fv.getFactSlot("mode").toString());
		   elective.setPreq(fv.getFactSlot("preq").toString().replace("(", "").replace(")", ""));
		   elective.setCf(fv.getFactSlot("cf").toString());
		   electives.add(elective);
		   
	   }
	   
	   
	   return electives;   
   }
   
	public String getFONESubject() throws Exception{
		// needs improvement
		String cname = null;
		PrimitiveValue pv, fv = null;
		String evalStr = "(getFONESubject)";
		pv = clips.eval(evalStr);
		fv = pv.get(0);
        cname = fv.getFactSlot("name").toString();
        return cname;
	}
	public String getFTWOSubject() throws Exception{
		String cname = null;
		PrimitiveValue pv, fv = null;
		String evalStr = "(getFTWOSubject)";
		pv = clips.eval(evalStr);
		fv = pv.get(0);
        cname = fv.getFactSlot("name").toString();
        return cname;
	}
	public String getFTHREESubject() throws Exception{
		String cname = null;
		PrimitiveValue pv, fv = null;
		String evalStr = "(getFTHREESubject)";
		pv = clips.eval(evalStr);
		fv = pv.get(0);
        cname = fv.getFactSlot("name").toString();
        return cname;
	}
	public String getFFOURSubject() throws Exception{
		String cname = null;
		PrimitiveValue pv, fv = null;
		String evalStr = "(getFFOURSubject)";
		pv = clips.eval(evalStr);
		fv = pv.get(0);
        cname = fv.getFactSlot("name").toString();
        return cname;
	}
	public String getFFIVESubject() throws Exception{
		String cname = null;
		PrimitiveValue pv, fv = null;
		String evalStr = "(getFFIVESubject)";
		pv = clips.eval(evalStr);
		
		fv = pv.get(0);
        cname = fv.getFactSlot("name").toString();
        return cname;
	}
	public String getFSIXSubject() throws Exception{
		String cname = null;
		PrimitiveValue pv, fv = null;
		String evalStr = "(getFSIXSubject)";
		pv = clips.eval(evalStr);
		fv = pv.get(0);
        cname = fv.getFactSlot("name").toString();
        return cname;
	}
	public String getFSEVENSubject() throws Exception{
		String cname = null;
		PrimitiveValue pv, fv = null;
		String evalStr = "(getFSEVENSubject)";
		pv = clips.eval(evalStr);
		fv = pv.get(0);
        cname = fv.getFactSlot("name").toString();
        return cname;
	}
	public String getFEIGHTSubject() throws Exception{
		String cname = null;
		PrimitiveValue pv, fv = null;
		String evalStr = "(getFEIGHTSubject)";
		pv = clips.eval(evalStr);
		fv = pv.get(0);
        cname = fv.getFactSlot("name").toString();
        return cname;
	}

	
   public static void main(String args[])
     {  
      // Create the frame on the event dispatching thread.  
      SwingUtilities.invokeLater(
        new Runnable() 
          {  
           public void run() { new BERecommender(); }  
          });   
     }  
  }