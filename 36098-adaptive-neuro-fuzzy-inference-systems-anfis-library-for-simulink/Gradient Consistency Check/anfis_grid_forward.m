% ANFIS Feed-Forward operation.
function y = anfis_grid_forward(x,mean,sigma,b,ThetaL4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        								 							     				                                       %
%   			                 	NETWORK FUNCTIONALITY SECTION					   %
%      																					                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[NumInVars NumInTerms] = size(mean);

NumRules = NumInTerms^NumInVars;  

% LAYER 1 - INPUT TERM NODES

  In2 = x*ones(1,NumInTerms);
 
 Out1 = 1./(1 + (abs((In2-mean)./sigma)).^(2*b));

% LAYER 2 - PRODUCT NODES
    
 precond = comb(Out1);  
 Out2 = prod(precond,2);
 S_2 = sum(Out2);
 
% LAYER 3 - NORMALIZATION NODES
 Out3 = Out2'./S_2;
    
% LAYERSS 4 - 5: CONSEQUENT NODES - SUMMING NODE

 Aux1 = [x; 1]*Out3;

 a = reshape(Aux1,(NumInVars+1)*NumRules,1);  % New Input Training Data shaped as a column vector.

 y = a'*ThetaL4; 