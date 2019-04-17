package exception;

/**
 * Exception thrown for Unreachable server. HTTP error 500
 */
public class UnreachableServerException extends Exception {
	private static final long serialVersionUID = -6305945218348567195L;
	
	/**
	 * Constructor
	 */
	public UnreachableServerException() {
		super("Unreachable Server Exception");
	}
}
