function [ y ] = gdot( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%y = 1 - (tanh(x) .^ 2);
y = sech(x).^2;

%y = tanh(x);

end

