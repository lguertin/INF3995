package component;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JPanel;

/**
 *	Class that can hold an image in the background
 */
public class BackgroundImageJPanel extends JPanel{
	private static final long serialVersionUID = 1L;
	
	private BufferedImage image;

	/**
	 * Constructor
	 * @param filePath Path of the file to the image
	 */
    public BackgroundImageJPanel(String filePath) {
       try {                
          image = ImageIO.read(getClass().getResource(filePath));
       } catch (IOException e) {
    	   e.printStackTrace();
       }
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(image, 0, 0, getWidth(), getHeight(), this);          
    }
}
