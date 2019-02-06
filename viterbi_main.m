clear 
clc
close all
%% generate random bits
len = 500;
bits = randi([0 1], 1, len);

%% viterbi encoder with 6 bits  memory
% -> note : To change config use this and delete 'viterbi_conf.mat'
memory = viterbi_config([1,1,1,1,0,0,1;1,0,1,1,0,1,1]);

% if initial state = random
initial_state = randi([0,2^memory-1]);
out = viterbi_encoder(bits, initial_state);

%% viterbi decoder -> noise = 0
% rec = viterbi_decoder( out );

%% check : dismatch -> noise = 0
% BER = viterbi_ber(bits,rec);   

%% add noise 
SNR = 10;
n_out = add_noise(out,SNR);
n_rec = viterbi_decoder( n_out );

n_BER = viterbi_ber( bits,n_rec );
