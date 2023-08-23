%% Simulação do Problema da Grua (Aula 01) 
% Funções utilizadas (veja documentação): 
%  -> close: fechar figuras abertas
%  -> tf: função para criar funções de transferência
%  -> impulse: obter a resposta ao impulso unitário
%  -> figure: abrir (nova) figura
%  -> subplot: criar sub-gráficos em uma mesma figura
%  -> xlabel: texto do eixo X (abscissa)
%  -> ylabel: texto do eixo Y (ordenada)
%  -> xlim: valores mínimo e máximo da abscissa
%  -> ylim: valores mínimo e máximo da ordenada
%  -> hold on, off: plotar, ou não, o gráfico sobre os anteriores
%  -> plot: traçar um gráfico 2D
%  -> area: traçar gráfico 2D com interior preenchido
%  -> tic, toc: "tic" zera um contador de tempo e "toc" retorna o valor 
%    deste contador
close all;
% Dados numéricos
M = 1000; % massa do carro [kg]
m = 1000; % massa do gancho [kg]
I = 1; % Inércia do gancho [km*m^2]
L = 2; % Comprimento da correia [m]
g = 9.8; %  aceleração gravitacional [m/s^2]
s = tf('s'); % variável de Laplace
% Modelo dinâmico
%   -> TT(s)/F(s) = b1/(s^2-a1)
%   -> X(s)/F(s) = (a2*b1/(s^2-a1) + b2)/s^2 = (b2*s^2 - b2*a1 + a2*b1)/(s^4-a1*s^2)
a1 = -(M+m)*m*g*L/(I*(M+m)+M*m*L^2);
b1 = -m*L/(I*(M+m)+M*m*L^2);
a2 = m^2*L^2*g/(I*(M+m)+M*m*L^2);
b2 = (I+m*L^2)/(I*(M+m)+M*m*L^2);
TTs_Fs = b1/(s^2-a1);
Xs_Fs = (b2*s^2 - b2*a1 + a2*b1)/(s^4-a1*s^2);
% Simulação: Impulso de 500N, 
t=0:0.1:30; %vetor de tempo
x = impulse(Xs_Fs*300,t); % resposta da posição x do carro [m]
tt = impulse(TTs_Fs*300,t); % resposta do ângulo theta da correia [rad]
figure, % gráficos
subplot(211), plot(t,x), ylabel('x (m)'), xlabel('t (s)');
subplot(212), plot(t,tt*180/pi), ylabel('\theta (graus)'), xlabel('t (s)');
% Simulação
B = 1; % Comprimenhto do carro [m]
H = 0.6; % Altura do carro [m]
tic
for i=1:length(t)
    figure(2),
    area([-1.5;-1.5;5;5],[0;-0.1;-0.1;0],'FaceColor','k') % solo
    hold on,
    ylim([-2 1]),xlim([-1.5, 5]),
    area([-B/2;-B/2;B/2;B/2]+x(i),[0;H;H;0],'FaceColor','y') % carro
    plot([0 L*sin(tt(i))]+x(i),[0 -L*cos(tt(i))]+H/2,'b','LineWidth',2) % correia
    plot([L*sin(tt(i))+x(i)],[-L*cos(tt(i))+H/2],'b.','MarkerSize',100) % "gancho"
    text(1,-1.8,sprintf('t = %0.2f s',t(i)))
    pause(0.1-toc*(i>1)) % 0.1 segundo entre cada plot
    tic
    hold off
end
    