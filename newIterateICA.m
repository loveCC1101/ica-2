function [ out ] = newIterateICA( W, x )
%Performs one iteration of ICA
% W: Weighting matrix (nxn); x: data (nxk)

[n, k] = size(x);

p = W*x;
gp = g(p);
out = mean(x * gp', 2);

g2 = mean(gdot(p), 2) * W;
out = out - g2;

% Normalize
out = out / norm(out);


% Decorrelate
out = sqrtm(out * out') \ out;
end





NO WAIT THIS IS WRONG
