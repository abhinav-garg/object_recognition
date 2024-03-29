function [imageSet] = loadImages
    % Launches a window to select the top level directory
    topLevelDir = uigetdir;
    % Loads all the png images
    imagePaths = dir(strcat(topLevelDir, '/*.png'));
    imageSetSize = size(imagePaths);
       
%     imshow(uint8(reshape(imageSet(:,3),128,128)))  % for debugging
    
    imageSet = zeros(128*128, imageSetSize);
    
    objectNum = 20;
    imageNum = 72;
    imWidth = 128;
    imHeight = 128;
    imPixels = 128*128;
    for i = 1:objectNum
        for j = 0:imageNum-1
            imagePath = strcat(topLevelDir,sprintf('/obj%d__%d.png',i,j));
%             disp(imagePath);
            image = imread(imagePath);
            imageVector = reshape(image, imPixels, 1);
            imageSet(:,imageNum*(i-1)+j+1) = imageVector;
        end
    end
    
    % For getting a particular object
    objectID = 4;
    objectSet = zeros(128*128, 72);
    for i = 1:72
       objectSet(:,i) = imageSet(:,72*(objectID-1)+i); 
    end
    
%     imshow(uint8(reshape(objectSet(:,1),128,128)));
%     imshow(uint8(reshape(objectSet(:,72),128,128)));
    
%     N_x = nPersons*imNumTraining;
%     N_z = nPersons*imNumTesting;
%     
%     x = zeros(d,N_x);
%     z = zeros(d,N_z);
%     
%     xj = 0;
%     zj = 0;
%     for i = 1:length(sub_folders)
%         image_paths = dir(strcat(topLevelDir,'/',sub_folders(i).name,'/*.pgm'));
%         count = 1;
%         for j = 1:length(image_paths)
%             path = strcat(topLevelDir,'/',sub_folders(i).name,'/',image_paths(j).name);
%             I = imread(path);
%             if count <= 30
%                 xj = xj + 1;
%                 for xi = 1:d
%                     x(xi,xj) = I(xi);
%                 end
%             end
%             if count > 30
%                 zj = zj + 1;
%                 for zi = 1:d
%                     z(zi,zj) = I(zi);
%                 end 
%             end
%             disp(strcat('CroppedYale/',sub_folders(i).name,'/',image_paths(j).name))
%             count = count+1;
%             if count == 60
%                 break
%             end
%         end
%     end
end