package controller;

import java.util.List;

import exception.NotAuthentificatedException;
import exception.NotAuthorizedException;
import exception.UnknownRequestException;
import exception.UnreachableServerException;
import model.Credential;
import model.Supervisors;
import service.RequestManager;

/**
 *  Controller to DeleteSupervisorView. Transition from the view to the server.
 */
public class DeleteSupervisorController {
	
	/**
	 * Requests deletion of a supervisor from the server.
	 * @param username Username of the supervisor to delete
	 * @return True if the supervisor is deleted, false otherwise.
	 */
	public boolean deleteSupervisor(String username) {
		try {
			RequestManager.post("suppressioncompte", new Credential(username, null), null);
			
			return true;
		} catch (UnknownRequestException | NotAuthentificatedException | NotAuthorizedException
				| UnreachableServerException e) {
		}
		
		return false;
	}
	
	/**
	 * Requests the list of supervisors from the server.
	 * @return An array of supervisor usernames.
	 */
	public List<String> getSupervisors() {		
		List<String> supervisors = null;
		
		try {
			supervisors = ((Supervisors) RequestManager.get("listesuperviseurs", Supervisors.class)).getSupervisors();
		} catch (UnknownRequestException | NotAuthentificatedException | NotAuthorizedException
				| UnreachableServerException e) {
		}
			
		return supervisors;
	}
}
