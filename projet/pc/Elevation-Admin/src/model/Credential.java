package model;

import com.google.gson.annotations.SerializedName;

/**
 * Credential model.
 * Used with Gson to serialize the model to JSON
 */
public class Credential {
	@SerializedName("usager")
	private String username;
	
	@SerializedName("mot_de_passe")
	private String password;
	
	/**
	 * Constructor
	 */
	public Credential() { }
	
	/**
	 * Constructor
	 * @param username Username
	 * @param password Password
	 */
	public Credential(String username, String password) {
		this.username = username;
		this.password = password;
	}
	
	/**
	 * Gets the username
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	
	/**
	 * Sets the username
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**
	 * Gets the password
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	
	/**
	 * Sets the password
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
}
