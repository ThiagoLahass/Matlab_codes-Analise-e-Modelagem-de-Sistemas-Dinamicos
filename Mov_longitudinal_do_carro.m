%% Simulação do Mov. Longitudinal do Carro (Aula 03) 
% Funções utilizadas (veja documentação): 
%  -> close: fechar figuras abertas
%  -> tf: função para criar funções de transferência
%  -> step: obter a resposta ao degrau de um sistema
%  -> figure: abrir (nova) figura
%  -> hold on, off: plotar, ou não, o gráfico sobre os anteriores
%  -> plot: traçar um gráfico 2D
%  -> xlabel: texto do eixo X (abscissa)
%  -> ylabel: texto do eixo Y (ordenada)
close all;
% Dados numéricos
m = 1000; % massa do carro [kg]
b = 50; % Coeficiente de atrito viscoso com o ar [Ns/m]
% Modelo longitudinal do carro
%  -> G(s) = V(s)/F(s) 
s = tf('s'); % variável de Laplace
Gs = 1/(m*s + b); % Função de transferência
figure,  step(500*Gs); % Resposta ao egrau de 500N (500*1(t))
xlabel('tempo'),ylabel('Velocidade (m/s)'),
