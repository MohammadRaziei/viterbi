function y = find_min(x)
    y = find(min(x) == x);
    y = y(1);
end