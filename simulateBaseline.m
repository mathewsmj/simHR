%Simulates a baseline from known mean, stdDev and maximum value
function baseline = simulateBaseline(timeLength, meanBaseline, stdDevBaseline, baselineMax) %length in ms
baseline = ones(timeLength,1).*meanBaseline + (rand(timeLength,1)-0.5).*baselineMax ...
    + stdDevBaseline;

end