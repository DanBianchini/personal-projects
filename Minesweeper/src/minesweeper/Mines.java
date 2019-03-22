package minesweeper;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class Mines extends JFrame {

    private JLabel statusbar;
    
    public Mines() {
        
        try {
			initUI().activateMineMan();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
    }
    
    private Board initUI() {

        statusbar = new JLabel("");
        Board board = new Board(statusbar);
        add(statusbar, BorderLayout.SOUTH);

        add(board);        
        
        setResizable(false);
        pack();
        
        setTitle("Minesweeper");
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
        return board;
    }
    
    public static void main(String[] args) {
        
        //EventQueue.invokeLater(() -> {
            Mines ex = new Mines();
        //});
        
    }
}