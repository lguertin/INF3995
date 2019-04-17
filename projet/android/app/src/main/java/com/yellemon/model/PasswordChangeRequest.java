package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

/**
 * The type Password change request.
 */
public class PasswordChangeRequest {
    @SerializedName("ancien")
    private String oldPassword;

    @SerializedName("nouveau")
    private String newPassword;

    /**
     * Instantiates a new Password change request.
     *
     * @param oldPassword the old password
     * @param newPassword the new password
     */
    public PasswordChangeRequest(String oldPassword, String newPassword) {
        this.oldPassword = oldPassword;
        this.newPassword = newPassword;
    }

    /**
     * Gets old password.
     *
     * @return the old password
     */
    public String getOldPassword() {
        return oldPassword;
    }

    /**
     * Sets old password.
     *
     * @param oldPassword the old password
     */
    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    /**
     * Gets new password.
     *
     * @return the new password
     */
    public String getNewPassword() {
        return newPassword;
    }

    /**
     * Sets new password.
     *
     * @param newPassword the new password
     */
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
