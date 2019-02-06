function yy = add_noise(out,snr)
    y2 = randn(size(out,1),size(out,2)) ./exp(snr/10);
    yy = out.*2 -1;
    yy = ((y2 + yy) > 0);
end