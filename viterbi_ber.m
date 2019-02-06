function out = viterbi_ber(tx,rx)
    load('viterbi_conf.mat');
    len = length(tx);
    if len > 6 * (size(conf,2)-1)
        k = len - 5 * (size(conf,2)-1);
    else 
        k = len;
    end
    out = sum( tx(1:k) ~= rx(1:k) )/k;
end
