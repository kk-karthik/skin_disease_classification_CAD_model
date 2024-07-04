function [features, featureMetrics, varargout] = exampleBagOfFeaturesExtractorsurf(I)
[height,width,numChannels] = size(I);
if numChannels > 1
    grayImage = rgb2gray(I);
else
    grayImage = I;
end
gridStep = 8; % in pixels
gridX = 1:gridStep:width;
gridY = 1:gridStep:height;

[x,y] = meshgrid(gridX, gridY);

gridLocations = [x(:) y(:)];

multiscaleGridPoints = [SIFTPoints(gridLocations, 'Scale', 1.6); 
                        SIFTPoints(gridLocations, 'Scale', 3.2);
                        SIFTPoints(gridLocations, 'Scale', 4.8);
                        SIFTPoints(gridLocations, 'Scale', 6.4)];
                    
features = extractFeatures(grayImage, multiscaleGridPoints, Method="SIFT");

featureMetrics = var(features,[],2);

if nargout > 2
    varargout{1} = multiscaleGridPoints.Location;
end


