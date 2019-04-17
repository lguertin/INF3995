package model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

/**
 * Supervisors model.
 * Used with Gson to serialize the model to JSON
 */
public class Supervisors {
	@SerializedName("superviseurs")
	private List<String> supervisors;
	
	/**
	 * Constructor
	 */
	public Supervisors() { }

	/**
	 * Gets the supervisors
	 * @return the supervisors
	 */
	public List<String> getSupervisors() {
		return supervisors;
	}

	/**
	 * Sets the supervisors
	 * @param supervisors the supervisors to set
	 */
	public void setSupervisors(List<String> supervisors) {
		this.supervisors = supervisors;
	}
	
	
}
