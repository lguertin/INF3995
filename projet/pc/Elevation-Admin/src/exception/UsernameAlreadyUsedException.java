package exception;

/**
 * Exception thrown when a supervisor username is already in user.
 */
public class UsernameAlreadyUsedException extends Exception {
	private static final long serialVersionUID = -6257338507565057539L;

	/**
	 * Constructor
	 */
	public UsernameAlreadyUsedException() {
		super("Username Already Used Exception");
	}
}
