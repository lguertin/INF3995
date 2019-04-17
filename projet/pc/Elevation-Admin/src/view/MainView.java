package view;

import java.awt.EventQueue;
import java.awt.Font;
import java.util.Enumeration;

import javax.swing.UIManager;
import javax.swing.plaf.FontUIResource;

import service.RequestManager;

/**
 * Main entry class of the program
 */
public class MainView {
	
	/**
	 * Main entry of the program
	 * @param args Arguments of the program
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					setUIFont (new FontUIResource("VERDUN",Font.ITALIC,18)); // Changes the global text font
					RequestManager.initialize();
					
					AuthentificationView window = new AuthentificationView();
					window.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Sets the UI resource
	 * @param fontUIResource
	 */
	public static void setUIFont(FontUIResource fontUIResource) {
		Enumeration<Object> keys = UIManager.getDefaults().keys();
		while (keys.hasMoreElements()) {
			Object key = keys.nextElement();
			Object value = UIManager.get(key);
			if (value instanceof FontUIResource)
				UIManager.put(key, fontUIResource);
		}
	}
}
