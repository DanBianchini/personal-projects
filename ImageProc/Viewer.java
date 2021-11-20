import java.awt.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import javax.swing.*;
 
public class Viewer {
 
	public static void main(String[] args) throws FileNotFoundException {
		int width, height, max_val;
		int[] data;
		  
		Scanner s = new Scanner(new File(args[0]));
		String header = s.next();
		if (!header.equals("P3")) {
			System.out.println("This program only accepts P3 .ppm files");
			s.close();
			return;
		}
		width = s.nextInt(); height = s.nextInt(); max_val = s.nextInt();
		
		// pixel values begin here
		data = new int[width * height * 3]; // allocate memory for data
		
		for (int i = 0; i < width * height * 3; i++)
			data[i] = s.nextInt();
		// data has been collected
		s.close();
		
		MyPanel panel = new MyPanel(data, width, height);
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		JFrame frame = new JFrame(args[0]);
		frame.setSize(width, height);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// add panel to frame
		frame.add(panel);
		
		frame.setVisible(true);
	}
}

class MyPanel extends JPanel {
	private int[] data;
	private int width, height;
	
	public MyPanel(int[] x, int w, int h) {
		data = x;
		width = w;
		height = h;
	}
	
	public void paint(Graphics g) {
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				int index = 3 * (y * width + x);
				g.setColor(new Color(data[index], data[index + 1], data[index + 2]));
				g.drawLine(x, y, x, y);
			}
		}
	}
}