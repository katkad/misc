import itertools
import re

table = {}
for line in open('94').read().strip().split('\n'):
    cities = re.findall(r'([a-zA-Z]{3,})', line)
    dist = int(re.search(r'([0-9]+)', line).group())
    if cities[0] not in table.keys():
        table[cities[0]] = {cities[1]: dist}
    else:
        table[cities[0]][cities[1]] = dist
    if cities[1] not in table.keys():
        table[cities[1]] = {cities[0]: dist}
    else:
        table[cities[1]][cities[0]] = dist

all_poss_paths = itertools.permutations(list(table.keys()))
totals = []

for path in all_poss_paths:
    print path
    prev = None
    tt = 0
    for city in path:
        if prev is None:
            prev = city
            continue
        else:
            if city not in table[prev].keys():
                break
            else:
                tt += table[prev][city]
                prev = city
    else:
        totals.append(tt)
print(max(totals)) # print(min(totals)) in part one.
