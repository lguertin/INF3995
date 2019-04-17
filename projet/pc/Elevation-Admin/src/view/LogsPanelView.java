package view;

import java.util.List;

import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JScrollPane;

import model.Log;

/**
 * Panel for the logs view in the home view of the application
 */
public class LogsPanelView extends JScrollPane {
	private static final long serialVersionUID = 7524598053064275582L;
	
	private JList<Log> logList;
	private DefaultListModel<Log> logListModel;
	
	/**
	 * Constructor
	 */
	public LogsPanelView() {	
		initialize();
	}
	
	/**
	 * Refreshes the list of logs
	 * @param logs Logs to append to the list
	 */
	public void refreshLogs(List<Log> logs) {
		if (logs != null) {
			for(Log log : logs) {
				logListModel.addElement(log);
			}
		}
	}
	
	/**
	 * Gets the last log id sent from the server
	 * @return The last log id
	 */
	public int getLastLogId() {
		if (logListModel.getSize() != 0) {
			return logListModel.get(logListModel.size() - 1).getId();
		}
		
		return 0;
	}
	
	/**
	 * Initializes the logs list
	 */
	private void initialize() {
		this.logListModel = new DefaultListModel<Log>();
		this.logList = new JList<Log>(this.logListModel);
		
		logList.setSelectionInterval(-1, -1); // Prevents from selecting any log from the list
		setViewportView(logList);
	}
}
