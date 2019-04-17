package controller;

import exception.NotAuthentificatedException;
import exception.NotAuthorizedException;
import exception.UnknownRequestException;
import exception.UnreachableServerException;
import model.Credential;
import service.RequestManager;

/**
 * Controller to AuthentificationHomeView. Transition from the view to the server.
 */
public class AuthentificationController {

	/**
	 * Requests logon of the admin to the application
	 * @param username Username of the admin
	 * @param password Password of the admin
	 * @return True if the connection was successful, false otherwise.
	 * @throws UnreachableServerException Exception if server is not available
	 */
	public boolean login(String username, String password) throws UnreachableServerException {
		try {
			RequestManager.post("login", new Credential(username, password), null);
			
			return true;
		} catch (UnknownRequestException | NotAuthentificatedException | NotAuthorizedException e) {
		}
		
		return false;
	}
}
