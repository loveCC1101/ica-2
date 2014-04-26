[x, mu, whitener] = Preprocess(x);

w1 = [-0.5; 0.3];
w2 = [0.2; -0.8];
w1 = w1 / norm(w1);
w2 = w2 / norm(w2);

for ii = 1:50
    w1 = IterateICASingle(w1, x);
    w2 = IterateICASingle(w2, x);
    W = [w1, w2]';
%    W = sqrtm(W * W') \ W;
    [V, D] = eig(W*W');
    W = (V / sqrt(D)) * V' * W;
    Wt = W';
    w1 = Wt(:,1);
    w2 = Wt(:,2);
 %   w1 = w1 / norm(w1);
 %   w2 = w2 / norm(w2);    
end

Wfinal = W * whitener;
rownorm = sqrt(sum(Wfinal .^ 2, 2));
Wfinal = Wfinal ./ repmat(rownorm, 1, 2); % may need to play with signs
rownorm = sqrt(sum(inv(A) .^ 2, 2));
actual = inv(A) ./ repmat(rownorm, 1, 2);
score = norm(Wfinal + actual); 