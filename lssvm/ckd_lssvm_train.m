% ckd_lssvm_predict.m
% input: ckd_train.mat, ckd_test.mat
% output: XXXXX.mat

clear;
clc;

load('ckd_train.mat');
load('ckd_test.mat');

% separate label
X = ckd_train(:, 1:24);
Y = ckd_train(:, 25); 
Xt = ckd_test(:, 1:24);
Yr = ckd_test(:, 25);

% train using lssvm toolbox
type = 'classifier';
% choose in {'lin_kernel','poly_kernel','RBF_kernel'}
kernel = 'RBF_kernel';
[yp,alpha,b,gam,sig2] = lssvm(X,Y,type,kernel);
% spacial setting for sig2 at the situation of lin_kernel
if strcmp(kernel, 'lin_kernel') == 1
    sig2 = 0.01;
end    
% predict and get the result in Yt, i.e. "Y test".
Yt = simlssvm({X,Y,type,gam,sig2}, {alpha,b}, Xt);

% verify the result
fprintf('Correctness: %d\n', size(find((Yt - Yr) == 0), 1) / size(Yr, 1));

% find the wrong samples
wrong = find((Yt - Yr) ~= 0);
wrong'
% find((Yt - Yr) == -1)