package service;

import java.awt.Color;
import java.awt.Font;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.swing.JLabel;

/**
 * Class as Service. Interacts with labels for multiple usages
 */
public class LabelUtils {
	private static Locale locale = new Locale("fr", "CA");
	private static ResourceBundle messageBundle = ResourceBundle.getBundle("resources.properties.MessagesBundle", locale);
	
	/**
	 * Shows the status label with a text and a color
	 * @param label Label to affect the text and the color to
	 * @param text Text of the label
	 * @param color Color of the label
	 */
	public static void showStatusLabel(JLabel label, String text, Color color) {
		label.setText(text);
		label.setForeground(color);
		label.setVisible(true);
	}
	
	/**
	 * Resizes a label to use maximum space of its component.
	 * @param label Label to resize
	 */
	public static void resizeLabel(JLabel label) {
		Font labelFont = label.getFont();
    	String labelText = label.getText();

    	int stringWidth = label.getFontMetrics(labelFont).stringWidth(labelText);
    	int componentWidth = label.getWidth();

    	// Find out how much the font can grow in width.
    	double widthRatio = (double)componentWidth / (double)stringWidth;

    	int newFontSize = (int)(labelFont.getSize() * widthRatio);
    	int componentHeight = label.getHeight();

    	// Pick a new font size so it will not be larger than the height of label.
    	int fontSizeToUse = Math.min(newFontSize, componentHeight);
    	
    	// Set the label's font size to the newly determined size.
    	label.setFont(new Font(labelFont.getName(), Font.PLAIN, fontSizeToUse));
	}
	
	/**
	 * Gets the message from the resource bundle assigned with a key
	 * @param key Key to the message
	 * @return Message as String corresponding to the key
	 */
	public static String getMessage(String key) {
		return messageBundle.getString(key);
	}
}