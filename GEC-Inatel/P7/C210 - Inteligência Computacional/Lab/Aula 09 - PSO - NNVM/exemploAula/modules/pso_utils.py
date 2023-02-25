from dis import dis
from struct import pack


def eucliddean_distance(p1, p2):

    ans = 0

    for i in range(len(p1.pos)):
        ans += (p1.pos[i]-p2.pos[i])**2

    return ans


def find_closest(p, swarm):
    min_dist = None
    closet = None

    for i in swarm:
        if i != p:

            dist = eucliddean_distance(i, p)

            if min_dist is None or dist < min_dist:
                min_dist = dist
                closest = i

    return closest
