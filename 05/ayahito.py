a, b , c, x , y = map(int, input().split())

ab_n = 2 * (max(x, y))
ans = float("inf")

for i in range(0, ab_n + 1, 2):
    a_n = x - i // 2
    b_n = y - i // 2
    if a_n < 0:
        a_n = 0
    if b_n < 0:
        b_n = 0
    ans = min(ans, a * a_n + b * b_n + c * i)
print(ans)
