%% Simulação do Problema da Suspensão (Aula 03) 
% Funções utilizadas (veja documentação): 
%  -> close: fechar figuras abertas
%  -> tf: função para criar funções de transferência
%  -> lsim: obter a resposta de um sistema linear para uma entrada u
%     determinada
%  -> figure: abrir (nova) figura
%  -> hold on, off: plotar, ou não, o gráfico sobre os anteriores
%  -> plot: traçar um gráfico 2D
%  -> xlabel: texto do eixo X (abscissa)
%  -> ylabel: texto do eixo Y (ordenada)
%  -> legend: adiciona a legenda na ordem que os gráficos são plotados
close all;
% Dados numéricos
m_t=1580; % massa do carro [kg]
m_r=20; % Massa da roda+pneu [kg]
m_C=m_t-4*m_r; % massa do chassi [kg]
m_c=m_C/4; % massa do chassi no modelo de 1/4 de carro [kg]
k_s=130000; % Constante elástica da suspensão [N/m]
k_p=1000000; % Constante elástica do pneu [N/m]
c_s=9800; % Coeficiente de amortecimento da suspensão [Ns/m]
% Modelo da suspensão (resposta do chassi a uma excitação do solo)
%  -> G(s) = Z_c(s)/Z_a(s) 
s = tf('s'); % variável de Laplace
Gs=(c_s*k_p*s + k_s*k_p)/(m_c*m_r*s^4 + (m_c + m_r)*c_s*s^3 + (m_c*(k_s+k_p) + m_r*k_s)*s^2 + c_s*k_p*s + k_s*k_p);
t=0:0.005:0.8; % vetor de tempo
u=5*sin(2*pi*10*t); % excitação senoidal do solo (mm)
t=-0.2:0.005:0.8; % acrescenta tempo sem excitação (repouso)
u=[(0:0.005:0.195)*0 u]; % entrada zero no tempo de repouso
zc = lsim(Gs,u,t); % Simula a resposta para a entrada senoidal
figure, hold on,
plot(t,u,'r'); % traçar o gráfico da excitação do solo
plot(t,zc,'b'); % traçar o gráfico da resposta do chassi
xlabel('tempo (s)'),ylabel('Amplitude (mm)'),
legend('solo','chassi')