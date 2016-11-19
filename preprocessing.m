%Reading data

clear;

[mix1,Fs1] = audioread('mix1.wav');
[mix2,Fs2] = audioread('mix2.wav');
data = [mix1 mix2];
n = length(data);

%Centering data and computing covariance
data_cent = bsxfun(@minus, data,mean(data,1));
covmatrix = (data_cent'*data_cent)/(n-1);

%Pca on centering data
[coeff,score,latent,tsquared,explained,mu] = pca(data_cent);

%Whitening the data
[E,D] = eig(covmatrix);
D = inv(D);
D = sqrt(D);
whitening_matrix = E*D*E;
whitened_data = whitening_matrix*data_cent';
whitened_data = whitened_data';