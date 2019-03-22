package minesweeper;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Random;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Board extends JPanel {

    private final int NUM_IMAGES = 13;
    private final int CELL_SIZE = 60;

    private final int COVER_FOR_CELL = 10;
    private final int MARK_FOR_CELL = 10;
    private final int EMPTY_CELL = 0;
    private final int MINE_CELL = 9;
    private final int COVERED_MINE_CELL = MINE_CELL + COVER_FOR_CELL;
    private final int MARKED_MINE_CELL = COVERED_MINE_CELL + MARK_FOR_CELL;

    private final int DRAW_MINE = 9;
    private final int DRAW_COVER = 10;
    private final int DRAW_MARK = 11;
    private final int DRAW_WRONG_MARK = 12;

    private final int N_MINES = 40;
    private final int N_ROWS = 16;
    private final int N_COLS = 16;

    private final int BOARD_WIDTH = N_ROWS * CELL_SIZE + 1;
    private final int BOARD_HEIGHT = N_COLS * CELL_SIZE + 1;

    private int[] field;
    private boolean inGame;
    private int minesLeft;
    private Image[] img;
    private MineMan mm;

    private int allCells;
    private final JLabel statusbar;

    public Board(JLabel statusbar) {
    	statusbar.setFont(new Font("Serif", Font.BOLD, 64));
        this.statusbar = statusbar;
        initBoard();
        mm = new MineMan(10);
    }

    private void initBoard() {

        setPreferredSize(new Dimension(BOARD_WIDTH, BOARD_HEIGHT));

        img = new Image[NUM_IMAGES];

        for (int i = 0; i < NUM_IMAGES; i++) {
            String path = "src/resources/" + i + ".png";
            img[i] = (new ImageIcon(path)).getImage();
        }

        //addMouseListener(new MinesAdapter());
        newGame();
    }

    private void newGame() {

        int cell;

        Random random = new Random();
        inGame = true;
        minesLeft = N_MINES;

        allCells = N_ROWS * N_COLS;
        field = new int[allCells];

        for (int i = 0; i < allCells; i++) {
            field[i] = COVER_FOR_CELL;
        }

        statusbar.setText(Integer.toString(minesLeft));

        int i = 0;
        
        while (i < N_MINES) {

            int position = (int) (allCells * random.nextDouble());

            if ((position < allCells)
                    && (field[position] != COVERED_MINE_CELL)) {

                int current_col = position % N_COLS;
                field[position] = COVERED_MINE_CELL;
                i++;

                if (current_col > 0) {
                    cell = position - 1 - N_COLS;
                    if (cell >= 0) {
                        if (field[cell] != COVERED_MINE_CELL) {
                            field[cell] += 1;
                        }
                    }
                    cell = position - 1;
                    if (cell >= 0) {
                        if (field[cell] != COVERED_MINE_CELL) {
                            field[cell] += 1;
                        }
                    }

                    cell = position + N_COLS - 1;
                    if (cell < allCells) {
                        if (field[cell] != COVERED_MINE_CELL) {
                            field[cell] += 1;
                        }
                    }
                }

                cell = position - N_COLS;
                if (cell >= 0) {
                    if (field[cell] != COVERED_MINE_CELL) {
                        field[cell] += 1;
                    }
                }
                
                cell = position + N_COLS;
                if (cell < allCells) {
                    if (field[cell] != COVERED_MINE_CELL) {
                        field[cell] += 1;
                    }
                }

                if (current_col < (N_COLS - 1)) {
                    cell = position - N_COLS + 1;
                    if (cell >= 0) {
                        if (field[cell] != COVERED_MINE_CELL) {
                            field[cell] += 1;
                        }
                    }
                    cell = position + N_COLS + 1;
                    if (cell < allCells) {
                        if (field[cell] != COVERED_MINE_CELL) {
                            field[cell] += 1;
                        }
                    }
                    cell = position + 1;
                    if (cell < allCells) {
                        if (field[cell] != COVERED_MINE_CELL) {
                            field[cell] += 1;
                        }
                    }
                }
            }
        }
    }

    public void find_empty_cells(int j) {

        int current_col = j % N_COLS;
        int cell;

        if (current_col > 0) {
            cell = j - N_COLS - 1;
            if (cell >= 0) {
                if (field[cell] > MINE_CELL) {
                    field[cell] -= COVER_FOR_CELL;
                    if (field[cell] == EMPTY_CELL) {
                        find_empty_cells(cell);
                    }
                }
            }

            cell = j - 1;
            if (cell >= 0) {
                if (field[cell] > MINE_CELL) {
                    field[cell] -= COVER_FOR_CELL;
                    if (field[cell] == EMPTY_CELL) {
                        find_empty_cells(cell);
                    }
                }
            }

            cell = j + N_COLS - 1;
            if (cell < allCells) {
                if (field[cell] > MINE_CELL) {
                    field[cell] -= COVER_FOR_CELL;
                    if (field[cell] == EMPTY_CELL) {
                        find_empty_cells(cell);
                    }
                }
            }
        }

        cell = j - N_COLS;
        if (cell >= 0) {
            if (field[cell] > MINE_CELL) {
                field[cell] -= COVER_FOR_CELL;
                if (field[cell] == EMPTY_CELL) {
                    find_empty_cells(cell);
                }
            }
        }

        cell = j + N_COLS;
        if (cell < allCells) {
            if (field[cell] > MINE_CELL) {
                field[cell] -= COVER_FOR_CELL;
                if (field[cell] == EMPTY_CELL) {
                    find_empty_cells(cell);
                }
            }
        }

        if (current_col < (N_COLS - 1)) {
            cell = j - N_COLS + 1;
            if (cell >= 0) {
                if (field[cell] > MINE_CELL) {
                    field[cell] -= COVER_FOR_CELL;
                    if (field[cell] == EMPTY_CELL) {
                        find_empty_cells(cell);
                    }
                }
            }

            cell = j + N_COLS + 1;
            if (cell < allCells) {
                if (field[cell] > MINE_CELL) {
                    field[cell] -= COVER_FOR_CELL;
                    if (field[cell] == EMPTY_CELL) {
                        find_empty_cells(cell);
                    }
                }
            }

            cell = j + 1;
            if (cell < allCells) {
                if (field[cell] > MINE_CELL) {
                    field[cell] -= COVER_FOR_CELL;
                    if (field[cell] == EMPTY_CELL) {
                        find_empty_cells(cell);
                    }
                }
            }
        }

    }

    @Override
    public void paintComponent(Graphics g) {

        int uncover = 0;

        for (int i = 0; i < N_ROWS; i++) {
            for (int j = 0; j < N_COLS; j++) {

                int cell = field[(i * N_COLS) + j];

                if (inGame && cell == MINE_CELL) {
                    inGame = false;
                }

                if (!inGame) {
                    if (cell == COVERED_MINE_CELL) {
                        cell = DRAW_MINE;
                    } else if (cell == MARKED_MINE_CELL) {
                        cell = DRAW_MARK;
                    } else if (cell > COVERED_MINE_CELL) {
                        cell = DRAW_WRONG_MARK;
                    } else if (cell > MINE_CELL) {
                        cell = DRAW_COVER;
                    }

                } else {
                    if (cell > COVERED_MINE_CELL) {
                        cell = DRAW_MARK;
                    } else if (cell > MINE_CELL) {
                        cell = DRAW_COVER;
                        uncover++;
                    }
                }
                
                //fix later, failsafe for now
                while (cell < 0)
                	cell += 10;

                g.drawImage(img[cell], (j * CELL_SIZE),
                        (i * CELL_SIZE), this);
            }
        }

        if (uncover == 0 && inGame) {
            inGame = false;
            statusbar.setText("Game won");
        } else if (!inGame) {
            statusbar.setText("Game lost");
        }
    }

    private class MinesAdapter extends MouseAdapter {

        @Override
        public void mousePressed(MouseEvent e) {

            int x = e.getX();
            int y = e.getY();

            int cCol = x / CELL_SIZE;
            int cRow = y / CELL_SIZE;

            boolean doRepaint = false;

            if (!inGame) {

                newGame();
                repaint();
            }

            if ((x < N_COLS * CELL_SIZE) && (y < N_ROWS * CELL_SIZE)) {

                if (e.getButton() == MouseEvent.BUTTON3) {

                    if (field[(cRow * N_COLS) + cCol] > MINE_CELL) {
                        doRepaint = true;

                        if (field[(cRow * N_COLS) + cCol] <= COVERED_MINE_CELL) {
                            if (minesLeft > 0) {
                                field[(cRow * N_COLS) + cCol] += MARK_FOR_CELL;
                                minesLeft--;
                                String msg = Integer.toString(minesLeft);
                                statusbar.setText(msg);
                            } else {
                                statusbar.setText("No marks left");
                            }
                        } else {

                            field[(cRow * N_COLS) + cCol] -= MARK_FOR_CELL;
                            minesLeft++;
                            String msg = Integer.toString(minesLeft);
                            statusbar.setText(msg);
                        }
                    }

                } else {

                    if (field[(cRow * N_COLS) + cCol] > COVERED_MINE_CELL) {
                        return;
                    }

                    if ((field[(cRow * N_COLS) + cCol] > MINE_CELL)
                            && (field[(cRow * N_COLS) + cCol] < MARKED_MINE_CELL)) {

                        field[(cRow * N_COLS) + cCol] -= COVER_FOR_CELL;
                        doRepaint = true;

                        if (field[(cRow * N_COLS) + cCol] == MINE_CELL) {
                            inGame = false;
                        }
                        
                        if (field[(cRow * N_COLS) + cCol] == EMPTY_CELL) {
                            find_empty_cells((cRow * N_COLS) + cCol);
                        }
                    }
                }

                if (doRepaint) {
                    repaint();
                }

            }
        }
    }
    
    public MineMan getMineMan() {
    	return mm;
    }
    
    public void activateMineMan() throws InterruptedException {
    	mm.solve();
    }
    
    public class MineMan {
    	private int interval;	//interval is the period of time between moves in milliseconds
    							//this is implemented to slow the program to a speed that humans can witness
    	
    	public MineMan(int x) {
    		interval = x;
    	}
    	
    	private void mark(int x, int y) {
    		field[y * N_COLS + x] += MARK_FOR_CELL;
    		repaint();
    	}
    	
       	private void uncover(int x, int y) {
    		field[y * N_COLS + x] -= COVER_FOR_CELL;
    		
    		if (field[(y * N_COLS) + x] == MINE_CELL) {
                inGame = false;
            }
            
            if (field[(y * N_COLS) + x] == EMPTY_CELL) {
                find_empty_cells((y * N_COLS) + x);
            }
            
            repaint();
    	}
    	
    	private boolean saturation() {
    		int current;
    		int covered;
    		int marked;
    		for (int j = 0; j < N_ROWS; j++) {
    			for (int i = 0; i < N_COLS; i++) {
    				current = field[j * N_COLS + i];
    				covered = 0; //reset covered count each time
    				marked = 0;
    				if (current > 0 && current < 9) { // box being examined is a number 1 - 8; examine the boxes around it
    					//determine edge conditions
    					boolean top = (j == 0);
    					boolean bottom = (j == N_ROWS - 1);
    					boolean left = (i == 0);
    					boolean right = (i == N_COLS - 1);
    					
    					//only examine boxes if they exist to avoid out of bounds
    					//if box is covered but NOT marked (COVER_FOR_CELL < value of box <= COVERED_MINE_CELL) add one to covered
    					// if box is marked (value of box > COVERED_MINE_CELL) add one to marked
    					if (!top) { // box isn't at the top, so check the box above it
    						if (field[(j - 1) * N_COLS + i] > MINE_CELL && field[(j - 1) * N_COLS + i] <= COVERED_MINE_CELL)
    							covered++;
    						else if (field[(j - 1) * N_COLS + i] > COVERED_MINE_CELL)
    							marked++;
    					}
    					if (!bottom) { //box isn't at the bottom, so check the box below it
    						if (field[(j + 1) * N_COLS + i] > MINE_CELL && field[(j + 1) * N_COLS + i] <= COVERED_MINE_CELL)
    							covered++;
    						else if (field[(j + 1) * N_COLS + i] > COVERED_MINE_CELL)
    							marked++;
    					}
    					if (!left) { //box isn't on the left; check the box to the left of it
    						if (field[j * N_COLS + i - 1] > MINE_CELL && field[j * N_COLS + i - 1] <= COVERED_MINE_CELL)
    							covered++;
    						else if (field[j * N_COLS + i - 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					if (!right) { //box isn't on the right; check the box to the right of it
    						if (field[j * N_COLS + i + 1] > MINE_CELL && field[j * N_COLS + i + 1] <= COVERED_MINE_CELL)
    							covered++;
    						else if (field[j * N_COLS + i + 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					if (!left && !top) { //top left box exists, check it
    						if (field[(j - 1) * N_COLS + i - 1] > MINE_CELL && field[(j - 1) * N_COLS + i - 1] <= COVERED_MINE_CELL)
    							covered++;
    						else if (field[(j - 1) * N_COLS + i - 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					if (!right && !top) { //top right box exists, check it
    						if (field[(j - 1) * N_COLS + i + 1] > MINE_CELL && field[(j - 1) * N_COLS + i + 1] <= COVERED_MINE_CELL)
    							covered++;
    						else if (field[(j - 1) * N_COLS + i + 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					if (!left && !bottom) { //bottom left box exists, check it
    						if (field[(j + 1) * N_COLS + i - 1] > MINE_CELL && field[(j + 1) * N_COLS + i - 1] <= COVERED_MINE_CELL)
    							covered++;
    						else if (field[(j + 1) * N_COLS + i - 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					if (!right && !bottom) { //bottom right box exists, check it
    						if (field[(j + 1) * N_COLS + i + 1] > MINE_CELL && field[(j + 1) * N_COLS + i + 1] <= COVERED_MINE_CELL)
    							covered++;
    						else if (field[(j + 1) * N_COLS + i + 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					
    					//at this point, covered and marked contain the number of covered and marked boxes around the current box
    					//now compare the number of mines left to be marked around this box (current - marked) with the number of covered, unmarked boxes (covered)
    					// if (current - marked == covered), then the saturation rule applies. All unmarked boxes should be marked and function should return true
    					if (current - marked == covered && covered != 0) {
    						if (!top) { // box isn't at the top, so check the box above it
        						if (field[(j - 1) * N_COLS + i] > MINE_CELL && field[(j - 1) * N_COLS + i] <= COVERED_MINE_CELL) {
        							mark(i, j - 1);
        						}
        					}
        					if (!bottom) { //box isn't at the bottom, so check the box below it
        						if (field[(j + 1) * N_COLS + i] > MINE_CELL && field[(j + 1) * N_COLS + i] <= COVERED_MINE_CELL) {
        							mark(i, j + 1);
        						}
        					}
        					if (!left) { //box isn't on the left; check the box to the left of it
        						if (field[j * N_COLS + i - 1] > MINE_CELL && field[j * N_COLS + i - 1] <= COVERED_MINE_CELL) {
        							mark(i - 1, j);
        						}
        					}
        					if (!right) { //box isn't on the right; check the box to the right of it
        						if (field[j * N_COLS + i + 1] > MINE_CELL && field[j * N_COLS + i + 1] <= COVERED_MINE_CELL) {
        							mark(i + 1, j);
        						}
        					}
        					if (!left && !top) { //top left box exists, check it
        						if (field[(j - 1) * N_COLS + i - 1] > MINE_CELL && field[(j - 1) * N_COLS + i - 1] <= COVERED_MINE_CELL) {
        							mark(i - 1, j - 1);
        						}
        					}
        					if (!right && !top) { //top right box exists, check it
        						if (field[(j - 1) * N_COLS + i + 1] > MINE_CELL && field[(j - 1) * N_COLS + i + 1] <= COVERED_MINE_CELL) {
        							mark(i + 1, j - 1);
        						}
        					}
        					if (!left && !bottom) { //bottom left box exists, check it
        						if (field[(j + 1) * N_COLS + i - 1] > MINE_CELL && field[(j + 1) * N_COLS + i - 1] <= COVERED_MINE_CELL) {
        							mark(i - 1, j + 1);
        						}
        					}
        					if (!right && !bottom) { //bottom right box exists, check it
        						if (field[(j + 1) * N_COLS + i + 1] > MINE_CELL && field[(j + 1) * N_COLS + i + 1] <= COVERED_MINE_CELL) {
        							mark(i + 1, j + 1);
        						}
        					}
    						
    						return true;
    					}
    				}
    			}
    		}
    		
    		return false;
    	}
    	
    	private void randomChoice() {
    		int x, y;
    		do {
				x = (int) (Math.random() * N_COLS);
				y = (int) (Math.random() * N_ROWS);
    		} while (field[y * N_COLS + x] < COVER_FOR_CELL || field[y * N_COLS + x] > COVERED_MINE_CELL);
    		
    		uncover(x, y);
    	}
    	
    	private boolean fullRule() {
    		//box has value of n, is surrounded by n flags. this means the rest of the covered boxes are safe to be uncovered
    		int current;
    		int covered;
    		int marked;
    		boolean top, bottom, left, right;
    		
    		for (int j = 0; j < N_ROWS; j++) {
    			for (int i = 0; i < N_COLS; i++) {
    				current = field[j * N_COLS + i];
    				covered = 0;
    				marked = 0;
    				
    				//boolean values below will be used for edge cases to avoid checking out of bounds
    				top = (j == 0);
    				bottom = (j == N_ROWS - 1);
    				left = (i == 0);
    				right = (i == N_COLS - 1);
    				
    				//current box is a number 1-8 (uncovered, not an empty space), count the number of marked tiles around it
    				if (current > 0 && current < MINE_CELL) {
    					//box isn't at the top; check the box above it
    					if (!top) {
    						if (field[(j - 1) * N_COLS + i] > MINE_CELL && field[(j - 1) * N_COLS + i] <= COVERED_MINE_CELL)
    							covered++;
    						if (field[(j - 1) * N_COLS + i] > COVERED_MINE_CELL)
    							marked++;
    					}
    					//box isn't at the bottom; check the box below it
    					if (!bottom) {
    						if (field[(j + 1) * N_COLS + i] > MINE_CELL && field[(j + 1) * N_COLS + i] <= COVERED_MINE_CELL)
    							covered++;
    						if (field[(j + 1) * N_COLS + i] > COVERED_MINE_CELL)
    							marked++;
    					}
    					//box isn't on the left; check the box to the left of it
    					if (!left) {
    						if (field[j * N_COLS + i - 1] > MINE_CELL && field[j * N_COLS + i - 1] <= COVERED_MINE_CELL)
    							covered++;
    						if (field[j * N_COLS + i - 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					//box isn't on the right; check the box to the right of it
    					if (!right) {
    						if (field[j * N_COLS + i + 1] > MINE_CELL && field[j * N_COLS + i + 1] <= COVERED_MINE_CELL)
    							covered++;
    						if (field[j * N_COLS + i + 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					//box isn't in the top left corner; check the box to the top left of it
    					if (!top && !left) {
    						if (field[(j - 1) * N_COLS + i - 1] > MINE_CELL && field[(j - 1) * N_COLS + i - 1] <= COVERED_MINE_CELL)
    							covered++;
    						if (field[(j - 1) * N_COLS + i - 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					//box isn't in the top right corner; check the box to the top right of it
    					if (!top && !right) {
    						if (field[(j - 1) * N_COLS + i + 1] > MINE_CELL && field[(j - 1) * N_COLS + i + 1] <= COVERED_MINE_CELL)
    							covered++;
    						if (field[(j - 1) * N_COLS + i + 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					//box isn't in the bottom left corner; check the box to the bottom left of it
    					if (!bottom && !left) {
    						if (field[(j + 1) * N_COLS + i - 1] > MINE_CELL && field[(j + 1) * N_COLS + i - 1] <= COVERED_MINE_CELL)
    							covered++;
    						if (field[(j + 1) * N_COLS + i - 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					//box isn't in the bottom right corner; check the box to the bottom right of it
    					if (!bottom && !right) {
    						if (field[(j + 1) * N_COLS + i + 1] > MINE_CELL && field[(j + 1) * N_COLS + i + 1] <= COVERED_MINE_CELL)
    							covered++;
    						if (field[(j + 1) * N_COLS + i + 1] > COVERED_MINE_CELL)
    							marked++;
    					}
    					
    					//marked now contains the number of marked boxes around the current box
    					//if (current == marked), there can be no more mines around the current box
    					//uncover all unmarked boxes around the current box
    					if (current == marked && covered > 0) {
    						if (!top) {
    							if (field[(j - 1) * N_COLS + i] > MINE_CELL && field[(j - 1) * N_COLS + i] <= COVERED_MINE_CELL)
    								uncover(i, j - 1);
    						}
    						if (!bottom) {
    							if (field[(j + 1) * N_COLS + i] > MINE_CELL && field[(j + 1) * N_COLS + i] <= COVERED_MINE_CELL)
    								uncover(i, j + 1);
    						}
    						if (!left) {
    							if (field[j * N_COLS + i - 1] > MINE_CELL && field[j * N_COLS + i - 1] <= COVERED_MINE_CELL)
    								uncover(i - 1, j);
    						}
    						if (!right) {
    							if (field[j * N_COLS + i + 1] > MINE_CELL && field[j * N_COLS + i + 1] <= COVERED_MINE_CELL)
    								uncover(i + 1, j);
    						}
    						if (!top && !left) {
    							if (field[(j - 1) * N_COLS + i - 1] > MINE_CELL && field[(j - 1) * N_COLS + i - 1] <= COVERED_MINE_CELL)
    								uncover(i - 1, j - 1);
    						}
    						if (!top && !right) {
    							if (field[(j - 1) * N_COLS + i + 1] > MINE_CELL && field[(j - 1) * N_COLS + i + 1] <= COVERED_MINE_CELL)
    								uncover(i + 1, j - 1);
    						}
    						if (!bottom && !left) {
    							if (field[(j + 1) * N_COLS + i - 1] > MINE_CELL && field[(j + 1) * N_COLS + i - 1] <= COVERED_MINE_CELL)
    								uncover(i - 1, j + 1);
    						}
    						if (!bottom && !right) {
    							if (field[(j + 1) * N_COLS + i + 1] > MINE_CELL && field[(j + 1) * N_COLS + i + 1] <= COVERED_MINE_CELL)
    								uncover(i + 1, j + 1);
    						}
    						
    						return true;
    					}
    				}
    			}
    		}
    		
    		return false;
    	}
    	
    	public void solve() throws InterruptedException { // everything is in order of priority here
    		while (true) {
				while (inGame) {
		    		if (saturation()) {
						Thread.sleep(interval);
					}
					else if (fullRule()) {
						Thread.sleep(interval);
					}
					else {
						randomChoice();
						Thread.sleep(interval);
					}
				}
				Thread.sleep(3000);
	    		newGame();
	    		repaint();
    		}
    	}
    }
}