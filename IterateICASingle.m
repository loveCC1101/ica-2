function [ out ] = IterateICASingle( w, x )
%Performs one iteration of ICA
% W: Weighting vector (nx1); x: data (nxk)

[n, k] = size(x);

p = w'*x;
gp = g(p);
out = x * gp' / k;
%size(out)
g2 = mean(gdot(p), 2) * w;
out = out - g2;

% Normalize
out = out / norm(out);
end

