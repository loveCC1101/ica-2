function [ out ] = IterateICA( W, x )
%Performs one iteration of ICA
% W: Weighting matrix (nxn); x: data (nxk)

[n, k] = size(x);

p = W*x;
gp = g(p);
out = zeros(n);
for ii = 1:n
    tmp = x *gp(ii,:)' / k;
    out(ii,:) = tmp';
end

g2 = W .* repmat(mean(gdot(p), 2), 1, n);
out = out - g2;

% Normalize
out = out / repmat(sqrt(sum(out .* out, 2)), 1, n);

% Decorrelate
out = sqrt(out * out') \ out;
end

