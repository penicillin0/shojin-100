while True:
    count = 0

    n, x = map(int, input().split())
    if n == 0 and x == 0:
        break
    for i in range(1, n + 1):
        for j in range(i+1, n + 1):
            k = x - i - j
            if i + j + k == x and j < k <= n:
                count += 1
    print(count)
