%% Simulação do Pêndulo Simples Linearizado (Aula 03) 
% Funções utilizadas (veja documentação): 
%  -> close: fechar figuras abertas
%  -> tf: função para criar funções de transferência
%  -> figure: abrir (nova) figura
%  -> subplot: criar sub-gráficos em uma mesma figura
%  -> plot: traçar um gráfico 2D
%  -> xlabel: texto do eixo X (abscissa)
%  -> ylabel: texto do eixo Y (ordenada)
close all;
% Dados numéricos
m = 0.04; % massa do carro [kg]
b = 3; % Coeficiente de atrito viscoso com o ar [Ns/rad]
L = 5; % Comprimento do pêndulo [m]
g = 9.8; %  aceleração gravitacional [m/s^2]
% Modelo do pêndulo (assumindo uma entrada u(t) de torque)
%  -> G(s) = theta(s)/u(s) 
s = tf('s'); % variável de Laplace
Gs = 1/(m*L^2*s^2 + b*s + m*g*L); % Função de transferência
tt0=1; % posição inicial [deg]
ttdot0=1; % velocidade inicial [deg/s]
t= 0:0.01:10; % Vetor de tempo para o gráfico [s]
% Resposta no tempo
theta_t = (2*tt0+ttdot0)*exp(-t)-(tt0+ttdot0)*exp(-2*t);
thetadot_t = -(2*tt0+ttdot0)*exp(-t)+2*(tt0+ttdot0)*exp(-2*t);
figure, 
    subplot(211), plot(t,theta_t)
        xlabel('t [s]'), ylabel('\theta [graus]')
    subplot(212), plot(t,thetadot_t)
        xlabel('t [s]'), ylabel('d{\theta}/dt [graus/s]')
% Figura adicional para poder ver a resposta com a variação das constantes
%  PS: requer modelagem em espaço de estados (função ss) que será visto em
%      aulas futuras
figure, 
    subplot(211), initial(ss(Gs),[tt0;ttdot0])
        xlabel('t '), ylabel('\theta [graus]')
    subplot(212), initial(ss(Gs*s),[tt0;ttdot0])
        xlabel('t '), ylabel('d{\theta}/dt [graus/s]')