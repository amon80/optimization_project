clear;

s1 = sin((1:1000)/20);
s2 = ((1:200)-100)/100;
s2 = [s2 s2 s2 s2 s2];
S = [s1; s2]';
clear s1 s2;
A = [0.291 -0.5439; 0.6557 0.5572];
X = S * A;
X = whiten(X, 0);
X = X';

%Sequantial Deflation
%First component
to_optimize = @(w) negentropy_single(w, X, []);
w = [1; 0];

%Other components
known_components = [0.8328; 0.5536];
to_optimize = @(w) negentropy_single(w, X, known_components);
w = [1;0];

%Final result
known_components = [0.8328 0.5536; 0.5536 -0.8328];

%Parallel deflation
to_optimize = @(W) negentropy_multy(W, X);
W = eye(2,2);

