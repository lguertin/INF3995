package service;

import java.awt.Dimension;
import java.awt.Image;
import java.awt.Toolkit;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JFrame;

/**
 * Class as Service. Handles different operations for the window position and layout.
 */
public class WindowService {
	private static ArrayList<Image> imageIcons = null;
	
	/**
	 * Centers a frame on the display screen
	 * @param frame Frame to center
	 */
	public static void centerFrameOnScreen(JFrame frame) {
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		Dimension screenSize = toolkit.getScreenSize();
		
		int x = (screenSize.width - frame.getWidth()) / 2;
		int y = (screenSize.height - frame.getHeight()) / 2;
		
		frame.setLocation(x, y);
	}
	
	/**
	 * Centers a frame on another frame
	 * @param parentFrame Frame reference to center on
	 * @param childFrame Frame to center
	 */
	public static void centerFrameOnFrame(JFrame parentFrame, JFrame childFrame) {
		int x = (parentFrame.getWidth() - childFrame.getWidth()) / 2;
		int y = (parentFrame.getHeight() - childFrame.getHeight()) / 2;
		
		childFrame.setLocation(parentFrame.getLocation().x + x, parentFrame.getLocation().y + y);
	}
	
	/**
	 * Sets the frame icon
	 * @param frame Frame to set the icon
	 */
	public static void setFrameIcon(JFrame frame) {
		if (imageIcons == null) {
			loadIcons();
		}
		
		frame.setIconImages(imageIcons);
	}
	
	/**
	 * Loads the icons from the resource folder
	 */
	private static void loadIcons() {
		imageIcons = new ArrayList<>();
		imageIcons.add(new ImageIcon(WindowService.class.getClass().getResource("/resources/images/icons/logo_16x16_nobg.png")).getImage());
		imageIcons.add(new ImageIcon(WindowService.class.getClass().getResource("/resources/images/icons/logo_32x32_nobg.png")).getImage());
		imageIcons.add(new ImageIcon(WindowService.class.getClass().getResource("/resources/images/icons/logo_64x64_nobg.png")).getImage());
		imageIcons.add(new ImageIcon(WindowService.class.getClass().getResource("/resources/images/icons/logo_nobg.png")).getImage());
	}
}
