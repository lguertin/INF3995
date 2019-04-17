package interfaces;

public interface FrameView {

	/**
	 * Initializes the frame
	 */
	default void initialize() {
		createLayout();
		addListeners();
	}
	
	/**
	 * Creates the layout of the frame
	 */
	void createLayout();
	
	/**
	 * Add the listeners to the frame components
	 */
	void addListeners();
}
