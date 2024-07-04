files = dir('E:/Dataset DDSM_ROI/Density_wise/Density_1_Mass_model_phase_1+2/N+AN_D1_Pre_Train_BEMD_Mode_1/Mode_1_D1_N_Train/*.png');
for i=1:numel(files)
    % Read original image
    filename = fullfile(files(i).folder, files(i).name);
    a = imread(filename);
    % Original image
    [m,n] = size (a);
    % Cropping the top and bottom rows
    figure
    imagesc(a);
    colormap gray;
    axis equal;
    axis off;
    saveas(gcf, sprintf('%d.png',i));
end