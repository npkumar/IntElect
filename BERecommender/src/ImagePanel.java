import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JPanel;


public class ImagePanel extends JPanel{

	private BufferedImage image;
	
	public ImagePanel(String file){
		
		try {
			image = ImageIO.read(new File(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void paintComponent(Graphics g){
		super.paintComponents(g);
		g.drawImage(image, 0, 0, null);
	}
	
}
