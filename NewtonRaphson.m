%% Settings
clear all
close all
clc
format short

%% Segregating initial guesses based on the root which is reached
% Domain of interest: (0.7783 , 2.807)

% Sample array of initial guesses
init_arr = linspace(0.7783,2.807,50);

% Newton Raphson Algorithm is applied for each of the initial guess in the
% array

% Symbolic Representation
syms x % Independent Variable

% Function Definition
f(x) = x^4 - 3*x^3 + x^2 - 2*x + 2;
% First Derivative of Function
fprime = diff(f);

% Maximun Number of Iterations
num = 20;

% Solution Array
% soln = NaN(length(init_arr),num);

for ii = 1:length(init_arr)
   
    % Initial Guess
    x0 = init_arr(ii);
    
    % The first element of the solution array is the initial guess
    soln(ii,1) = x0;

    % Function Array
    func(ii,1) = subs(f,x0);
    
    % Looping over the iterations
    for iter = 1:num-1
        
        % Newton Raphson Algorithm
        soln(ii,iter + 1) = soln(ii,iter) - (subs(f,soln(ii,iter)))/(subs(fprime,soln(ii,iter)));
        % Computing the function for the iterated values
        func(ii,iter + 1) = subs(f,soln(ii,iter + 1));
    
        % Final Converged Root
        convRoot(ii) = soln(ii,end);
        
    end
end

% Plotting results
figure
plot(init_arr,convRoot,'*')
grid on
xlabel('Initial Guesses in Domain of Interest')
ylabel('Converged Roots')
    






