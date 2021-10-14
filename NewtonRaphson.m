%% Settings
clear all
close all
clc
format short

%% Newton Raphson Method: My try
% Symbolic Representation
syms x % Independent Variable

% Functionn Definition
f(x) = x^4 - 3*x^3 + x^2 - 2*x + 2;
% First Derivative of Function
fprime = diff(f);

% Initial Guess
x0 = -50;

% Maximun Number of Iterations
num = 100;

% Solution Array
soln = NaN(num,1);

% The first element of the solution array is the initial guess
soln(1) = x0;

% Function Array
func(1) = subs(f,x0);

% Required Tolerance
tol = 0.000001;

% Number of iterations used by algorithm
count = 0;

% Looping over the iterations
for iter = 1:num-1
    
    % Newton Raphson Algorithm
    soln(iter + 1) = soln(iter) - (subs(f,soln(iter)))/(subs(fprime,soln(iter)));
    % Computing the function for the iterated values
    func(iter + 1) = subs(f,soln(iter + 1));
    
    % If required tolerance is achieved, the algorithm is terminated
    if abs(soln(iter + 1) - soln(iter)) <= tol
        break; % terminate the for loop once the required tolerance is achieved
    end
    count = iter;
end

% Plotting Results
% Iterated Independent Variables
figure
hold on
plot(soln,'-*','linewidth',2)
grid on
xlabel('Number of Iterations')
ylabel('Iterated Root')

% Function Values for the iterated variables
figure
hold on
plot(func,'-*','linewidth',2)
grid on
xlabel('Number of Iterations')
ylabel('Function Value')

% Actual Roots of the given polynomial
disp(strcat('Actual Roots of the polynomial are:',num2str(roots([1,-3,1,-2,2]))))

disp(strcat('The number of iterations used by the algorithm are:',num2str(count)));



