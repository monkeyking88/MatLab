function [ Q, R ] = qr_factors( A )

row = size(A,1);
n = size(A,2);

Q = zeros(row,n);
R = zeros(n,n);
sum = zeros(row,1);

for m = 1:n
    if m == 1
        am = A(:,m);
        rmm = norm (am);
        qm = am/rmm;
        Q(:,m) = qm;
        R(m,m) = rmm;
        for k = 2: n,
            R(1,k) = (qm') * A(:,k);
        end
    elseif  m == 2
        am = A(:,m) - Q(:,1)*R(1,2);
        rmm = norm(am);
        qm = am/rmm;
        Q(:,m) = qm;
        R(m,m) = rmm;
        for k = 3:n,
            R(2,k) = (qm')* A(:,k);
        end
    else
        for j = 1: m-1,
            sum = sum+R(j,m)*Q(:,j);
        am = A(:,m) - sum
        rmm = norm (am);
        qm = am/rmm;
        Q(:,m) = qm;
        R(m,m) = rmm;
        for k = m+1:n,
            R(m,k)= (qm')*A(:,k);
        end
    end
end         
end
