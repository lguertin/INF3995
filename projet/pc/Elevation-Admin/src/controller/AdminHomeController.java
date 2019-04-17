package controller;

import java.util.List;

import exception.NotAuthentificatedException;
import exception.NotAuthorizedException;
import exception.UnknownRequestException;
import exception.UnreachableServerException;
import model.Log;
import model.LogRequest;
import model.Logs;
import model.Statistics;
import service.RequestManager;

/**
 * Controller to AdminHomeView. Transition from the view to the server.
 */
public class AdminHomeController {
	
	/**
	 * Requests the statistics from the server
	 * @return Statistics model
	 */
	public Statistics requestStatistics() {
		Statistics statistics = null;
		
		try {
			statistics = (Statistics) RequestManager.get("statistiques", Statistics.class);
		} catch (UnknownRequestException | NotAuthentificatedException | NotAuthorizedException
				| UnreachableServerException e) {
		}
		
		return statistics;
	}
	
	/**
	 * Requests the logs from the server
	 * @param lastReceivedLogId Last log id received from the server on last request
	 * @return List of Log
	 */
	public List<Log> requestLogs(int lastReceivedLogId) {
		List<Log> logs = null;

		try {			
			logs = ((Logs) RequestManager.post("logs", new LogRequest(lastReceivedLogId), Logs.class)).getLogs();
		} catch (UnknownRequestException | NotAuthentificatedException | NotAuthorizedException
				| UnreachableServerException e) {
		}
		
		return logs;
	}
	
	/**
	 * Request disconnection of admin to server
	 */
	public void disconnect() {
		try {			
			RequestManager.post("logout", null, null);
		} catch (UnknownRequestException | NotAuthentificatedException | NotAuthorizedException
				| UnreachableServerException e) {
		}
	}
}
