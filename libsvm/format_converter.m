% This is to convert .mat file to libsvm required file
% Depend on mat2libsvm.m
% input: ckd_train.mat, ckd_test.mat
% output: ckd_test.mat, ckd_train.txt

clear;
clc;

% load files
load('ckd_train.mat');
load('ckd_test.mat');

% convert using mat2libsvm
mat2libsvm(ckd_test(:,25),ckd_test(:,1:24),'ckd_test.txt');
mat2libsvm(ckd_train(:,25),ckd_train(:,1:24),'ckd_train.txt');