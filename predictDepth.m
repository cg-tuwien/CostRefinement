function depth = predictDepth( cost, color )
% Runs our refinement pipeline and then uses parabolic prediction to estimate depth.
%   cost: 3D cost volume matrix
%   color: 2D color image, usually the center view of the light field

  cost = refineCost(cost, color);
  depth = parabolicPredict(cost);
end
