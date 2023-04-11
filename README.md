# DGS-analysis-and-BPP-analysis
degerate sequence analysis and base-pairing probability analysis


Fold is used to predict the lowest free energy structure and a set of suboptimal structures, i.e. low free energy structures, using a variety of constraints. Fold-smp is a parallel processing version for use on multi-core computers, built using OpenMP.
partition is used to calculate the partition function for a sequence, which can be used to predict base pair probabilities.
MaxExpect predicts the maximum expected accuracy structure, a structure that maximizes pair probabilities. The paiprobabilities are generated using a partition function calculation.
Both of these two command lines output CT file: A CT (Connectivity Table) file contains secondary structure information for a sequence. These files are saved with a CT extension. When entering a structure to calculate the free energy, the following format must be followed.
