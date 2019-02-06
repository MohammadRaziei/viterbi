function out = decoder(x)
    out = (2.^(length(x)-1:-1:0)) * x';   
end