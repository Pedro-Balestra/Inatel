from tkinter import Y
import numpy as np

from _data import DataSets
from _math import ActivationFunctions, MathUtils
from _plot import PlotUtils


class Adaline:
    def __init__(self, n, g, e):
        '''
            n -> taxa de aprendizagem
            g -> função de ativação
            e -> tolerancia
        '''

        self.n = n
        self.g = g
        self.e = e
        self.plot_data_x = []
        self.plot_data_y = []

    def train(self, x, d):
        '''
            X -> entrada do dataset
            d -> saida esperada do dataset
            return vetor de pesos
        '''

        k = len(x)
        w = np.random.rand(len(x[0]))

        epoch = 0
        while True:
            mse_before = MathUtils.mean_squared_error(w , x, d)

            for i in range(0, k):
                v = np.dot(np.transpose(w), x[i])
                w = np.add(w, np.multiply(x[i], self.n * (d[i] - v)))

            epoch += 1
            mse_after = MathUtils.mean_squared_error(w, x, d)

            self.plot_data_x.append(epoch)
            self.plot_data_y.append(mse_after)

            print(f"Época {epoch}\tPesos: {w}\tError: {mse_after:.12f}")

            if abs(mse_after - mse_before) <= self.e:
                break

        return w

    def test(self, w, x):
        v = np.dot(np.transpose(w), x)
        y = self.g(v)
        return y

    def evaluate(self, w, x, d):
        correct = 0
        total = len(x)

        for i in range(total):
            y = self.test(w, x[i])
            if y == d[i]:
                correct += 1

        accuracy = (correct / total) * 100
        return accuracy


if __name__ == "__main__":
    # Load DataSet
    x = DataSets.LOGIC_GATE_AND.input
    d = DataSets.LOGIC_GATE_AND.output

    # Define Parameters
    n = 1e-4
    g = ActivationFunctions.heaviside
    e = 1e-6

    # Create nn
    nn = Adaline(n, g, e)

    # Train nn
    w = nn.train(x, d)

    acc = nn.evaluate(w, x, d)
    print(f"Acuracia:", acc, "%")

    PlotUtils.plot(nn.plot_data_x, "Época", nn.plot_data_y, "MSE")