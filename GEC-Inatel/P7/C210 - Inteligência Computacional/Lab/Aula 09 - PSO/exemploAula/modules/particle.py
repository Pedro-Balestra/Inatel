import random

from scipy import rand


class Particle:
    def __init__(self, num_dimensions, bounds):
        self.num_dimensions = num_dimensions
        self.pos = []
        self.vel = []

        for i in range(num_dimensions):
            self.pos.append(random.uniform(bounds[i][0], bounds[i][1]))
            self.vel.append(random.uniform(bounds[i][0], bounds[i][1]))
