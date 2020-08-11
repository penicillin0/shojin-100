n, m = map(int, input().split())
XY = [list(map(int, input().split())) for _ in range(m)]

person_relation = [[''] for _ in range(n + 2)]

# 知り合いを管理
for x, y in XY:
    person_relation[x].append(y)
    person_relation[y].append(x)


ans = 0
for i in range(2 ** n):
    i_str = bin(i)[2:].zfill(n)

    # 派閥を作成
    habatsu = []
    for num, bit in enumerate(i_str):
        if bit == '1':
            habatsu.append(num + 1)

    # 全員知り合いか調べる
    flag = True
    p = len(habatsu)
    for j in range(p):
        for k in range(p):
            if j == k:
                continue
            if not habatsu[k] in person_relation[habatsu[j]]:
                flag = False

    # もし全員知り合いなら
    if flag is True:
        ans = max(ans, p)
print(ans)
