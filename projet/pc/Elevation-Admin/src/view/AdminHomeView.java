package view;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.Timer;

import controller.AdminHomeController;
import interfaces.FrameView;
import net.miginfocom.swing.MigLayout;
import service.LabelUtils;
import service.Theme;
import service.WindowService;

/**
 * Frame for the main view of the application
 */
public class AdminHomeView extends JFrame implements FrameView {
	private static final long serialVersionUID = 1462648854409745259L;

	private StatisticsPanelView statisticsPanelView;
	private LogsPanelView logsScrollPane;
	private JButton createSupervisorButton;
	private JButton deleteSupervisorButton;
	private JButton changePasswordButton;
	private JButton logoutButton;
	private JButton refreshLogsButton;
	private JButton refreshStatisticsButton;
	private Timer logsRefreshTimer;
	private Timer statisticsRefreshTimer;

	private AdminHomeController controller;

	/**
	 * Constructor
	 */
	public AdminHomeView() {
		setTitle(LabelUtils.getMessage("application_title"));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setMinimumSize(new Dimension(1425, 604));

		WindowService.centerFrameOnScreen(this);
		WindowService.setFrameIcon(this);

		controller = new AdminHomeController();

		initialize();
	}

	@Override
	public void initialize() {
		FrameView.super.initialize();
		refreshStatistics();
		refreshLogs();
		addTimers();
	}

	@Override
	public void createLayout() {
		getContentPane().setBackground(Theme.BACKGROUND_PANEL_COLOR);
		getContentPane().setLayout(new MigLayout("align center, fill", "[40%]20[60%]", ""));

		JPanel leftPane = new JPanel();
		MigLayout leftLayout = new MigLayout("wrap 1, align center, fill", "", "[25%]20[75%]");
		leftPane.setLayout(leftLayout);
		leftPane.setOpaque(false);
		getContentPane().add(leftPane, "align center, grow");

		JPanel rightPane = new JPanel();
		MigLayout rightLayout = new MigLayout("align center, fill", "", "");
		rightPane.setLayout(rightLayout);
		rightPane.setOpaque(false);
		getContentPane().add(rightPane, "align center, grow");

		MigLayout panelsHeaderLayout = new MigLayout("align center, fill", "", "");

		leftPane.add(createButtonsPaneLayout(), "align center, grow");
		leftPane.add(createStatisticPaneLayout(panelsHeaderLayout), "align center, grow");
		rightPane.add(createLogsPaneLayout(panelsHeaderLayout), "align center, grow");
	}

	/**
	 * Creates the pane for the buttons
	 * @return Panel for the buttons layout
	 */
	private JPanel createButtonsPaneLayout() {
		JPanel buttonsPane = new JPanel();
		MigLayout buttonsLayout = new MigLayout("wrap 2, align center, fill", "", "");
		buttonsPane.setLayout(buttonsLayout);
		buttonsPane.setOpaque(false);

		createSupervisorButton = new JButton(LabelUtils.getMessage("add_supervisor"));
		buttonsPane.add(createSupervisorButton, "align center, grow");

		deleteSupervisorButton = new JButton(LabelUtils.getMessage("delete_supervisor"));
		buttonsPane.add(deleteSupervisorButton, "align center, grow");

		changePasswordButton = new JButton(LabelUtils.getMessage("change_password"));
		buttonsPane.add(changePasswordButton, "align center, grow");

		logoutButton = new JButton(LabelUtils.getMessage("disconnect"));
		buttonsPane.add(logoutButton, "align center, grow");
		return buttonsPane;
	}
	
	/**
	 * Creates the pane for the statistics
	 * @param panelsHeaderLayout Default header layout
	 * @return Panel for the statistics layout
	 */
	private JPanel createStatisticPaneLayout(MigLayout panelsHeaderLayout) {
		JPanel statisticsPane = new JPanel();
		MigLayout statisticsLayout = new MigLayout("align center, fill, wrap 1", "", "[20%][80%]");
		statisticsPane.setLayout(statisticsLayout);
		statisticsPane.setOpaque(false);

		JPanel statisticsHeaderPane = new JPanel();
		statisticsHeaderPane.setLayout(panelsHeaderLayout);
		statisticsHeaderPane.setOpaque(false);
		statisticsPane.add(statisticsHeaderPane, "grow");

		JLabel serverStatisticsLabel = new JLabel(LabelUtils.getMessage("server_statistics"));
		statisticsHeaderPane.add(serverStatisticsLabel, "align left, grow");

		refreshStatisticsButton = new JButton(LabelUtils.getMessage("refresh"));
		statisticsHeaderPane.add(refreshStatisticsButton, "align right, grow");

		statisticsPanelView = new StatisticsPanelView();
		statisticsPane.add(statisticsPanelView, "grow");
		return statisticsPane;
	}
	
	/**
	 * Creates the pane for the logs
	 * @param panelsHeaderLayout Default header layout
	 * @return Panel for the logs layout
	 */
	private JPanel createLogsPaneLayout(MigLayout panelsHeaderLayout) {
		JPanel logsPane = new JPanel();
		MigLayout logsLayout = new MigLayout("align center, fill, wrap 1", "", "[15%][85%]");
		logsPane.setLayout(logsLayout);
		logsPane.setOpaque(false);

		JPanel logsHeaderPane = new JPanel();
		logsHeaderPane.setLayout(panelsHeaderLayout);
		logsHeaderPane.setOpaque(false);
		logsPane.add(logsHeaderPane, "grow");

		JLabel serverLogsLabel = new JLabel(LabelUtils.getMessage("server_logs"));
		logsHeaderPane.add(serverLogsLabel, "align left, grow");

		refreshLogsButton = new JButton(LabelUtils.getMessage("refresh"));
		logsHeaderPane.add(refreshLogsButton, "align right, grow");

		logsScrollPane = new LogsPanelView();
		logsPane.add(logsScrollPane, "grow");
		return logsPane;
	}

	@Override
	public void addListeners() {
		createSupervisorButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				popupChildWindow(new CreateSupervisorView());
			}
		});

		deleteSupervisorButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				popupChildWindow(new DeleteSupervisorView());
			}
		});

		changePasswordButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				popupChildWindow(new ChangePasswordView());
			}
		});

		logoutButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				disconnect();
				AuthentificationView newframe = new AuthentificationView();
				newframe.setVisible(true);
				dispose();
			}
		});

		refreshLogsButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				refreshLogs();
			}
		});

		refreshStatisticsButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				refreshStatistics();
			}
		});

		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				disconnect();
				e.getWindow().dispose();
			}
		});
	}
	
	/**
	 * Timers to update the logs and statistics periodically 
	 */
	private void addTimers() {
		logsRefreshTimer = new Timer(7100, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				refreshLogs();
			}
		});
		logsRefreshTimer.setRepeats(true);
		logsRefreshTimer.start();
		
		statisticsRefreshTimer = new Timer(13900, new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				refreshStatistics();
			}
		});
		statisticsRefreshTimer.setRepeats(true);
		statisticsRefreshTimer.start();
	}

	/**
	 * Refreshes the logs exclusively
	 */
	private synchronized void refreshLogs() {
		logsScrollPane.refreshLogs(controller.requestLogs(logsScrollPane.getLastLogId()));
	}
	
	/**
	 * Refreshes the statistics exclusively
	 */
	private synchronized void refreshStatistics() {
		statisticsPanelView.refreshStatistics(controller.requestStatistics());
	}
	
	/**
	 * Disconnects the admin from the application
	 */
	private void disconnect() {
		logsRefreshTimer.stop();
		statisticsRefreshTimer.stop();
		controller.disconnect();
	}

	/**
	 * Child window pop up for functionalities as add supervisor, delete supervisor and change password
	 * @param window Frame to pop up
	 */
	private void popupChildWindow(JFrame window) {
		AdminHomeView view = this;
		
		WindowService.centerFrameOnFrame(view, window);
		window.setVisible(true);
		view.setEnabled(false);
		
		window.addWindowListener(new java.awt.event.WindowAdapter() {
			@Override
			public void windowClosing(java.awt.event.WindowEvent e) {
				view.setEnabled(true);
				e.getWindow().dispose();
			}
		});
	}
}
