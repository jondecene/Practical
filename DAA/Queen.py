def solve_n_queens(n):
    def is_safe(board, row, col):
        # Check the column
        for i in range(row):
            if board[i][col] == 1:
                return False

        for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
            if board[i][j] == 1:
                return False

        for i, j in zip(range(row, -1, -1), range(col, n)):
            if board[i][j] == 1:
                return False
        return True  

    def place_queens(board, row):
        if row == n:
            solutions.append([''.join(['Q' if x == 1 else '.' for x in row]) for row in board])
            return
        for col in range(n):
            if is_safe(board, row, col):
                board[row][col] = 1
                place_queens(board, row + 1)
                board[row][col] = 0

    solutions = []
    board = [[0] * n for _ in range(n)]
    place_queens(board, 0)
    return solutions

n = 4  
solutions = solve_n_queens(n)
if solutions:
    for row in solutions[0]:
        print(row)





