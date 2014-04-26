function [ xwhitened, mu, whitener ] = Preprocess( x )
%Preprocesses sound mixtures
% Centers and whitens the mixtures
% x: nxk vector, n is the number of mixtures, k is the number of samples
% Returns x: preprocessed data; mu: data means

% Center
mu = mean(x, 2);
xcenter = x - repmat(mu, 1, length(x));

% Covariance
sigma = cov(xcenter');
[V, D] = eig(sigma);

% Whiten
%xwhitened = V * sqrt(D) * V' * xcenter;
whitener = V * diag(diag(D).^(-0.5)) * V';
xwhitened =  whitener * xcenter;
end

