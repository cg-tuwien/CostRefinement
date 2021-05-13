function [ estimate ] = greedypredict( cost )
% Estimates best match values with winner slice take all approach.

    [~, estimate] = min(cost,[],3);
end

