% EE553 HW03 noise Cancel
% ref: Example 7.2.6 in p.350 of the textbook.

% initialize
N = 5e2; % data length

% following the give equation in the Homework
v1 = zeros(N,1);
v2 = zeros(N,1);

% correlated noise process: Equations (1) and (2)
for i=1:N-1
    w=randn;
    v1(i+1) = 0.9*v1(i) + w;
    v2(i+1) = -0.5*v2(i) + w;
end

% make d(n) and x(n)
n=1:N;
d = sin(0.05*pi*n).';
x = d + v1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% modification with the noise in observation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v2 = v2 + 0.2*randn(size(v2));

K = N-1;
r_v2 = zeros(K+1,1);
r_xv2 = zeros(K+1,1);
for k=0:K
    sum_v2 = 0;
    sum_xv2 = 0;
    for n=0:N-k-1
        sum_v2 = sum_v2 + v2(n+k+1)*v2(n+1);
        sum_xv2 = sum_xv2 + x(n+k+1)*v2(n+1);
    end
    r_v2(k+1) = sum_v2/(N-k);
    r_xv2(k+1) = sum_xv2/(N-k);
end

% derive correlation matrix
R_v2 = zeros(K+1,K+1);
% R_xv2 = zeros(K,K);
for i=1:K+1
    for j=1:K+1
        R_v2(i,j) =r_v2(abs(j-i)+1);
    end
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Changing the order of filter p, see MSE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P = N-1;
mse_list = zeros(P,1);

% plot setting


for p=1:P
    h = R_v2(1:p,1:p)\r_xv2(1:p);

    % Form estimate d_hat(n) = x(n) - y(n)
    y = conv(h,v2);
    y = y(1:N); % resize
    d_hat = x-y;

    % error
    e = d-d_hat;
    mse = mean(e.^2);
    mse_list(p) = mse;
    
end

% % estimation of d(n): d_hat when p=40
% figure(3); clf; hold on;
% xlabel('$p$','Interpreter','Latex');
% ylabel('sum of squares ','Interpreter','Latex');
% grid on;
% %     axis([0 200 -10 10]);
% ylim([-10 10])
% set(gca,'fontsize',14);
% plot(n-1,d_hat,'r','LineWidth',1);
% plot(n-1,d,'b--','LineWidth',2);
% text(100,8,strcat('\textit{mse=}',num2str(mse)),...
%     'HorizontalAlignment','center','Interpreter','Latex','FontSize',14)


% plot: MSE w.r.p. p (the order of filter=the number of taps)
figure(4); clf; 
plot(mse_list,'r','LineWidth',2);
xlabel('$p$','Interpreter','Latex');
ylabel('mean-sqaured error','Interpreter','Latex');
grid on;
xlim([0 40])
% axis([0 200 -10 10]);
set(gca,'fontsize',14);

% plot: same MSE, but with whole range of p
figure(5); clf; 
plot(mse_list,'r','LineWidth',2);
xlabel('$p$','Interpreter','Latex');
ylabel('mean-sqaured error','Interpreter','Latex');
grid on;
ylim([0 10])
set(gca,'fontsize',14);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure save
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
print(4,'mse_obs_noise','-djpeg')