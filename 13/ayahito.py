from copy import deepcopy
R, C = map(int, input().split())
moti = [list(map(str, input().split())) for _ in range(R)]


ans = 0
for i in range(2 ** R):
    i_str = bin(i)[2:].zfill(R)
    cnt = 0
    moti_status = moti[::]
    # moti_status = deepcopy(moti)

    # 行に対して裏返すかを管理
    for r, bit in enumerate(i_str):
        if bit == '1':
            for c in range(C):
                if moti_status[r][c] == '1':
                    moti_status[r][c] = '0'
                else:
                    moti_status[r][c] = '1'

    for c in range(C):
        omote = 0
        for r in range(R):
            if moti_status[r][c] == '1':
                omote += 1
        ura = R - omote
        cnt += max(omote, ura)
    ans = max(ans, cnt)
print(ans)
