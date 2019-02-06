function out = viterbi_decoder( in )
    load('viterbi_conf.mat');%,'conf_size');
    k = size(conf,2) -1; % k = length memory
    parent = zeros(1, 2 ^ k);
    Size = (k)*5;
    PM = zeros( 2^k, Size);
    out = zeros(1,length(in));
    if length(in) > Size
        for j = ( 1 : Size-1 ) 
            current = Inf*ones(1, 2^k);
            for i = 1:2^k 
                stat = encoder(i-1,k); 
                for x = [0 1]

                    [y,mem] = viterbi_terlis(x, stat);
                    BM = sum(y ~= in(:,j) );

                    temp = parent(i) + BM;
                    next = decoder(mem)+1;
                    if temp < current(next)
                        PM(next,j) = i;
                        current(next) = temp;
                    end
                end
            end
            parent = current;
        end

        for offset = 1:(length(in)-Size)
            current = Inf*ones(1, 2^k);

            for i = 1:2^k 
                stat = encoder(i-1,k); 
                for x = [0 1]

                    [y,mem] = viterbi_terlis(x, stat);
                    BM = sum(y ~= in(:,j+offset) );

                    temp = parent(i) + BM;
                    next = decoder(mem)+1;
                    if temp < current(next)
                        PM(next,Size) = i;
                        current(next) = temp;
                    end
                end
            end
            parent = current;


            Min = find_min(current);

            for i = (Size):-1:1
                path = PM(:,i);
                temp = encoder(Min-1,k);
                out(offset) = temp(1);
                Min = path(Min);
            end
            PM(:,1) = [];
            PM = [PM , zeros( 2^k , 1) ];
        end        
    end
    for offset = (length(in)-Size+1):length(in)
        current = Inf*ones(1, 2^k);
        
        for i = 1:2^k 
            stat = encoder(i-1,k); 
            for x = [0 1]

                [y,mem] = viterbi_terlis(x, stat);
                BM = sum(y ~= in(:,offset) );

                temp = parent(i) + BM;
                next = decoder(mem)+1;
                if temp < current(next)
                    PM(next,offset) = i;
                    current(next) = temp;
                end
            end
        end
        parent = current;

    end           
    Min = find_min(current);

    for i = 0:(Size)-1
        path = PM(:, offset - i);
        temp = encoder(Min-1,k);
        out(offset-i) = temp(1);
        Min = path(Min);
    end
    
end