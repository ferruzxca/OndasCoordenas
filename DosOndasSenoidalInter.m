% Solicitar las dos funciones al usuario
func1_str = input('Ingrese la primera función de x (por ejemplo, sin(x)): ', 's');
func2_str = input('Ingrese la segunda función de x (por ejemplo, sin(2*x)): ', 's');

% Convertir las funciones de cadena a funciones anónimas
func1 = str2func(['@(x) ' func1_str]);
func2 = str2func(['@(x) ' func2_str]);

% Calcular la frecuencia de las funciones buscando coeficientes de x
f1_freq = obtener_frecuencia(func1_str);
f2_freq = obtener_frecuencia(func2_str);

% Determinar la menor frecuencia
min_freq = min(f1_freq, f2_freq);

% Definir el rango de x para mostrar exactamente 3 ciclos de la función con menor frecuencia
period_min_freq = 2 * pi / min_freq; % Período de la función con menor frecuencia
x_min = 0; 
x_max = period_min_freq * 3; % Aseguramos que sean 3 ciclos de la función de menor frecuencia
x = linspace(x_min, x_max, 10000); % Más puntos para mayor precisión

% Calcular los valores de las funciones
y1 = func1(x);
y2 = func2(x);

% Encontrar los puntos de intersección utilizando un método de búsqueda más precisa
tolerance = 1e-4;    % Tolerancia para considerar que dos valores son iguales
intersect_x = [];
intersect_y = [];

for i = 1:length(x)-1
    if (y1(i) - y2(i)) * (y1(i+1) - y2(i+1)) < 0
        % Intersección detectada entre el punto i y i+1
        x1 = x(i);
        x2 = x(i+1);
        y1_ = y1(i);
        y2_ = y2(i);
        
        % Interpolación lineal para encontrar el punto de intersección
        x_intersect = x1 - (y1_ - y2_) * (x2 - x1) / ((y1_ - y2_) - (y1(i+1) - y2(i+1)));
        y_intersect = func1(x_intersect); % O func2(x_intersect), ya que en el punto de intersección y1 = y2
        
        % Guardar los puntos de intersección
        intersect_x = [intersect_x; x_intersect];
        intersect_y = [intersect_y; y_intersect];
    end
end

% Graficar las funciones
figure;
plot(x, y1, 'b', 'LineWidth', 2); % Función 1 en azul
hold on;
plot(x, y2, 'r', 'LineWidth', 2); % Función 2 en rojo
plot(intersect_x, intersect_y, 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 8); % Puntos de intersección

% Ajustar el eje x para mostrar en términos de pi
xticks(0:pi/2:x_max); % Etiquetas del eje x en múltiplos de pi/2
xticklabels(arrayfun(@(v) sprintf('%.1f\\pi', v/pi), 0:pi/2:x_max, 'UniformOutput', false));

% Crear leyenda con las funciones ingresadas
legend({['Función 1: ', func1_str], ['Función 2: ', func2_str], 'Puntos de intersección'}, 'Location', 'best');

title('Intersección de dos funciones');
xlabel('x (en términos de \pi)');
ylabel('y');
grid on;
hold off;

% Mostrar las coordenadas de los puntos de intersección en términos de pi
disp('Puntos de intersección (x, y) en términos de pi:');
x_intersect_pi = intersect_x / pi;  % Convertir los valores de x a múltiplos de pi
disp([x_intersect_pi, intersect_y]);

% Etiquetar los puntos de intersección
for i = 1:length(intersect_x)
    % Convertir el valor de x a fracción de pi
    x_pi = intersect_x(i) / pi;
    if abs(x_pi - round(x_pi)) < 1e-2
        % Mostrar etiquetas como enteros si están cerca de enteros
        label = sprintf('(%d\\pi, %.2f)', round(x_pi), intersect_y(i));
    else
        % Mostrar etiquetas en formato de fracción
        [numerator, denominator] = rat(x_pi, 1e-2); % Aproximar a fracción simple
        if denominator == 1
            label = sprintf('(%d\\pi, %.2f)', numerator, intersect_y(i));
        else
            label = sprintf('(%.0f/%.0f\\pi, %.2f)', numerator, denominator, intersect_y(i));
        end
    end
    
    % Mostrar las etiquetas un poco por encima de los puntos de intersección
    text(intersect_x(i), intersect_y(i) + 0.1, label, 'FontSize', 10, 'Color', 'k', 'FontWeight', 'bold');
end

% Función para obtener la frecuencia (coeficiente de x)
function freq = obtener_frecuencia(func_str)
    % Buscar el coeficiente de x en la función trigonométrica
    % Asume funciones de la forma sin(kx) o cos(kx)
    tokens = regexp(func_str, '(sin|cos)\(([^)]*)\)', 'tokens');
    
    if isempty(tokens)
        error('No se detectó una función trigonométrica en la cadena proporcionada.');
    end
    
    % Extraer el coeficiente de x
    expr = tokens{1}{2}; % La expresión dentro del paréntesis
    coef = regexp(expr, '([0-9.]+)\*?x', 'tokens'); % Buscar el coeficiente de x
    
    if isempty(coef)
        freq = 1; % Si no hay coeficiente explícito, la frecuencia es 1 (sin(x) o cos(x))
    else
        freq = str2double(coef{1}{1}); % Convertir a número el coeficiente
    end
end