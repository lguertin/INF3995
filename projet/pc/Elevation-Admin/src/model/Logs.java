package model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

/**
 * Logs model.
 * Used with Gson to serialize the model to JSON
 * Class used in between only to hold addition information on the list in the JSON
 */
public class Logs {
	@SerializedName("information")
	private List<Log> logs;
	
	/**
	 * Constructor
	 */
	public Logs() { }

	/**
	 * Gets the logs
	 * @return the logs
	 */
	public List<Log> getLogs() {
		return logs;
	}

	/**
	 * Sets the logs
	 * @param logs the logs to set
	 */
	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}
	
	
}
