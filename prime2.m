%% Prime
% Created 11-18-18
% By Scott Murakami
% This user-defined function will determine all prime numbers between m and
% n (defined by user) with the function pr = prime(m,n), where the input
% arguments are positive integers and the output argument, pr, is a vector
% with prime numbers. 

function pr = prime(m,n)
    x=1;
    y=abs(n);
    h=0;
    
    a=sign(n);
    b=sign(m);
    if a == -1
        error('The input argument must be a positive integer')
        return
    end
    
    if b == -1
        error('The input argument must be a positive integer.')
        return
    end
    
    c = rem(n,floor(n));
    d = rem(m,floor(m));
    if c ~= 0
        error('The input argument must be a positive integer.')
        return
    end
    
    if d ~= 0
        error('The input argument must be a positive integer.')
        return
    end
    
    % n > m ?
    if n < m
        error('The value of n must be larger than the value of m.')
        return
    end
    
    %prime between m and n
    for k = m : y 
        i = 0;
        for t = 2 : k/2
            j = k/t;
            a = j-floor(j);
            if a == 0
                i = 1;
            end
        end
        if (i == 0)
            pr(x) = k;
            x = x + 1;
            h=h+1;
        end
    end
    fprintf('Number of prime numbers between m and n: %f\n', h)
end

