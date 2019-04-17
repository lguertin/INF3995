package model;

import com.google.gson.annotations.SerializedName;

/**
 * LogRequest model.
 * Used with Gson to serialize the model to JSON
 */
public class LogRequest {
	@SerializedName("dernier")
	private int lastReceivedLog;
	
	/**
	 * Constructor
	 */
	public LogRequest() { }
	
	/**
	 * Constructor
	 * @param lastReceivedLog Last received log
	 */
	public LogRequest(int lastReceivedLog) {
		this.lastReceivedLog = lastReceivedLog;
	}

	/**
	 * Gets the last received log
	 * @return the lastReceivedLog
	 */
	public int getLastReceivedLog() {
		return lastReceivedLog;
	}

	/**
	 * Sets the last received log
	 * @param lastReceivedLog the lastReceivedLog to set
	 */
	public void setLastReceivedLog(int lastReceivedLog) {
		this.lastReceivedLog = lastReceivedLog;
	}
	
	
}
