import sys
input = sys.stdin.readline

m = int(input())
seiza = [list(map(int, input().split())) for _ in range(m)]
n = int(input())
hosi = [list(map(int, input().split())) for _ in range(n)]

# seiza.sort(key=lambda x: (x[0], x[1]))
# hosi.sort(key=lambda x: (x[0], x[1]))

seiza_sa = []
for i in range(m - 1):
    seiza_sa.append([seiza[i + 1][0] - seiza[i][0],
                     seiza[i + 1][1] - seiza[i][1]])

cnt = 0
# 先頭候補index: i
for i in range(n):
    flag = True
    this_hosi = hosi[i]
    ans = [this_hosi[0] - seiza[0][0], this_hosi[1] - seiza[0][1]]
    # j個目の星
    for j in range(m - 1):
        sa = seiza_sa[j]
        next_hosi = [this_hosi[0] + sa[0], this_hosi[1] + sa[1]]
        this_hosi = next_hosi
        cnt += 1
        if next_hosi not in hosi:
            flag = False
            break
    if flag is True:
        print(' '.join(list(map(str, ans))))
        break
print(cnt)
