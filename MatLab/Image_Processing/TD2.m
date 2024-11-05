clear all;
close all;
clc;
%--- Étape 1 : Transformée de Fourier 2D (TFD) avec colormap "turbo" ---

% Charger l'image
[img, map] = imread('MyIm3-ndg-red.png');
if ~isempty(map)
    img = ind2gray(img, map);
end
% Appliquer la transformée de Fourier
tfd = fftshift(fft2(double(img)));
% Prendre le logarithme pour bien visualiser
tfd_log = log(1 + abs(tfd));
% Afficher la transformée avec une table de couleur "turbo"
figure, imshow(tfd_log, []), colormap(turbo), colorbar;
title('TFD 2D de MyIm3-ndg-red.png avec la colormap turbo');

%--- Étape 2 : Comparer la TFD des autres images ---

% Charger les autres images et afficher leur TFD
[img2, map2] = imread('MyIm32-ndg-red.png');
if ~isempty(map2)
    img2 = ind2gray(img2, map2); %
end
tfd2 = fftshift(fft2(double(img2)));
tfd_log2 = log(1 + abs(tfd2));
figure, imshow(tfd_log2, []), colormap(turbo), colorbar;
title('TFD 2D de MyIm32-ndg-red.png');

[img3, map3] = imread('MyIm32a-ndg-red.png');
if ~isempty(map3)
    img3 = ind2gray(img3, map3); 
end
tfd3 = fftshift(fft2(double(img3)));
tfd_log3 = log(1 + abs(tfd3));
figure, imshow(tfd_log3, []), colormap(turbo), colorbar;
title('TFD 2D de MyIm32a-ndg-red.png');

%--- Étape 3 : Charger et afficher une image bruitée ---

% Charger l'image bruitée indexée (si elle l'est)
[img_bruitee, map_bruitee] = imread('MyIm3-ndg-noise-perm.png');
if ~isempty(map_bruitee)
    img_bruitee = ind2gray(img_bruitee, map_bruitee); 
end

% Afficher l'image bruitée dépalettisée
figure, imshow(img_bruitee, []), colormap(gray), colorbar;
title('Image bruitée et dépalettisée : MyIm3-ndg-noise-perm.png');

%--- Étape 4 : Débruitage par lissage avec convolution ---

% Noyau de convolution 3x3
noyau3x3 = ones(3, 3) / 9;
% Lissage
img_lissee_3x3 = conv2(double(img_bruitee), noyau3x3, 'same');
figure, imshow(img_lissee_3x3, []), colormap(gray), colorbar;
title('Image lissée avec noyau 3x3');

% Noyau de convolution 5x5
noyau5x5 = ones(5, 5) / 25;
% Lissage
img_lissee_5x5 = conv2(double(img_bruitee), noyau5x5, 'same');
figure, imshow(img_lissee_5x5, []), colormap(gray), colorbar;
title('Image lissée avec noyau 5x5');

%--- Étape 5 : Filtre médian pour le débruitage ---

% Appliquer un filtre médian
img_median = medfilt2(img_bruitee, [3, 3]);
figure, imshow(img_median, []), colormap(gray), colorbar;
title('Image débruitée avec filtre médian');

%--- Étape 6 : Calcul du PSNR ---

% Charger l'image non bruitée de référence
[img_originale, map_originale] = imread('MyIm3-ndg.png');
if ~isempty(map_originale)
    img_originale = ind2gray(img_originale, map_originale); 
end

% Calcul du PSNR pour chaque méthode
psnr_lisse_3x3 = psnr(uint8(img_lissee_3x3), img_originale);
psnr_lisse_5x5 = psnr(uint8(img_lissee_5x5), img_originale);
psnr_median = psnr(uint8(img_median), img_originale);

% Affichage des PSNR
fprintf('PSNR lissage 3x3: %.2f dB\n', psnr_lisse_3x3);
fprintf('PSNR lissage 5x5: %.2f dB\n', psnr_lisse_5x5);
fprintf('PSNR filtre médian: %.2f dB\n', psnr_median);

%--- Étape 7 : Charger une image non bruitée pour réhaussement de contours ---

% Charger l'image non bruitée
[img_non_bruitee, map_non_bruitee] = imread('MyIm3-ndg-80.jpg');
if ~isempty(map_non_bruitee)
    img_non_bruitee = ind2gray(img_non_bruitee, map_non_bruitee);
end

%--- Étape 8 : Réhaussement de contours avec méthode des gradients ---

% Calcul des gradients
[Gx, Gy] = gradient(double(img_non_bruitee));
% Magnitude du gradient
grad_mag = sqrt(Gx.^2 + Gy.^2);
% Binarisation
grad_binaire = imbinarize(grad_mag);
figure, imshow(grad_binaire);
title('Contours réhaussés par méthode des gradients');

%--- Étape 9 : Réhaussement de contours avec Laplacien ---

% Noyau laplacien
noyau_laplacien = [0 -1 0; -1 4 -1; 0 -1 0];
% Application du noyau laplacien
contours_laplacien = conv2(double(img_non_bruitee), noyau_laplacien, 'same');
% Binarisation
contours_binaire = imbinarize(contours_laplacien);
figure, imshow(contours_binaire);
title('Contours réhaussés par Laplacien');