class GameOfLife {
    private int[][] state;

    function init(int[][] matrix) {
        self.state = matrix;
    }

    function tick() {
        int rows = self.state.length();
        if (rows == 0) {
            return;
        }
        int cols = self.state[0].length();

        int[][] state = [];
        foreach int _ in 0...rows-1 {
            int[] row = [];
            foreach int _ in 0...cols-1 {
                row.push(0);
            }
            state.push(row);
        }

        foreach int row in 0...rows-1 {
            foreach int col in 0...cols-1 {
                int liveNeighbors = 0;
                foreach int nRow in row-1...row+1 {
                    foreach int nCol in  col-1...col+1 {
                        if (nRow == row && nCol == col) {
                            continue;
                        }
                        if (nRow >= 0 && nRow < rows && nCol >= 0 && nCol < cols) {
                            liveNeighbors += self.state[nRow][nCol];
                        }
                    }
                }

                int cell = self.state[row][col];

                if (cell == 1 && (liveNeighbors == 2 || liveNeighbors == 3)) {
                    state[row][col] = 1;
                } else if (cell == 0 && liveNeighbors == 3) {
                    state[row][col] = 1;
                }
            }
        }

        self.state = state;
    }

    function matrix() returns int[][] {
        return self.state.clone();
    }
}