function [ p ] = MeasureProb( X, Y )
%measurement probability/posterior
%   Detailed explanation goes here
global R2;
[~,ypred] = Measurement(X);
p = exp(-(Y - ypred).'*pinv(R2.^2)*(Y - ypred)/2);
if p < 1e-9
    p = 1e-9;
end

end

