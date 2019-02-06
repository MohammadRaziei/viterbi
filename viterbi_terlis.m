function [out , q] = viterbi_terlis ( x , q )
    load('viterbi_conf.mat');
    q = [ x q ];
    out = conf * q';
    out = mod(out , 2);
    q(end) = [];
end