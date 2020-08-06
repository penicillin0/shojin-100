import sys
input = sys.stdin.readline
n = int(input())
A = list(map(int, input().split()))
q = int(input())
M = list(map(int, input().split()))

ans_map = {}

for i in range(1, n * 2000 + 1):
    ans_map[i] = 0

for i in range(2 ** n - 1):
    str_i = str(bin(i)[2:]).zfill(n)
    sum_a = 0
    for j, bit in enumerate(str_i):
        if bit == '1':
            sum_a += A[j]
    ans_map[sum_a] = 1

for m in M:
    if ans_map[m]:
        print('yes')
    else:
        print('no')
