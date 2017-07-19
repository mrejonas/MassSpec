library(MALDIquant)
library(MALDIquantForeign)
spectra <- importBrukerFlex(path = "/home/mario/Research/Collaborations/SueretaFortuin/MALDIData/")
# Variance Stabilization
spectra <-transformIntensity(spectra, method ="sqrt")
# Spectra Smoothing
spectra <- smoothIntensity(spectra, method="SavitzkyGolay",halfWindowSize=10)
# Baseline Correction
spectra <- removeBaseline(spectra, method="SNIP",iterations=100)
# Intensity Calibration/ Normalization
spectra <- calibrateIntensity(spectra, method="TIC")
# Recalibration of mass values/ Warping/ Alignment (SNR was chosen to be either 4 or 6)
spectra <- alignSpectra(spectra, halfWindowSize = 20, SNR = 4, tolerance = 0.002, warpingMethod = "lowess")
# Ensure all spectra have the same mass range
spectra <- trim(spectra)
# Peak detection (SNR was chosen to be either 4 or 6)
peaks <- detectPeaks(spectra, method="SuperSmoother", halfWindowSize=20, SNR=4)
# Peak Binning
peaks <- binPeaks(peaks, tolerance = 0.002)
# Create a Feature Matrix
feature_matrix <- intensityMatrix(peaks, spectra)
