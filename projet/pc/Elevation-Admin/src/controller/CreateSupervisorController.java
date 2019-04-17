package controller;

import exception.NotAuthentificatedException;
import exception.NotAuthorizedException;
import exception.UnknownRequestException;
import exception.UnreachableServerException;
import exception.UsernameAlreadyUsedException;
import model.Credential;
import service.RequestManager;

/**
 *  Controller to CreateSupervisorView. Transition from the view to the server.
 *
 */
public class CreateSupervisorController {
	
	/**
	 * Requests creation a new supervisor on the server.
	 * @param username Username of the supervisor
	 * @param password Password of the supervisor
	 * @return True if the supervisor was created, false otherwise.
	 * @throws UsernameAlreadyUsedException If the name of the supervisor is already in use.
	 */
	public boolean createSupervisor(String username, String password) throws UsernameAlreadyUsedException {
		try {
			RequestManager.post("creationcompte", new Credential(username, password), null);
			
			return true;
		} catch (NotAuthorizedException e) {
			throw new UsernameAlreadyUsedException();
		} catch (UnknownRequestException | NotAuthentificatedException | UnreachableServerException e) {
		}
		
		return false;
	}
}
