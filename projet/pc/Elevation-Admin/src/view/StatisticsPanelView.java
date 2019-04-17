package view;

import java.awt.Color;

import javax.swing.BorderFactory;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import model.Statistics;
import net.miginfocom.swing.MigLayout;
import service.LabelUtils;

/**
 * Panel for the statistics view in the home view of the application
 */
public class StatisticsPanelView extends JPanel {
	private static final long serialVersionUID = -161792790728523337L;
	
	private JLabel submitedSongsResultLabel;
	private JLabel submitedUserSongsResultLabel;
	private JLabel deleteSongsResultLabel;
	private JLabel meanSongsTimeResultLabel;
	
	/**
	 * Constructor
	 */
	public StatisticsPanelView() {		
		initialize();
	}
	
	/**
	 * Refreshes the values of the statistics
	 * @param statistics New statistics values to affect to the current values
	 */
	public void refreshStatistics(Statistics statistics) {
		if (statistics != null) {
			submitedSongsResultLabel.setText(Integer.toString(statistics.getSubmittedSongsAmount()));
			submitedUserSongsResultLabel.setText(Integer.toString(statistics.getSubmittedUserSongsAmount()));
			deleteSongsResultLabel.setText(Integer.toString(statistics.getDeletedSongsAmount()));
			meanSongsTimeResultLabel.setText(statistics.getMeanPlayingTime());
		}
	}
	
	/**
	 * Initializes the view
	 */
	private void initialize() {
		setBackground(Color.WHITE);
		setBorder(BorderFactory.createLineBorder(Color.GRAY));
		setLayout(new MigLayout("wrap 2, align center, fill", "[80%]10[20%]", "10[25%]10[25%]10[25%]10[25%]10"));
		
		JLabel submitedSongsLabel = new JLabel(LabelUtils.getMessage("number_of_songs_played"));
		add(submitedSongsLabel, "grow");
		
		submitedSongsResultLabel = new JLabel("0", SwingConstants.RIGHT);
		add(submitedSongsResultLabel, "grow");
		
		JLabel sumbitedUserSongsLabel = new JLabel(LabelUtils.getMessage("number_users_song_submission"));
		add(sumbitedUserSongsLabel, "grow");
		
		submitedUserSongsResultLabel = new JLabel("0", SwingConstants.RIGHT);
		add(submitedUserSongsResultLabel, "grow");
		
		JLabel deleteSongsLabel = new JLabel(LabelUtils.getMessage("number_songs_deleted_by_supervisors"));
		add(deleteSongsLabel, "grow");
		
		deleteSongsResultLabel = new JLabel("0", SwingConstants.RIGHT);
		add(deleteSongsResultLabel, "grow");
		
		JLabel meanSongsTimeLabel = new JLabel(LabelUtils.getMessage("mean_songs_play_time"));
		add(meanSongsTimeLabel, "grow");
		
		meanSongsTimeResultLabel = new JLabel("0", SwingConstants.RIGHT);
		add(meanSongsTimeResultLabel, "grow");
	}
}
