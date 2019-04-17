package exception;

/**
 * Exception thrown for Non Authorized Users. HTTP error 403
 */
public class NotAuthorizedException extends Exception {
	private static final long serialVersionUID = 6221024908395238641L;

	/**
	 * Constructor
	 */
	public NotAuthorizedException() {
		super("Not Authorized Exception");
	}
}
