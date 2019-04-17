package view;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import controller.DeleteSupervisorController;
import interfaces.FrameView;
import net.miginfocom.swing.MigLayout;
import service.LabelUtils;
import service.Theme;
import service.WindowService;

/**
 * Frame for the delete supervisor view of the application
 */
public class DeleteSupervisorView extends JFrame implements FrameView {
	private static final long serialVersionUID = 8866808065121185863L;
	
	private JLabel statusLabel;
	private JButton deleteButton;
	private DefaultListModel<String> supervisorListModel;
	private JList<String> supervisorList;
	
	private DeleteSupervisorController controller;
	
	/**
	 * Constructor
	 */
    public DeleteSupervisorView() {
    	setTitle(LabelUtils.getMessage("delete_supervisor"));
    	setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
    	setMinimumSize(new Dimension(450, 530));
    	
    	WindowService.setFrameIcon(this);
    	
    	controller = new DeleteSupervisorController();
    	
    	initialize();
    }
    
    @Override
	public void initialize() {
		FrameView.super.initialize();
		populateSupervisorList();
	}
	
    @Override
	public void createLayout() {
		getContentPane().setBackground(Theme.BACKGROUND_PANEL_COLOR);
		getContentPane().setLayout(new MigLayout("wrap 1, align center, fill", "", "[15%]10[60%]20[10%][15%]"));
		
		JLabel pageTitleLabel = new JLabel(LabelUtils.getMessage("supervisor_list_title"));
    	pageTitleLabel.setFont(new Font("Verdun", Font.PLAIN, 24));
    	getContentPane().add(pageTitleLabel, "align center, grow");	
		
		JScrollPane scrollPane = new JScrollPane();
    	getContentPane().add(scrollPane, "align center, grow");
    	
    	supervisorListModel = new DefaultListModel<String>();    	
    	supervisorList = new JList<String>(supervisorListModel);
    	scrollPane.setViewportView(supervisorList);
    	
    	statusLabel = new JLabel("");
    	statusLabel.setVisible(false);
    	getContentPane().add(statusLabel, "align center");
    	
    	JPanel footerPane = new JPanel();
		MigLayout footerLayout = new MigLayout("align center", "[40%]", "[grow]");
		footerPane.setLayout(footerLayout);
		footerPane.setOpaque(false);
		getContentPane().add(footerPane, "align center, grow");
    	
    	deleteButton = new JButton(LabelUtils.getMessage("delete"));
    	footerPane.add(deleteButton, "align center, grow");
	}
    
    @Override
	public void addListeners() {
    	deleteButton.addActionListener(new ActionListener(){
	        @Override
	        public void actionPerformed(ActionEvent e){
	        	deleteSupervisor();
	        }
	    });
    }
    
    /**
     * Populates the supervisor list with the list from the server
     */
    private void populateSupervisorList() {
    	for (String supervisor : controller.getSupervisors()) {
    		supervisorListModel.addElement(supervisor);
    	}
    }
    
    /**
     * Deletes a supervisor from the list and on the server
     */
    private void deleteSupervisor() {
    	deleteButton.setEnabled(false);
    	if (supervisorList.getSelectedValue() != null) {
    		if (controller.deleteSupervisor(supervisorList.getSelectedValue())) {
    			LabelUtils.showStatusLabel(statusLabel, LabelUtils.getMessage("supervisor_successfully_deleted"), Theme.SUCCESS_COLOR);
        		
        		supervisorListModel.removeElementAt(supervisorList.getSelectedIndex());
        		supervisorList.clearSelection();
    		} else {
    			LabelUtils.showStatusLabel(statusLabel, LabelUtils.getMessage("supervisor_wasnt_deleted"), Theme.ERROR_COLOR);
    		}
    	} else {
    		LabelUtils.showStatusLabel(statusLabel, LabelUtils.getMessage("no_supervisor_selected"), Theme.ERROR_COLOR);
    	}
    	deleteButton.setEnabled(true);
    }
}
