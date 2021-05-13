function cost = smoothnessprior( cost, sigma, lambda )
% Iteratively enforces smoothness on a cost volume.

    prediction = parabolicpredict(cost);
    confidence = peakconfidence(cost);
    change = size(cost, 3);

    kernel = ones(5,5);
    kernel(3,3) = 0;

    for i = 1:10
        weights = gaussianfield(prediction, 1:size(cost, 3), sigma) .* confidence;
        prior = imfilter(weights, kernel) * lambda;

        newprediction = parabolicpredict(cost + prior);
        newchange = mean(mean(abs(prediction - newprediction)));
        prediction = newprediction;

        if newchange / change < 0.5
           change = newchange;
        else
          break;
        end
    end
    
    cost = cost + prior;
end
