% ckd_preprocess.m
% input: ckd_imported.mat
% output: ckd_preprocessed.mat

clc;

load('ckd_imported.mat');

% a default vector for preprocessing, which has 25 values
default_value = [32 80 1.020 3 3 1 1 0 0 100 225 0.8 150 4 13.5 45 6500 4.8 0 0 0 1 0 0 0];

% copy from input data
ckd_preprocessed = ckd_imported;

% loop in rows (persons)
for p = 1:400
%     loop in columns (features)
    for f = 1:25
        if isnan(ckd_preprocessed(p, f))
            ckd_preprocessed(p, f) = default_value(f);
        end
    end
end    

% save the output
save('ckd_preprocessed.mat', 'ckd_preprocessed'); 