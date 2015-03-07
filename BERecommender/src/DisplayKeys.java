import javax.swing.JFrame;


public class DisplayKeys extends JFrame {

	public DisplayKeys(){
		super("Keys");
		ImagePanel panel = new ImagePanel("electives.png");
		setSize(780,710);
		getContentPane().add(panel);
		setLocationRelativeTo(null);
		setVisible(true);
	}
}
