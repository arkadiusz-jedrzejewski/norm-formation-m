function [transition_matrix] = get_tran_m_quenched(q, k, s, N0, N1)
% returns transition matrix for the quenched version of the model
% N0 - number of social learners
% N1 - number of individual learners

N = N0 + N1; % total number of agents

% initializing tranition matrix
transition_matrix = zeros((N0+1)*(N1+1),(N0+1)*(N1+1));

for i=1:N0+1
    for j=1:N1+1
        i_a = (i-1)*(N1+1)+j;   % index of the initial state
        a0 = (i-1)/N0;          % fraction of social learners with option A in the initial state
        a1 = (j-1)/N1;          % fraction of individual learners with option A in the initial state
        a = (i+j-2)/N;          % fraction of all learners with opinion A in the initial state

        tran_prob_0 = 1; % traisiton probability that the fractions of individual and social learners with option A remain unchanged
        
        if i>1
            l = i-1;                                            % number of social learners with option A decreases
            i_b = (l-1)*(N1+1)+j;                               % index of the new state
            tran_prob = N0/N*a0*(s/2+(1-s)*conform_fun(1-a,q)); % transition probability from state i_a to i_b
            transition_matrix(i_b,i_a) = tran_prob;             % insert trasntion probability to the transition matrix
            tran_prob_0 = tran_prob_0-tran_prob;                % update transition probability of staying in the same state
        end
        if i<N0+1
            l = i+1;                                                % number of social learners with option A increases
            i_b = (l-1)*(N1+1)+j;                                   % index of the new state
            tran_prob=N0/N*(1-a0)*(s/2+(1-s)*conform_fun(a, q));    % transition probability from state i_a to i_b
            transition_matrix(i_b,i_a) = tran_prob;                 % insert trasntion probability to the transition matrix
            tran_prob_0 = tran_prob_0-tran_prob;                    % update transition probability of staying in the same state
        end
        if j>1
            l = j-1;                                            % number of individual learners with option A decreases
            i_b = (i-1)*(N1+1)+l;                               % index of the new state
            tran_prob=N1/N*a1*(s/2+(1-s)*(1-indiv_fun(a,k)));   % transition probability from state i_a to i_b
            transition_matrix(i_b,i_a) = tran_prob;             % insert trasntion probability to the transition matrix
            tran_prob_0 = tran_prob_0-tran_prob;                % update transition probability of staying in the same state
        end
        if j<N1+1
            l = j+1;                                            % number of individual learners with option A increases
            i_b = (i-1)*(N1+1)+l;                               % index of the new state
            tran_prob=N1/N*(1-a1)*(s/2+(1-s)*indiv_fun(a,k));   % transition probability from state i_a to i_b
            transition_matrix(i_b,i_a) = tran_prob;             % insert trasntion probability to the transition matrix
            tran_prob_0 = tran_prob_0-tran_prob;                % update transition probability of staying in the same state
        end
        transition_matrix(i_a,i_a) = tran_prob_0;    % insert trasntion probability of staying in the same state to the transition matrix
    end
end
end


