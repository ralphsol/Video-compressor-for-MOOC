load fisheriris
N = size(meas,1);

% Run multiple classifiers and then pick the most accurate one
% Naive Bayes classifier
% nbGau = train_sc(meas(:,1:2), species);
list = [ones(50,1); 2*ones(50,1); 3*ones(50,1);];
nbGau = train_sc(meas(:,1:2), list, 'NBC');

R = test_sc(nbGau, meas(:,1:2), 'QDA', list);
disp(R.ACC);

rng(0,'twister');
cp = cvpartition(species,'KFold',10);
% nbGauCV = crossval(nbGau, 'CVPartition',cp);
% nbGauCVErr = kfoldLoss(nbGauCV);

load_fisheriris;    %builtin iris dataset      
C = species;
K = 5; NG = [1:length(C)]'*K/length(C);
[R,CC] = xval(meas,{C,[],NG},'NBC');
disp(R.ERR);