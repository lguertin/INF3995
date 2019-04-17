package controller;

import exception.NotAuthentificatedException;
import exception.NotAuthorizedException;
import exception.UnknownRequestException;
import exception.UnreachableServerException;
import model.PasswordChangeRequest;
import service.RequestManager;

/**
 * Controller to ChangePasswordView. Transition from the view to the server.
 */
public class ChangePasswordController {
	
	/**
	 * Requests a password change of the admin
	 * @param oldPassword Old password that he used to log in
	 * @param newPassword New password that he wants to log in with
	 * @return True if the password was changed, false otherwise.
	 */
	public boolean changePassword(String oldPassword, String newPassword) {
		try {
			RequestManager.post("changement_mdp", new PasswordChangeRequest(oldPassword, newPassword), null);
			
			return true;
		} catch (UnknownRequestException | NotAuthentificatedException | NotAuthorizedException
				| UnreachableServerException e) {
		}
		
		return false;
	}
}
