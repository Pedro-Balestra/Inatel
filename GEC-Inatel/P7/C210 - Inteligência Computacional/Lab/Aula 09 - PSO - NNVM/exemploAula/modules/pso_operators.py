import random
from modules import pso_utils

CRAZINESS_PROBABILITY = 0.05


def adjust_velocity(swarm):
    population_adjusted = []

    for p in swarm:
        closest = pso_utils.find_closest(p, swarm)
        p.vel = closest.vel

        population_adjusted.append(p)

    return population_adjusted


def craziness(swarm, num_dimensions, bounds):
    population_crazy = []

    for p in swarm:
        if random.uniform(0, 1) < CRAZINESS_PROBABILITY:
            new_vel = []

            for i in range(num_dimensions):
                new_vel.append(random.uniform(bounds[i][0], bounds[i][0]))

                p.vel = new_vel

        population_crazy.append(p)

    return population_crazy


def update_position(swarm, num_dimensions):
    population_update = []

    for p in swarm:
        new_pos = []

        for i in range(num_dimensions):
            position = p.pos[i] + p.vel[i]
            new_pos.append(position)

        p.pos = new_pos
        population_update.append(p)

    return population_update
