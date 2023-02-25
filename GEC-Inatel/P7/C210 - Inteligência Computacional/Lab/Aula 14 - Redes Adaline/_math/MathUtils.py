import numpy as np

def mean_squared_error(w, x, d):
    '''
        w -> vetor de peso
        x -> entrada do dataset
        d -> saida do dataset
    '''

    mse = 0
    for i in range(len(x)):
        v = np.dot(np.transpose(w), x[i])
        mse = mse + pow(d[i] - v, 2)

    mse = mse / len(x)
    return mse