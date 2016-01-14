function mat2libsvm(labels, traindata, outputfile)

[m,n] = size(traindata);
file = fopen(outputfile, 'w');

for i = 1:m
line = int2str(labels(i));
for j = 1:n
    line = [line ' ' int2str(j) ':' num2str(traindata(i, j))];
end
line = [line '\n'];
fprintf(file, line);
end

fclose(file);