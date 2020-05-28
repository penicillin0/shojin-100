S = input()
ans, p = 0, ""
for s in S:
    if s in ["A", "C", "G", "T"]:
        p += s
    else:
        p = ""
    ans = max(ans, len(p))
print(ans)


n = len(S)
ans_list = []
for i in range(n):
    for j in range(i + 1, n):
        T = S[i: j + 1]
        U = T.replace("A","").replace("C","").replace("G","").replace("T","")
        if U == "":
            ans_list.append(len(T))
print(max(ans_list))
