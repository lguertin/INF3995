package model;

import com.google.gson.annotations.SerializedName;

/**
 * Statistics model.
 * Used with Gson to serialize the model to JSON
 */
public class Statistics {
	
	@SerializedName("chansons")
	private int submittedSongsAmount;
	
	@SerializedName("utilisateurs")
	private int submittedUserSongsAmount;
	
	@SerializedName("elemines")
	private int deletedSongsAmount;
	
	@SerializedName("temps")
	private String meanPlayingTime;
	
	/**
	 * Constructor
	 */
	public Statistics() { }

	/**
	 * Gets the submitted songs amount
	 * @return the submittedSongsAmount
	 */
	public int getSubmittedSongsAmount() {
		return submittedSongsAmount;
	}

	/**
	 * Sets the submitted songs amount
	 * @param submittedSongsAmount the submittedSongsAmount to set
	 */
	public void setSubmittedSongsAmount(int submittedSongsAmount) {
		this.submittedSongsAmount = submittedSongsAmount;
	}

	/**
	 * Gets the submitted user songs amount
	 * @return the submittedUserSongsAmount
	 */
	public int getSubmittedUserSongsAmount() {
		return submittedUserSongsAmount;
	}

	/**
	 * Sets the submitted user songs amount
	 * @param submittedUserSongsAmount the submittedUserSongsAmount to set
	 */
	public void setSubmittedUserSongsAmount(int submittedUserSongsAmount) {
		this.submittedUserSongsAmount = submittedUserSongsAmount;
	}

	/**
	 * Gets the deleted songs amount
	 * @return the deletedSongsAmount
	 */
	public int getDeletedSongsAmount() {
		return deletedSongsAmount;
	}

	/**
	 * Sets the deleted songs amount
	 * @param deletedSongsAmount the deletedSongsAmount to set
	 */
	public void setDeletedSongsAmount(int deletedSongsAmount) {
		this.deletedSongsAmount = deletedSongsAmount;
	}

	/**
	 * Gets the mean playing time
	 * @return the meanPlayingTime
	 */
	public String getMeanPlayingTime() {
		return meanPlayingTime;
	}

	/**
	 * Sets the mean playing time
	 * @param meanPlayingTime the meanPlayingTime to set
	 */
	public void setMeanPlayingTime(String meanPlayingTime) {
		this.meanPlayingTime = meanPlayingTime;
	}

	
}
