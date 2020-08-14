n, k = map(int, input().split())
A = list(map(int, input().split()))

ans = float("inf")
for i in range(2 ** n):
    can_see_list = list(bin(i)[2:].zfill(n))
    cost = 0
    now_hieght = A[0]

    # 1つ目の建物が常に見えることを考慮して気をつける
    if can_see_list[0] == '1':
        if can_see_list.count('1') < k:
            continue
    else:
        if can_see_list.count('1') < k - 1:
            continue
    
    for num, can_see in enumerate(can_see_list):
        # それまでの高さを気をつけて保持する
        if can_see == "1":
            if now_hieght >= A[num]:
                cost += (now_hieght - A[num]) + 1
                now_hieght = now_hieght + 1
            else:
                now_hieght = A[num]
        else:
            now_hieght = max(now_hieght, A[num])
            
    ans = min(ans, cost)
print(ans)