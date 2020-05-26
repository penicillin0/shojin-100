n = int(input())
ans = 0

def get_yakusu_num(n):
    m = int(n ** (1/2))
    rep_list = []
    for q in range(1, m + 2):
        if n % q == 0:
            p = n // q
            rep_list.append(q)
            rep_list.append(p)
    return len(set(rep_list))

for i in range(1, n + 1):
    if get_yakusu_num(i) == 8 and i % 2 == 1:
        ans += 1
print(ans)
