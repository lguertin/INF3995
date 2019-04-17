package exception;

/**
 * Exception thrown for Non Authentificated Users. HTTP error 401
 */
public class NotAuthentificatedException extends Exception {
	private static final long serialVersionUID = -8549103764442009413L;
	
	/**
	 * Constructor
	 */
	public NotAuthentificatedException() {
		super("Not Authentificated Exception");
	}
}
