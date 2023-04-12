# DGS-analysis-and-BPP-analysis
degerate sequence analysis and base-pairing probability analysis

To use the RNAstructure software for degerate sequence analysis and base-pairing probability analysis, you can use the following command lines:

Fold: predicts the lowest free energy structure and suboptimal structures using various constraints. To use Fold on a multi-core computer, you can use Fold-smp, which is built using OpenMP.

Partition: calculates the partition function for a sequence, which can be used to predict base pair probabilities.

MaxExpect: predicts the maximum expected accuracy structure that maximizes pair probabilities. MaxExpect generates pair probabilities using a partition function calculation.

Both Fold and MaxExpect output CT files, which contain secondary structure information for a sequence. CT files are saved with a CT extension. When entering a structure to calculate free energy, be sure to follow the proper formatting.
