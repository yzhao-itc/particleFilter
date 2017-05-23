function [ p ] = MeasureProb( X, Y )
%measurement probability/posterior
%   Detailed explanation goes here
global R;
[~,ypred] = Measurement(X);
p = exp(-(Y - ypred).'*pinv(R.^2)*(Y - ypred)/2);
if p < 1e-9
    p = 1e-9;
end

end

