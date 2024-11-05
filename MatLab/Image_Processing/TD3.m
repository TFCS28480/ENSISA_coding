% Début du script MATLAB pour le TD3 de morphologie mathématique

% 1. Charger et afficher les images
contour_img = imread('Contour_10_7.tif');
croix_img = imread('croix_10_7.tif');

figure;
subplot(1,2,1);
imshow(contour_img);
title('Image Contour');

subplot(1,2,2);
imshow(croix_img);
title('Image Croix');

% 2. Opérations de base en morphologie mathématique (union, intersection, complément)
union_img = contour_img | croix_img;
intersection_img = contour_img & croix_img;
complement_img = ~contour_img;

figure;
subplot(1,3,1);
imshow(union_img);
title('Union');

subplot(1,3,2);
imshow(intersection_img);
title('Intersection');

subplot(1,3,3);
imshow(complement_img);
title('Complément');

% 3. Remplissage de l'image "Contour_10_7.tif" et création d'un film
SE = strel('disk', 1);  % Élément structurant
v = VideoWriter('remplissage_contour.avi');  % Initialisation de la vidéo
open(v);

filled_img = contour_img;
for i = 1:50
    filled_img = imdilate(filled_img, SE);  % Dilater progressivement
    writeVideo(v, filled_img);              % Sauvegarder chaque étape
end

close(v);  % Fermer la vidéo
figure;
imshow(filled_img, InitialMagnification=100000); % Permet d'agrandir l'image
title('Image remplie');

% 4. Dilatation de l'image "woman-noise.bmp"
woman_noise = imread('woman-noise.bmp');
SE_small = strel('disk', 3);  % Petit élément structurant
SE_large = strel('disk', 5);  % Grand élément structurant

dilated_small = imdilate(woman_noise, SE_small);  % Dilatation avec petit élément
dilated_large = imdilate(woman_noise, SE_large);  % Dilatation avec grand élément

figure;
subplot(1,2,1);
imshow(dilated_small);
title('Dilatation avec petit élément');

subplot(1,2,2);
imshow(dilated_large);
title('Dilatation avec grand élément');

% 5. Érosion de l'image "woman-noise.bmp"
eroded_small = imerode(woman_noise, SE_small);  % Érosion avec petit élément
eroded_large = imerode(woman_noise, SE_large);  % Érosion avec grand élément

figure;
subplot(1,2,1);
imshow(eroded_small);
title('Érosion avec petit élément');

subplot(1,2,2);
imshow(eroded_large);
title('Érosion avec grand élément');

% 6. Ouverture de l'image "woman-noise.bmp"
opened_img = imopen(woman_noise, SE_small);  % Ouverture avec petit élément structurant

figure;
imshow(opened_img);
title('Ouverture avec petit élément structurant');

% 7. Fermeture de l'image "woman-noise.bmp"
closed_img = imclose(woman_noise, SE_small);  % Fermeture avec petit élément structurant

figure;
imshow(closed_img);
title('Fermeture avec petit élément structurant');

% 8. Amélioration d'image avec ouverture et fermeture, comparaison avec filtrage médian
opened_closed_img = imclose(imopen(woman_noise, SE_small), SE_small);  % Ouverture suivie de fermeture
median_filtered = medfilt2(woman_noise);  % Filtrage médian

figure;
subplot(1,2,1);
imshow(opened_closed_img);
title('Ouverture + Fermeture');

subplot(1,2,2);
imshow(median_filtered);
title('Filtrage Médian');

% 9. Filtre "Top Hat" sur l'image "rice.png"
rice_img = imread('rice.png');
opened_rice = imopen(rice_img, SE_small);  % Ouverture de l'image
top_hat = rice_img - opened_rice;  % Filtre "Top Hat"

figure;
imshow(top_hat);
title('Filtre Top Hat sur l''image de riz');

% 10. Atténuation des variations du fond sur l'image "coins.gif"
coins_img = imread('coins.gif');
opened_coins = imopen(coins_img, SE_small);  % Ouverture pour atténuer les variations du fond

figure;
imshow(opened_coins);
title('Atténuation des variations du fond (Coins)');

% Fin du script

% want the i-th 3D frame of the 4D data, then,
% frame_i=cropVol(:,:,i)

% 3D volume in which the 4th dimension has been spread out onto the third dimension.
% split = reshape(cropVol, size(cropVol,1), size(cropVol,2), size(cropVol,3)*size(cropVol,4));

% cell array in which each element was a 3D slice.
% split = squeeze(num2cell(cropVol, [1 2 3]));