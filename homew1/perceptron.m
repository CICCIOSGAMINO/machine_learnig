function [w, count] = perceptron(X,Y,w_init)
  w = w_init;
  count = 0;
  for iteration = 1 : 100          % set a iteation limit
    for ii = 1 :  size(X,2)          % cycle through training set
      if (sign(w'*X(:,ii)) != Y(ii))
        w = w + X(:,ii) * Y(ii);
      endif
      ++count;
    endfor
  endfor
    sum(sign(w'*X)!= Y)/size(X,2)     % show missclassification rate
endfunction
