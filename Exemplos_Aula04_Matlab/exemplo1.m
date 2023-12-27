%% Simulação do Circuito RLC (Aula 04) 
% Funções utilizadas (veja documentação): 
%  -> close: fechar figuras abertas
%  -> tf: função para criar funções de transferência
%  -> step: obter a resposta ao degrau de um sistema
%  -> figure: abrir (nova) figura
%  -> plot: traçar um gráfico 2D
%  -> xlabel: texto do eixo X (abscissa)
%  -> ylabel: texto do eixo Y (ordenada)
close all;
% Dados numéricos
R = 200; % resistencia [Ohm]
L = 0.050; % Indutância [Henry]
C = 25e-6; % Capacitância [Farad]
% Modelo do circuito RLC
%  -> G_{i,vf}(s) = I(s)/Vf(s) = Cs/(LC*s^2+ RC*s + 1)
%  -> G_{vc,vf}(s) = Vc(s)/Vf(s) = 1/(LC*s^2+ RC*s + 1)
s = tf('s'); % variável de Laplace
G_i_vf = C*s/(L*C*s^2 + R*C*s + 1); % Função de transferência
G_vc_vf = 1/(C*s)*G_i_vf;
figure,  step(5*G_i_vf); % Resposta da corrente para uma tensão instantânea de 5V
xlabel('tempo'),ylabel('Corrente i (A)'),
figure,  step(5*G_vc_vf); % Resposta da tensão no capacitor para uma tensão instantânea de 5V
xlabel('tempo'),ylabel('Tensão V_c i (V)'),