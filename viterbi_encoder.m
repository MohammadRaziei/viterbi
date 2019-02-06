function out = viterbi_encoder (bits,state)
    load('viterbi_conf.mat');
    Size = size(conf);
    memory_encoder = encoder(state,Size(2)-1);
    out = zeros(Size(1), length(bits));
    for i = 1 : length(bits)
       [out(:,i), memory_encoder] = viterbi_terlis( bits(i) , memory_encoder );   
    end
end