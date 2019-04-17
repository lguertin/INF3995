package view;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import component.JPasswordFieldPlaceholder;
import controller.ChangePasswordController;
import interfaces.FrameView;
import net.miginfocom.swing.MigLayout;
import service.LabelUtils;
import service.Theme;
import service.WindowService;

/**
 * Frame for the change password view of the application
 */
public class ChangePasswordView extends JFrame implements FrameView {
	private static final long serialVersionUID = -2483712290150389236L;
	
	private JPasswordFieldPlaceholder currentPasswordField;
	private JPasswordFieldPlaceholder newPasswordField;
	private JPasswordFieldPlaceholder confirmPasswordField;
	private JLabel passwordChangeStatus;
	private JButton confirmButton;
	
	private ChangePasswordController controller;
	
	/**
	 * Constructor
	 */
	public ChangePasswordView() {
		setTitle(LabelUtils.getMessage("change_password"));
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		setMinimumSize(new Dimension(600, 350));
		
		WindowService.setFrameIcon(this);
		
		controller = new ChangePasswordController();
		
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

		currentPasswordField = new JPasswordFieldPlaceholder(25, LabelUtils.getMessage("current_password"));
		credentialsPane.add(currentPasswordField, "align center, grow");

		newPasswordField = new JPasswordFieldPlaceholder(25, LabelUtils.getMessage("new_password"));
		credentialsPane.add(newPasswordField, "align center, grow");
		
		confirmPasswordField = new JPasswordFieldPlaceholder(25, LabelUtils.getMessage("confirm_new_password"));
		credentialsPane.add(confirmPasswordField, "align center, grow");
		
		passwordChangeStatus = new JLabel("");
		passwordChangeStatus.setVisible(false);
		getContentPane().add(passwordChangeStatus, "align center");	
		
		JPanel footerPane = new JPanel();
		MigLayout footerLayout = new MigLayout("align center", "[40%]", "[grow]");
		footerPane.setLayout(footerLayout);
		footerPane.setOpaque(false);
		getContentPane().add(footerPane, "align center, grow");
		
		confirmButton = new JButton(LabelUtils.getMessage("confirm"));
		footerPane.add(confirmButton, "align center, grow");
	}
	
	@Override
	public void addListeners() {
		confirmButton.addActionListener(new ActionListener(){
	        @Override
	        public void actionPerformed(ActionEvent e){
	        	changePassword(String.valueOf(currentPasswordField.getPassword()), String.valueOf(newPasswordField.getPassword()), String.valueOf(confirmPasswordField.getPassword()));
	        }
		});
	}
	
	/**
	 * Changes the password of the admin
	 * @param currentPassword Current password of the admin
	 * @param newPassword New password of the admin
	 * @param newPasswordConfirmation Confirmation of the new password of the admin
	 */
	private void changePassword(String currentPassword, String newPassword, String newPasswordConfirmation) {
		confirmButton.setEnabled(false);
    	if (newPassword.equals(newPasswordConfirmation)) {
    		if (controller.changePassword(currentPassword, newPassword)) {
    			LabelUtils.showStatusLabel(passwordChangeStatus, LabelUtils.getMessage("password_changed_succesfully"), Theme.SUCCESS_COLOR);
    		} else {
    			LabelUtils.showStatusLabel(passwordChangeStatus, LabelUtils.getMessage("password_wasnt_changed_error"), Theme.ERROR_COLOR);
    		}	
    	} else {
    		LabelUtils.showStatusLabel(passwordChangeStatus, LabelUtils.getMessage("passwords_dont_match"), Theme.ERROR_COLOR);
    	}
    	confirmButton.setEnabled(true);
	}
}
