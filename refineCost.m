function cost = refineCost( cost, color )
% Performs cost volume refinement using our artifact removal and local smoothness methods.
%   cost: 3D cost volume matrix
%   color: 2D color image, usually the center view of the light field

  cost = graphcutsprior(cost, color);
  cost = smoothnessprior(cost, 2, 5);
end
