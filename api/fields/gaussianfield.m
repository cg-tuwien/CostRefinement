function field = gaussianfield( map, layers, sigma )
% Turns a map into a 3D volume of inverted gaussian curves centered around the map values.

    sigma = ones(size(map(:))) * sigma;
    dimentions = [size(map) length(layers)];
    norms = reshape(normpdf(layers, map(:), sigma), dimentions);
    field = bsxfun(@minus, max(norms, [], 3), norms);
end

