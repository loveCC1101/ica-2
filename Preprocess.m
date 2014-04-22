function [ x, mu ] = Preprocess( x )
%Preprocesses sound mixtures
% Centers and whitens the mixtures
% x: nxk vector, n is the number of mixtures, k is the number of samples
% Returns x: preprocessed data; mu: data means

% Center
mu = mean(x, 2);
x = x - repmat(mu, 1, length(x));

% Covariance
sigma = cov(x');
[V D] = eig(sigma);

% Whiten
x = V * sqrt(D) * V' * x;

end

