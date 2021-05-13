function cost = graphcutsprior( cost, color )
% Uses graph cuts to correct glaring artifacts in the cost volume.

  labels = double(GraphCuts(cost, color, struct('data', 2, 'smooth', 1, 'neigh', 0.009)));
  prior = distancefield(labels, 1:size(cost, 3), 2);
  weight = abs(labels - parabolicpredict(cost));

  cost = cost + weight .* prior;
end