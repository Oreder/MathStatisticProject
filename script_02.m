% Problem 18
X = [3.38,1.21,1.85,2.24,4.17,2.99,4.81,2.71,2.70,4.41,3.21,3.15,2.77,...
     4.05,3.89,1.56,2.78,2.04,2.82,3.28,2.63,1.89,3.57,3.15,3.80,5.40,...
     3.25,2.04,2.61,5.06,2.87,2.66,4.80,3.86,0.09,2.45,2.40,2.14,1.69,...
     2.36,5.44,2.77,1.94,2.55,3.97,1.88,3.01,4.21,4.74,2.02,2.38,2.46,...
     3.51,2.89,1.57,3.53,0.77,3.31,3.58,2.77,3.61,3.71,2.38,3.06,4.29,...
     4.76,1.69,1.59,3.21,2.74,3.99,3.53,3.52,2.84,1.21,2.82,4.34,3.65,...
     2.22,2.87,3.14,3.58,1.96,3.41,3.85,1.96,3.02,4.22,3.10,2.68,3.67,...
     1.70,5.47,5.02,2.52,3.09,2.19,4.44,2.33,2.27,3.34,3.05,4.35,3.58,...
     3.43,4.49,3.57,3.20,1.53,3.53,3.53,1.27,3.40,4.53,2.21,3.28,3.50,...
     2.01,3.30,1.86];
   

% Solution
gamma = 0.9;
alpha = (1 - gamma)/2;
N = 1:length(X);
 
MX = mean(X);
DX = var(X);

M = [];
D = [];
for i = N
    M(i) = mean(X(1:i));
    D(i) = var(X(1:i));
end;

% Part A
ML = M - sqrt(D./N).*tinv(1 - alpha, N - 1);
MH = M + sqrt(D./N).*tinv(1 - alpha, N - 1);

% Part B
DL = D.*(N - 1)./chi2inv(1 - alpha, N - 1);
DH = D.*(N - 1)./chi2inv(alpha, N - 1);

fprintf('Mean(X)  : %.5f\n', MX);
fprintf('Low bound(MX): %.5f\nHigh bound(MX): %.5f\n', ML(end), MH(end));

fprintf('\nVariance(X): %.5f\n', DX); 
fprintf('Low bound(DX): %.5f\nHigh bound(DX): %.5f\n', DL(end), DH(end));

N = 10:length(X);
M = M(N);
ML = ML(N);
MH = MH(N);
D = D(N);
DL = DL(N);
DH = DH(N);

figure
plot([N(1),N(end)], [MX, MX], 'r');  % draw line y = MX
hold on;
plot(N, M, 'b');    % mean
plot(N, ML, 'g');   % low bound of mean
plot(N, MH, 'k');   % high bound of mean
hold off;


figure
plot([N(1), N(end)], [DX, DX], 'r');    % draw line y = DX
hold on;
plot(N, D, 'b');     % variance
plot(N, DL, 'g');    % low bound of variance 
plot(N, DH, 'k');    % high bound of variance
hold off;
