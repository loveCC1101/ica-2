[s1_orig, fs] = wavread('blink.wav');
[s2_orig, fs] = wavread('goldwatch.wav');

s1_orig = mean(s1_orig, 2);
s2_orig = mean(s2_orig, 2);

n = min(length(s1_orig), length(s2_orig));



MM = 10;
NN = 20;
scores = zeros(1, MM);
%lens = zeros(1, NN);


figure
hold on

for iii = 1:NN
    
    len = floor(iii * n / NN);
    
    s1 = s1_orig(1:len);
    s2 = s2_orig(1:len);

    for jjj = 1:MM
        % Mixing matrix:
        alpha = rand(1);
        A = [alpha, 1 - alpha; 1 - alpha, alpha];
        x = A * [s1, s2]';

        untitled;

        %lens(iii) = len;
        scores(jjj) = score;

    end
    plot(len / fs, scores, 'xb'); 
    
end
% 
% plot(lens / fs, scores, 'x');
xlabel('Length (s)')
ylabel('Error Norm');
title('ICA Results')