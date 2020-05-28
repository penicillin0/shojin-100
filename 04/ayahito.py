from itertools import combinations

n,m = map(int, input().split())
A = [list(map(int, input().split())) for _ in range(n)]

ans = 0

for i, j in combinations(list(range(m)), 2):
    p_ans = 0
    for k in range(n):
        p_ans += max(A[k][i], A[k][j])
    ans = max(ans, p_ans)
print(ans)