%% Simulação do Filtro ativo usando Amp. Op. (Aula 04) 
% Funções utilizadas (veja documentação): 
%  -> close: fechar figuras abertas
%  -> tf: função para criar funções de transferência
%  -> step: obter a resposta ao degrau de um sistema
%  -> lsim: Simula um sistema linear para uma entrada u definida (vetor)
%  -> bode: resposta em frequência de um sistema
%  -> figure: abrir (nova) figura
%  -> plot: traçar um gráfico 2D
%  -> xlabel: texto do eixo X (abscissa)
%  -> ylabel: texto do eixo Y (ordenada)
close all;
% Dados numéricos
R1 = 1000; % Resistência 1 [Ohm]
R2 = 10000; % Resistência 2 [Ohm]
C = 10e-6; % Capacitância [Farad]
% Modelo do filtro ativo (inversor)
%  -> G(s) = -(R_2/R_1)/(R_1Cs+1) 
s = tf('s'); % variável de Laplace
Gs = -(R2/R1)/(R2*C*s + 1); % Função de transferência
figure,  step(5*Gs); % Resposta da tensão de saida para uma entrada constante de 5V
xlabel('tempo'),ylabel('Tensão V_o (V)'),
t=0:0.0001:0.08; % vetor de tempo para análise [s]
f = 100; % Frequência da senoide de entrada [Hz]
A = 5; % Amplitude da onda senoidal
u = 5*sin(2*pi*f*t); % Entrada senoidal [V]
figure,  lsim(Gs,u,t); % Resposta do fintro para a entrada senoidal criada
xlabel('tempo'),ylabel('Tensão V_o (V)'),
figure, bode(Gs); % Resposta em frequência do filtro