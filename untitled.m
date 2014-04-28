if size(x, 1) ~= 2
    error('more than 2 sources. were you going to transpose that?');
    % if this goes in the wrong way, it can kill matlab!
end

%tau = 1/(2 * pi * 5);
%a = (1 / (1 + fs*tau));

%x = filter(a, [1 a-1], x);

%xunprocessed = x;
%[
%x = filt



[x, mu, whitener] = Preprocess(x);

w1 = [2; -1];
w2 = [-1; 2];


%w1 = [-0.5; 0.3];
%w2 = [0.2; -0.8];
w1 = w1 / norm(w1);
w2 = w2 / norm(w2);

W0 = zeros(2, 2); %different from 
W = [w1, w2]';
% TODO: change to convergence loop

%for ii = 1:10
its = 0;
while norm(eye(2, 2) - abs(W' * W0)) > 0.001
    w1 = IterateICASingle(w1, x);
    w2 = IterateICASingle(w2, x);
    W0 = W;
    W = [w1, w2]';
%    W = sqrtm(W * W') \ W;
    [V, D] = eig(W*W');
    W = (V / sqrt(D)) * V' * W;
    Wt = W';
    w1 = Wt(:,1);
    w2 = Wt(:,2);
    its = its + 1;
 %   w1 = w1 / norm(w1);
 %   w2 = w2 / norm(w2);    
end
% 
% Wfinal = W * whitener;
% rownorm = sqrt(sum(Wfinal .^ 2, 2));
% Wfinal = Wfinal ./ repmat(rownorm, 1, 2); % may need to play with signs
% rownorm = sqrt(sum(inv(A) .^ 2, 2));
% actual = inv(A) ./ repmat(rownorm, 1, 2);
% score = norm(Wfinal + actual); 

thing = abs(W * whitener * A);
thing = thing / norm(thing);


score = min(norm(eye(2, 2) - thing), norm(eye(2, 2) - flipud(thing)));