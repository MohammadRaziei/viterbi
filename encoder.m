function out = encoder(x,k)
    x = mod(x, 2^k);
    out = zeros(1,k);
    for i = k:-1:1
        out(i) = mod( x , 2 );
        x = floor(x / 2);
    end
end