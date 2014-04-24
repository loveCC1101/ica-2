[s1_orig, fs] = wavread('blink.wav');
[s2_orig, fs] = wavread('goldwatch.wav');

s1_orig = mean(s1_orig, 2);
s2_orig = mean(s2_orig, 2);

n = min(length(s1_orig), length(s2_orig));
s1_orig = s1_orig(1:n);
s2_orig = s2_orig(1:n);

% Mixing matrix:
A = [3.23 0.88; 0.91 1.44];

x = A * [s1_orig, s2_orig]';

