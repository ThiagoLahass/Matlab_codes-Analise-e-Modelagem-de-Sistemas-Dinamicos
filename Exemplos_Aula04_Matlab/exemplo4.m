%% Simulação do Motor DC (Aula 04) 
% Funções utilizadas (veja documentação): 
%  -> close: fechar figuras abertas
%  -> tf: função para criar funções de transferência
%  -> step: obter a resposta ao degrau de um sistema
%  -> figure: abrir (nova) figura
%  -> subplot: criar sub-gráficos em uma mesma figura
%  -> plot: traçar um gráfico 2D
%  -> xlabel: texto do eixo X (abscissa)
%  -> ylabel: texto do eixo Y (ordenada)
close all;
% Dados numéricos
Ra = 0.5; % Resistência de armadura [Ohm]
La = 0.35e-3; % Indutância de armadura [H]
J = 0.5e-5; % Inércia do eixo do motor [Kg*m^2]
b = 1e-5; % Coeficiente de atrito viscoso no eixo [N*s/rad]
Kt = 0.02; % Constante de torque [N*m/A]
Kom = 0.02; % Constante contra eletromotriz [V*s/rad]
% Modelo do motor (velocidade)
%  -> G(s) = Kt/(J*La*s^2+(J*Ra + b*La)*s + b*Ra + Kt*Kom) 
s = tf('s'); % variável de Laplace
Gs = Kt/(J*La*s^2+(J*Ra + b*La)*s + b*Ra + Kt*Kom); % Função de transferência
figure,  step(5*Gs*30/pi); % Resposta do motor para uma entrada constante de 5V (em rpm)
xlabel('tempo'),ylabel('velocidade (rpm)'),