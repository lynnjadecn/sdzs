% ckd_split.m
% input: ckd_preprocessed.mat
% output: ckd_train.mat, ckd_test.mat

clc;

load('ckd_preprocessed.mat');

% get row count
row_count = size(ckd_preprocessed, 1);

% get a rand permutation of rows
row_rank = randperm(row_count);

% the disordered data
ckd_disordered = ckd_preprocessed(row_rank, :);

% output the train set and test set
split_row = ceil(row_count*0.6);
ckd_train = ckd_disordered(1 : split_row, :);
ckd_test = ckd_disordered(split_row+1 : row_count, :); 
save('ckd_train.mat', 'ckd_train');
save('ckd_test.mat', 'ckd_test');
