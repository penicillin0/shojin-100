import itertools
n = int(input())
a_list, b_list = [], []


for _ in range(n):
    AB = list(map(int, input().split()))
    a_list.append(AB[0])
    b_list.append(AB[1])


def get_time(ent, exi, a, b):
    time = exi - ent
    if a < ent:
        time += 2 * (ent - a)
    if exi < b:
        time += 2 * (b - exi)
    return time


ans = float('inf')
for ent, exi in itertools.product(a_list, b_list):
    time_cnt = 0
    for a, b in zip(a_list, b_list):
        time_cnt += get_time(ent, exi, a, b)
    ans = min(ans, time_cnt)
print(ans)