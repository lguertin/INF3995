package exception;

/**
 * Exception thrown for Unknown / Bad requests. HTTP error 400
 */
public class UnknownRequestException extends Exception {
	private static final long serialVersionUID = 1556239992773611506L;

	/**
	 * Constructor
	 */
	public UnknownRequestException() {
		super("Unknown Request Exception");
	}
}
