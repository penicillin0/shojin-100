from itertools import combinations

n = int(input())
XY =[list(map(int, input().split())) for _ in range(n)]
grid = [[0]* 5001 for _ in range(5001)]

for i in range(n):
    x, y = XY[i]
    grid[x][y] = 1

for comb in combinations(XY, 2):
    print(comb)