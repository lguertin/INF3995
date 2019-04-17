package view;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import component.JPasswordFieldPlaceholder;
import component.JTextFieldPlaceholder;
import controller.CreateSupervisorController;
import exception.UsernameAlreadyUsedException;
import interfaces.FrameView;
import net.miginfocom.swing.MigLayout;
import service.LabelUtils;
import service.Theme;
import service.WindowService;

/**
 * Frame for the create supervisor view of the application
 */
public class CreateSupervisorView extends JFrame implements FrameView {
	private static final long serialVersionUID = 2554207580412423949L;
	
	private JTextFieldPlaceholder usernameField;
	private JPasswordFieldPlaceholder passwordField;
	private JPasswordFieldPlaceholder passwordConfirmField;
	private JLabel newSupervisorStatusLabel;
	private JButton submitButton;
	
	private CreateSupervisorController controller;

	/**
	 * Constructor
	 */
	public CreateSupervisorView() {
		setTitle(LabelUtils.getMessage("add_supervisor"));
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		setMinimumSize(new Dimension(608, 342));
		
		WindowService.setFrameIcon(this);
		
		controller = new CreateSupervisorController();
		
		initialize();
	}
	
	@Override
	public void createLayout() {
		getContentPane().setBackground(Theme.BACKGROUND_PANEL_COLOR);
		getContentPane().setLayout(new MigLayout("wrap 1, align center, fill", "", "[75%]10[10%][15%]"));
		
		JPanel credentialsPane = new JPanel();
		MigLayout credentialsLayout = new MigLayout("wrap 1, align center", "[50%]", "[20%]20[20%]");
		credentialsPane.setLayout(credentialsLayout);
		credentialsPane.setOpaque(false);
		getContentPane().add(credentialsPane, "align center, grow");
		
		usernameField = new JTextFieldPlaceholder(25, LabelUtils.getMessage("supervisor_name"));
		credentialsPane.add(usernameField, "align center, grow");
		
		passwordField = new JPasswordFieldPlaceholder(25, LabelUtils.getMessage("password"));
		credentialsPane.add(passwordField, "align center, grow");
		
		passwordConfirmField = new JPasswordFieldPlaceholder(25, LabelUtils.getMessage("confirm_password"));
		credentialsPane.add(passwordConfirmField, "align center, grow");
		
		newSupervisorStatusLabel = new JLabel("");
		newSupervisorStatusLabel.setVisible(false);
		getContentPane().add(newSupervisorStatusLabel, "align center");
		
		JPanel footerPane = new JPanel();
		MigLayout footerLayout = new MigLayout("align center", "[40%]", "[grow]");
		footerPane.setLayout(footerLayout);
		footerPane.setOpaque(false);
		getContentPane().add(footerPane, "align center, grow");
		
		submitButton = new JButton(LabelUtils.getMessage("submit"));
		footerPane.add(submitButton, "align center, grow");
	}
	
	@Override
	public void addListeners() {
		submitButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				createSupervisor(usernameField.getText(), String.valueOf(passwordField.getPassword()), String.valueOf(passwordConfirmField.getPassword()));
			}
		});
	}
	
	/**
	 * Creates a new supervisor
	 * @param username Username of the supervisor
	 * @param password Password of the supervisor
	 * @param passwordConfirmation Confirmation of the password of the supervisor
	 */
	private void createSupervisor(String username, String password, String passwordConfirmation) {
		submitButton.setEnabled(false);
		if (password.equals(passwordConfirmation)) {
			try {
				if (controller.createSupervisor(username, password)) {
					LabelUtils.showStatusLabel(newSupervisorStatusLabel, LabelUtils.getMessage("supervisor_successfully_added"), Theme.SUCCESS_COLOR);
				} else {
					LabelUtils.showStatusLabel(newSupervisorStatusLabel, LabelUtils.getMessage("supervisor_wasnt_added"), Theme.ERROR_COLOR);
				}
			} catch (UsernameAlreadyUsedException e) {
				LabelUtils.showStatusLabel(newSupervisorStatusLabel, LabelUtils.getMessage("supervisor_username_invalid_or_used"), Theme.ERROR_COLOR);
			}	
    	} else {
    		LabelUtils.showStatusLabel(newSupervisorStatusLabel, LabelUtils.getMessage("passwords_dont_match"), Theme.ERROR_COLOR);
		}
		submitButton.setEnabled(true);
	}
}
