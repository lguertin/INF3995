package view;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import component.BackgroundImageJPanel;
import component.JLabel2D;
import component.JPasswordFieldPlaceholder;
import component.JTextFieldPlaceholder;
import controller.AuthentificationController;
import exception.UnreachableServerException;
import interfaces.FrameView;
import net.miginfocom.swing.MigLayout;
import service.LabelUtils;
import service.Theme;
import service.WindowService;

/**
 * Frame for the authentification view of the application
 */
public class AuthentificationView extends JFrame implements FrameView {
	private static final long serialVersionUID = 7704213060853381164L;
		
	private JLabel2D welcomeLabel;
	private JTextFieldPlaceholder usernameField;
	private JPasswordFieldPlaceholder passwordField;
	private JButton loginButton;
	private JLabel errorLabel;
	private AuthentificationController controller;

	/**
	 * Constructor
	 */
	public AuthentificationView() {
		setTitle(LabelUtils.getMessage("application_title"));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setMinimumSize(new Dimension(640, 393));
		
		WindowService.centerFrameOnScreen(this);
		WindowService.setFrameIcon(this);
		
		controller = new AuthentificationController();
		initialize();
	}
	
	@Override
	public void createLayout() {
		setContentPane(new BackgroundImageJPanel("/resources/images/cafe_img.jpg"));
		getContentPane().setBackground(Theme.BACKGROUND_PANEL_COLOR);
		getContentPane().setLayout(new MigLayout("wrap 1, align center, fill", "", "[30%]20[45%]10[10%][15%]"));
				
		welcomeLabel = new JLabel2D(LabelUtils.getMessage("cafe_bistro_welcome"));
		welcomeLabel.setFont(new Font(Font.SERIF, Font.BOLD, 34));
		welcomeLabel.setHorizontalAlignment(SwingConstants.CENTER);
		welcomeLabel.setOutlineColor(Color.BLACK);
		welcomeLabel.setForeground(new Color(128, 0, 0));
		getContentPane().add(welcomeLabel, "align center, grow, wmin 10");
		
		JPanel credentialsPane = new JPanel();
		MigLayout credentialsLayout = new MigLayout("wrap 1, align center", "[50%]", "[20%]20[20%]");
		credentialsPane.setLayout(credentialsLayout);
		credentialsPane.setOpaque(false);
		getContentPane().add(credentialsPane, "align center, grow");
		
		usernameField = new JTextFieldPlaceholder(25, LabelUtils.getMessage("username"));
		credentialsPane.add(usernameField, "align center, grow");
		
		passwordField = new JPasswordFieldPlaceholder(25, LabelUtils.getMessage("password"));
		credentialsPane.add(passwordField, "align center, grow");
		
		errorLabel = new JLabel(" ");
		errorLabel.setForeground(Theme.ERROR_COLOR);
		getContentPane().add(errorLabel, "align center");
		
		JPanel footerPane = new JPanel();
		MigLayout footerLayout = new MigLayout("align center", "[40%]", "[grow]");
		footerPane.setLayout(footerLayout);
		footerPane.setOpaque(false);
		getContentPane().add(footerPane, "align center, grow");
		
		loginButton = new JButton(LabelUtils.getMessage("signin"));
		footerPane.add(loginButton, "align center, grow");
	}
	
	@Override
	public void addListeners() {
		loginButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				login(usernameField.getText(), String.valueOf(passwordField.getPassword()));
			}
		});
		
		addComponentListener(new ComponentAdapter() {
		    public void componentResized(ComponentEvent componentEvent) {
		    	LabelUtils.resizeLabel(welcomeLabel);
		    }
		});
	}
	
	/**
	 * Logins the admin to the server
	 * @param username Username of the admin
	 * @param password Password of the admin
	 */
	private void login(String username, String password) {
		try {
			if (controller.login(username, password)) {
				AdminHomeView newframe = new AdminHomeView();
				newframe.setVisible(true);
				dispose();
			} else {
				errorLabel.setText(LabelUtils.getMessage("invalid_username_or_password"));
			}
		} catch (UnreachableServerException e) {
			errorLabel.setText(LabelUtils.getMessage("server_unreachable"));
		}
	}
}
