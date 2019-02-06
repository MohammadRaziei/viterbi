close all
dig = 5;
figure
semilogy(snr,N_BER,'o')
hold on
semilogy(snr,polyval(polyfit(snr,N_BER, dig),snr),'DisplayName',"curve fitting with n = " +string(dig));
title("for viterbi algorithm")
% ylim([0 0.55]);
xlim([-3 4.8]);
xlabel("snr");
ylabel({"(BER)","Bit Error Rate"});
