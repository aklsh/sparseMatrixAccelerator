'''
    Generate random sparse matrices and input vectors

    1. Generate irregularly sparse matrices with different sparsity rates (approx.)
'''

import numpy as np 
from scipy.sparse import csr_matrix

def irregSparse():
    isZero = np.ones((matrixHeight, matrixWidth))
    sparseMatrix = np.zeros((matrixHeight, matrixWidth))
    for i in range(matrixHeight):
        for j in range(matrixWidth):
            isZero[i][j] = (np.random.randint(0, 10000, 1)[0] < sparsityRate*10000)
            sparseMatrix[i][j] = np.random.randn(1) if (isZero[i][j] == 0) else 0
    inpVectors = np.random.randn(numInputs, matrixWidth).reshape((numInputs, matrixWidth)) + np.ones((numInputs, matrixWidth))
    return sparseMatrix, inpVectors

if __name__ == '__main__':
    file_sparse = "sparseM.txt"
    file_vector = "inpV.txt"
    matrixHeight = 64
    matrixWidth = 64
    numInputs = 80
    sparsityRate = 0.4  # approx 40% of the elements will be 0
    #
    spM, inpV = irregSparse()
    spM = np.matrix(spM)
    inpV = np.matrix(inpV)
    with open(file_sparse, 'w') as f0:
        for line in spM:
            np.savetxt(f0, line, delimiter= ", ", header= "{", footer= "},", fmt= "%0.4f", comments= '')
    with open(file_vector, 'w') as f1:
        for line in inpV:
            np.savetxt(f1, line, delimiter= ", ", header= "{", footer= "},", fmt= "%0.4f", comments= '')
    
    csrM = csr_matrix(spM)
    print(csrM.indices)
    print(csrM.indptr)
    

    
    
