clear all;
sourceDirectory ="C:\Users\nisha\Desktop\HACK\DATASET\dataset_benign_train";

Files = dir(fullfile(sourceDirectory,'*.jpg'));

P  = fullfile(sourceDirectory, 'benign_Train_Perimeter');
A  = fullfile(sourceDirectory, 'benign_Train_Area');
G  = fullfile(sourceDirectory, 'benign_Train_G_Texture');
C  = fullfile(sourceDirectory, 'benign_Train_C_Texture');
PC = fullfile(sourceDirectory, 'benign_Train_PC_Texture');

if ~exist(P, 'dir')
    mkdir(P);
end
if ~exist(A, 'dir')
    mkdir(A);
end
if ~exist(G, 'dir')
    mkdir(G);
end
if ~exist(C, 'dir')
    mkdir(C);
end
if ~exist(PC, 'dir')
    mkdir(PC);
end

for z = 1:numel(Files)
    
    Image = imread(fullfile(sourceDirectory, Files(z).name));
    II=imresize(Image,[256,256]);
    [r1, c1, x]=size(II);
    II=II(25:r1-25,25:c1-25,1:x);
    I = im2gray(II);
    [r1, c1]=size(I);
    
    
    se = strel('disk',5);
    hairs = imbothat(I,se);
    BW = hairs > 15;
    BW2 = imdilate(BW,strel('disk',2));
    replacedImage = roifill(I,BW2);

    re=replacedImage;
    
    k1=imbinarize(re);
    
    img_inverted = not(k1);

    c = bwareafilt(img_inverted,1);

    edges = edge(c, 'Canny');
    
    d=replacedImage;
    d(~c)=0;
    d1=replacedImage;
    d1(~c)=255;

    cmap=jet(256);
    rgbimage=ind2rgb(d1,cmap);
    e=rgbimage;
    e(~c)=0;

    g=II;
    for i=1:r1
        for j=1:c1
            if(d1(i,j)<255)
                g(i,j,1)=II(i,j,1);
                g(i,j,2)=II(i,j,2);
                g(i,j,3)=II(i,j,3);
            else
                g(i,j,1)=0;
                g(i,j,2)=0;
                g(i,j,3)=0;
            end
        end
    end

    FileName_P = fullfile(P, [Files(z).name,'.jpg']);
    imwrite(edges, FileName_P, 'jpg');
    FileName_A = fullfile(A, [Files(z).name,'.jpg']);
    imwrite(c, FileName_A, 'jpg');
    FileName_G = fullfile(G, [Files(z).name,'.jpg']);
    imwrite(d, FileName_G, 'jpg');
    FileName_C = fullfile(C, [Files(z).name,'.jpg']);
    imwrite(g, FileName_C, 'jpg');
    FileName_PC = fullfile(PC, [Files(z).name,'.jpg']);
    imwrite(e, FileName_PC, 'jpg');
end