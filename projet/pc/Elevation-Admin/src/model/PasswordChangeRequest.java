package model;

import com.google.gson.annotations.SerializedName;

/**
 * PasswordChangeRequest model.
 * Used with Gson to serialize the model to JSON
 */
public class PasswordChangeRequest {
	@SerializedName("ancien")
	private String oldPassword;
	
	@SerializedName("nouveau")
	private String newPassword;
	
	/**
	 * Constructor
	 */
	public PasswordChangeRequest() { }
	
	/**
	 * Constructor
	 * @param oldPassword Old password
	 * @param newPassword New password
	 */
	public PasswordChangeRequest(String oldPassword, String newPassword) {
		this.oldPassword = oldPassword;
		this.newPassword = newPassword;
	}

	/**
	 * Gets the old password
	 * @return the oldPassword
	 */
	public String getOldPassword() {
		return oldPassword;
	}

	/**
	 * Sets the old password
	 * @param oldPassword the oldPassword to set
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	/**
	 * Gets the new password
	 * @return the newPassword
	 */
	public String getNewPassword() {
		return newPassword;
	}

	/**
	 * Sets the new password
	 * @param newPassword the newPassword to set
	 */
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	
}
