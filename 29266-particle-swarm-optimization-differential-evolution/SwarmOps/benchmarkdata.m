% ------------------------------------------------------
% SwarmOps - Heuristic optimization for Matlab
% Copyright (C) 2003-2010 Magnus Erik Hvass Pedersen.
% Please see the file license.txt for license details.
% SwarmOps on the internet: http://www.Hvass-Labs.org/
% ------------------------------------------------------

% Create data-struct for a benchmark problem.
% Parameters:
%     dim; the dimensionality of the search-space, e.g. 10.
%     acceptableFitness; stop optimization if this fitness is
%                        achieved.
%     maxEvaluations; the maximum number of fitness evaluations
%                     to perform in optimization.
%     lowerInit; initialization lower-boundary.
%     upperInit; initialization upper-boundary.
%     lowerBound; search-space lower-boundary.
%     upperBound; search-space upper-boundary.
% Returns:
%     data; the data-struct.
function data = benchmarkdata(dim, ...
                              acceptableFitness, ...
                              maxEvaluations, ...
                              lowerInit, upperInit, ...
                              lowerBound, upperBound)
    data = struct( ...
            'Dim', dim, ...
            'AcceptableFitness', acceptableFitness, ...
            'MaxEvaluations', maxEvaluations, ...
            'LowerInit', lowerInit*ones(1, dim), ...
            'UpperInit', upperInit*ones(1, dim), ...
            'LowerBound', lowerBound*ones(1, dim), ...
            'UpperBound', upperBound*ones(1, dim));
end

% ------------------------------------------------------
