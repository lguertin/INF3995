package component;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Shape;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.geom.RoundRectangle2D;

import javax.swing.JLabel;
import javax.swing.JPasswordField;

import net.miginfocom.swing.MigLayout;

/**
 * Class extending JPasswordField. Gives the opportunity to hold a dynamic placeholder. 
 */
public class JPasswordFieldPlaceholder extends JPasswordField {
	private static final long serialVersionUID = 1L;

	private JLabel placeholderLabel;

	/**
	 * Constructor
	 * @param columns Number of columns to the input field
	 * @param placeholder Text of the placeholder
	 */
	public JPasswordFieldPlaceholder(int columns, String placeholder) {
		super(columns);

		placeholderLabel = new JLabel(placeholder);
		placeholderLabel.setForeground(new Color(125, 125, 125));
		placeholderLabel
				.setFont(new Font(placeholderLabel.getName(), Font.ITALIC, placeholderLabel.getFont().getSize()));

		MigLayout inputPlaceholdersLayout = new MigLayout("aligny center");

		setLayout(inputPlaceholdersLayout);
		add(placeholderLabel);
		
		setOpaque(false);
		
		addListeners();
	}

	/**
	 * Add the listener to the placeholder
	 */
	private void addListeners() {
		JPasswordFieldPlaceholder textField = this;
		textField.addKeyListener(new KeyAdapter() {
			@Override
			public void keyTyped(KeyEvent keyEvent) {
				if (keyEvent.getKeyChar() != KeyEvent.VK_BACK_SPACE) {
					placeholderLabel.setVisible(false);
				} else {
					if (String.valueOf(textField.getPassword()).equals("")) {
						placeholderLabel.setVisible(true);
					}
				}
			}
		});
	}

	private Shape shape;

	@Override
	protected void paintComponent(Graphics g) {
		g.setColor(getBackground());
		g.fillRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 20, 20);
		super.paintComponent(g);
	}

	@Override
	protected void paintBorder(Graphics g) {
		g.setColor(getForeground());
		g.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 20, 20);
	}

	@Override
	public boolean contains(int x, int y) {
		if (shape == null || !shape.getBounds().equals(getBounds())) {
			shape = new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 20, 20);
		}
		return shape.contains(x, y);
	}
}
