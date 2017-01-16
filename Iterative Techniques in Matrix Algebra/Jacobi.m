function x = Jacobi(A, b, x0, TOL, N)
% The Jacobi iterative method to solve Ax = b, given an initial approximation x(0) 
% Algorithm taken from: 
% Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage Learning, p459
% Created: September 2015

    n = size(A,1);
    
    for k = 1:N
        
        for i = 1:n
            
          s = 0;  
          for j = 1:i-1
              s = s + A(i,j)*x0(j); 
          end
          
          for j = i+1:n
              s = s + A(i,j)*x0(j);
          end
          
          x(i,1) = (b(i) - s)/A(i,i);
       
        end

        if norm(x0 - x)/norm(x0) < TOL
            fprintf('Answer successfully calculated.\n');
            fprintf('Jacobi Method completed.\n');
            return;
        end

        fprintf('Iteration %d: ',k);
        x
        x0 = x; % swap
       
    end
    
    fprintf('Max number of iterations exceeded.\n');

end

