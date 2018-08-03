% Question 6 (b)

% Set up vectors to record information for different values of m
m = 500;
n_vals = [10:10:50];
times_qr = zeros(size(n_vals));
times_ch = zeros(size(n_vals));

% Investigate for multiple values of n
for i = 1:length(n_vals)
    n = n_vals(i);
    
    % Set up the overdetermined system of equations
    A = [ones(m,1), eye(m,n)];
    b = [1:1:m]';
    
    % Repeat 100 times 
    num_times = 1;
    time_qr = 0
    time_ch = 0
    for t = 1:num_times
        % Determine information when using your qr_factors
        tstart_qr = tic;
        [Q,R] = qr_factors(A);
        x_qr = R \ (Q'*b);
        time_qr = time_qr + toc(tstart_qr);
        
        % Determine information when using Matlab's chol function 
        tstart_ch = tic;
        L = chol(A'*A, 'lower');
        y = L\A'*b;
        x_ch = L'\y;
        time_ch = time_ch + toc(tstart_ch);
    end;
    % Tabulate the information
    times_qr(i) = (time_qr / num_times);
    times_ch(i) = (time_ch / num_times);
    disp([num2str(n) ' ' num2str(times_qr(i)) ' ' num2str(times_ch(i))])
end;
% Plot the data as well 
plot(n_vals, times_qr, '*-.', n_vals, times_ch, 'x--')
xlabel('N')

    
      