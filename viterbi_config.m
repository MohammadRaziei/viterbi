function memory = viterbi_config(conf)
    save('viterbi_conf.mat','conf');
    memory = length(conf) - 1;
end