function [features, featureMetrics, varargout] = exampleBagOfFeaturesExtractorsift1(I)
%% Step 1: Preprocess the Image
% The extractor function is applied to each image, I, within the image set
% used to create the bagOfFeatures. Depending on the type of features being
% extracted, the input images may require preprocessing prior to feature
% extraction.

% Convert I to grayscale if required.
[height,width,numChannels] = size(I);
if numChannels > 1
    grayImage = rgb2gray(I);
else
    grayImage = I;
end

%% Step 2: Select Point Locations for Feature Extraction
% Here, a regular spaced grid of point locations is created over I. 

% Define a regular grid over I.
gridStep = 8; % in pixels
gridX = 1:gridStep:width;
gridY = 1:gridStep:height;

[x,y] = meshgrid(gridX, gridY);

gridLocations = [x(:) y(:)];

%%
% Concatenate multiple SIFTPoint objects at different scales to achieve
% multiscale feature extraction.
multiscaleGridPoints = [SIFTPoints(gridLocations, 'Scale', 1.6); 
                        SIFTPoints(gridLocations, 'Scale', 3.2);
                        SIFTPoints(gridLocations, 'Scale', 4.8);
                        SIFTPoints(gridLocations, 'Scale', 6.4)];
                    
%% Step 3: Extract features
% Finally, extract features from the selected point locations.
features = extractFeatures(grayImage, multiscaleGridPoints,'Method','SIFT');

%% Step 4: Compute the Feature Metric
% The feature metrics indicate the strength of each feature, where larger
% metric values are given to stronger features. The feature metrics are
% used to remove weak features before bagOfFeatures learns a visual
% vocabulary. You may use any metric that is suitable for your feature
% vectors.
%
% Use the variance of the SIFT features as the feature metric.
featureMetrics = var(features,[],2);

% Alternatively, if a feature detector was used for point selection,
% the detection metric can be used. For example:
%
% featureMetrics = multiscaleSIFTPoints.Metric;

% Optionally return the feature location information. The feature location
% information is used for image search applications. See the retrieveImages
% and indexImages functions.
if nargout > 2
    % Return feature location information
    varargout{1} = multiscaleGridPoints.Location;
end


