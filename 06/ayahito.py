N = int(input())
S = list(input())
S_set = set(S)

ans = 0
for num in range(0, 1000):
    n0, n1, n2 = list(str(num).zfill(3))
    if n0 in S_set and n1 in S_set and n2 in S_set:
        idx0 = S.index(n0)
        idx2 = N - S[::-1].index(n2) - 1
        if idx0 < idx2:
            if n1 in S[idx0 + 1: idx2]:
                ans += 1
print(ans)