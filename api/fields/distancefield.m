function field = distancefield( map, layers, degree )
% Turns a map into a 3D volume of distances to the map values raised to the given degree.

    [height, width] = size(map);
    range = max(layers) - min(layers);
    values = permute(repmat((layers)', 1, width, height), [3 2 1]);
    
    distance = (values - map) / range;
    field = distance .^ degree;
end
