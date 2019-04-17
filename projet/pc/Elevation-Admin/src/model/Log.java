package model;

import com.google.gson.annotations.SerializedName;

/**
 * Log model.
 * Used with Gson to serialize the model to JSON
 */
public class Log {
	@SerializedName("no")
	private int id;
	
	@SerializedName("info")
	private String message;
	
	/**
	 * Constructor
	 */
	public Log() { }
	
	/**
	 * Gets the id
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * Sets the id
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Gets the message
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * Sets the message
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * Transform the model to a formatted string
	 */
	public String toString() {
		return this.id + "- " + this.message;
	}
}
