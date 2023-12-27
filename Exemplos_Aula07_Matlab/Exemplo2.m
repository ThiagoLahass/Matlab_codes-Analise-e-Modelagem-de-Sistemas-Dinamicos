%% Exemplo 2: diagrama de blocos, usando o Simulink (Aula 07)
% Funções utilizadas (veja documentação): 
%  -> tf: função para criar funções de transferência
%  -> figure: abrir (nova) figura
%  -> step: Obtem a resposta ao degrau unitário do sistema. 
%  -> open: abre um arquivo qualquer
%  -> Executa a simulação de um arquivo Simulink (*.slx)
% Blocos Simulink utilizados (veja documentação):
%  -> Library/Simulink/Source/Step: gera uma entrada degrau
%  -> Library/Simulink/Continuous/"Transfer Fcn": gera uma função de
%     transferência a partir dos coeficientes do numerador e do denominador
%  -> Library/simulink/"Math Operations"/Sum: soma/subtração de sinais
%  -> Library/simulink/Sink/Scope: visualizador de sinais
close all; clc;
% Definição das funções de transferência (ver slide 12)
G1n = 1; G1d = [1 1]; G1 = tf(G1n,G1d);
G2n = 1; G2d = [1 10 29]; G2 = tf(G2n,G2d);
G3n = -5; G3d = [1 0]; G3 = tf(G3n,G3d);
G4n = 10; G4d = 1; G4 = tf(G4n,G4d);
G5n = 25; G5d = 1; G5 = tf(G5n,G5d);
G6n = -1; G6d = [1 0]; G6 = tf(G6n,G6d);
% Sistema analítico equivalente
G = (G5*G2*G1 + G6*G1)/(1-G3*G1+G4*G2*G1);
% Vetores com os coeficientes do numerador e denominador
Gn = G.Numerator{1}; Gd = G.Denominator{1}; 
figure, step(G) % Resposta ao degrau unitário
open('Exemplo2_Simulink'); % Abre o arqiovo simulink (slx)
sim('Exemplo2_Simulink'); % Executa a simulação 
% Obs: o arquivo simulinbk (*.slx) foi gerado para o Matlab 2016a, caso 
% alguem use versão anterior, pode ocorrer erro de versão. Nesse caso, 
% solicitar uma versão nova
