function [ estimate ] = parabolicpredict( cost )
% Estimates best match values by numerically solving parabolas (2nd order polinomials) around winning slices.

    [width, height, range] = size(cost);
    [~, best] = min(cost, [], 3);

    after = min(best + 1, range);
    before = max(best - 1, 1);
    estimate = zeros(size(best));

    for x = 1:width
        for y = 1:height
            section = before(x,y):after(x,y);

            if length(section) < 3
              estimate(x,y) = best(x,y);
            else
              values = cost(x,y, section);
              m = (values(3) - values(1)) / 2;
              estimate(x,y) = section(2) - m / (values(1) - values(2) + m);
            end
        end
    end
end
