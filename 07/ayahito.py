from itertools import combinations

n = int(input())
XY = [list(map(int, input().split())) for _ in range(n)]
grid = [[0]* 5001 for _ in range(5001)]

for i in range(n):
    x, y = XY[i]
    grid[x][y] = 1
ans = 0
for comb in combinations(XY, 2):
    s = 0
    flag = False
    grid1, grid2 = comb
    a, b = grid1
    c, d = grid2
    h1 = [a + d - b, b - c + a]
    h2 = [d - b + c, a + d - c]
    h3 = [a - d + b, b + c - a]
    h4 = [c + b - d, d + c - a]
    # H = [h1, h2, h3, h4]
    # for h in H:
    #     if not (0 <= h[0] <= 5000 and 0 <= h[1] <= 5000):
    #         flag = True
    # if flag is True:
    #     break
    if grid[h1[0]][h1[1]] == 1 and grid[h2[0]][h2[1]] == 1:
        s = (c - a) ** 2 + (d - b) ** 2
    if grid[h3[0]][h3[1]] == 1 and grid[h4[0]][h4[1]] == 1:
        s = (c - a) ** 2 + (d - b) ** 2
    ans = max(ans, s)
print(ans)