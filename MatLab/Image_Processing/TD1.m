%% Partie A: Chargement, manipulations de base et affichage d’images de différents types

% A.1. Charger l’image MyIm1.png et obtenir ses caractéristiques
MyIm1 = imread('MyIm1.png');
info1 = imfinfo('MyIm1.png');
disp('Informations sur MyIm1.png :');
disp(info1);

% A.2. Afficher l’image MyIm1 et déterminer ses dimensions
figure;
imshow(MyIm1);
title('MyIm1.png');
dimensions1 = size(MyIm1);
disp(['Dimensions de MyIm1.png : ', num2str(dimensions1)]);

% A.3. Charger et afficher l’image MyIm2.png, comparer avec MyIm1.png, et afficher la table de couleur
[MyIm2, map2] = imread('MyIm2.png');
figure;
imshow(MyIm2, map2);
title('MyIm2.png avec sa table de couleurs');
colormap(map2);
colorbar;
disp('Table de couleurs de MyIm2 :');
disp(map2);

%% Partie B: Transformations de couleurs, manipulations de LUT

% B.1. Transformer MyIm1 et MyIm2 en images à niveaux de gris et les afficher avec barre de couleur
grayMyIm1 = rgb2gray(MyIm1);
figure;
imshow(grayMyIm1);
title('MyIm1 en niveaux de gris');
colorbar;

% Si MyIm2 est une image indexée, on la convertit en RGB avant transformation
rgbMyIm2 = ind2rgb(MyIm2, map2);
grayMyIm2 = rgb2gray(rgbMyIm2);
figure;
imshow(grayMyIm2);
title('MyIm2 en niveaux de gris');
colorbar;

%% Partie C: Images compressées

% C.1. Charger les images MyIm3-ndg.png, MyIm3-ndg.tif, MyIm3-ndg-100.jpg
MyIm3_png = imread('MyIm3-ndg.png');
MyIm3_tif = imread('MyIm3-ndg.tif');
MyIm3_jpg100 = imread('MyIm3-ndg-100.jpg');

% Afficher les trois images pour comparaison
figure;
subplot(1,3,1), imshow(MyIm3_png), title('MyIm3-ndg.png');
subplot(1,3,2), imshow(MyIm3_tif), title('MyIm3-ndg.tif');
subplot(1,3,3), imshow(MyIm3_jpg100), title('MyIm3-ndg-100.jpg');

% C.2. Comparer les images avec la métrique PSNR
psnr_tif_jpg100 = psnr(MyIm3_tif, MyIm3_jpg100);
disp(['PSNR entre MyIm3-ndg.tif et MyIm3-ndg-100.jpg : ', num2str(psnr_tif_jpg100)]);

% Comparer avec d'autres images compressées (ex: MyIm3-ndg-80.jpg, MyIm3-ndg-20.jpg, MyIm3-ndg-1.jpg)
MyIm3_jpg80 = imread('MyIm3-ndg-80.jpg');
MyIm3_jpg20 = imread('MyIm3-ndg-20.jpg');
MyIm3_jpg1 = imread('MyIm3-ndg-1.jpg');

psnr_tif_jpg80 = psnr(MyIm3_tif, MyIm3_jpg80);
psnr_tif_jpg20 = psnr(MyIm3_tif, MyIm3_jpg20);
psnr_tif_jpg1 = psnr(MyIm3_tif, MyIm3_jpg1);

disp(['PSNR entre MyIm3-ndg.tif et MyIm3-ndg-80.jpg : ', num2str(psnr_tif_jpg80)]);
disp(['PSNR entre MyIm3-ndg.tif et MyIm3-ndg-20.jpg : ', num2str(psnr_tif_jpg20)]);
disp(['PSNR entre MyIm3-ndg.tif et MyIm3-ndg-1.jpg : ', num2str(psnr_tif_jpg1)]);

%% Partie D: Manipulations d’histogrammes

% D.1. Charger et afficher l’image MyIm3-ndg-lc.png et tracer son histogramme
MyIm3_lc = imread('MyIm3-ndg-lc.png');
figure;
imshow(MyIm3_lc);
title('MyIm3-ndg-lc.png');

% Tracer l’histogramme des niveaux de gris
figure;
imhist(MyIm3_lc);
title('Histogramme de MyIm3-ndg-lc.png');

% Comparer avec l'histogramme de MyIm3-ndg.tif
figure;
imhist(MyIm3_tif);
title('Histogramme de MyIm3-ndg.tif');

% D.2. Amélioration de MyIm3-ndg-lc.png (amélioration de contraste)
MyIm3_lc_eq = histeq(MyIm3_lc);
figure;
imshow(MyIm3_lc_eq);
title('MyIm3-ndg-lc.png après égalisation d''histogramme');

%% Partie E: Opérations diverses

% E.1. Seuiller MyIm3-ndg.tif à sa moyenne
mean_value = mean(MyIm3_tif(:));
binaryImage = MyIm3_tif > mean_value;
figure;
imshow(binaryImage);
title('Image binarisée à partir de MyIm3-ndg.tif (seuil à la moyenne)');

% E.2. Calculer et afficher la transformée de Fourier discrète 2D de l’image binarisée
fftImage = fft2(double(binaryImage));
fftShifted = fftshift(log(1 + abs(fftImage))); % Décalage et échelle logarithmique pour visualisation
figure;
imshow(fftShifted, []);
title('Transformée de Fourier discrète 2D de l’image binarisée');

%% Questions optionnelles

% B.2. Afficher un de ces résultats en coupe (selon une diagonale montante)
diagonal_slice = diag(grayMyIm1);
figure;
plot(diagonal_slice);
title('Coupe en diagonale de MyIm1 en niveaux de gris');

% D.3. Appliquer une égalisation d’histogramme à MyIm3-ndg-lc.png
% (fait dans D.2)

% E.3. Binariser MyIm3-ndg.png en utilisant un algorithme adaptatif (dither)
adaptive_binaryImage = imbinarize(MyIm3_tif, 'adaptive');
figure;
imshow(adaptive_binaryImage);
title('Image binarisée avec un algorithme adaptatif');

% E.4. Calculer la TFD 2D de l’image binarisée adaptativement et la comparer avec l’image binarisée précédente
fftImage_adaptive = fft2(double(adaptive_binaryImage));
fftShifted_adaptive = fftshift(log(1 + abs(fftImage_adaptive)));
figure;
imshow(fftShifted_adaptive, []);
title('Transformée de Fourier discrète 2D de l’image binarisée adaptative');
