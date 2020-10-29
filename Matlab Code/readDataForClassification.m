function [X,Y] = readDataForClassification(name)

str = [name];
load(str);

if (strcmp(name,'Balance.txt'))
    X = Balance(:,1:end-1)';
    Y = Balance(:,end);
    
elseif(strcmp(name,'Binary_XOR.mat'))
    
    Y = (data.Y)';
    X = (data.X);
    
elseif(strcmp(name,'BreastTissue.txt'))
    X = BreastTissue(:,1:end-1)';
    Y = BreastTissue(:,end);
    
elseif(strcmp(name,'Concentric_rings.mat'))
    Y = Y;
    X = X';
    
elseif (strcmp(name,'twomoons.mat'))
    Y = y;
    X = x';
    
elseif(strcmp(name,'Iris.txt'))
    X = Iris(:,1:end-1)';
    Y = Iris(:,end);
    
elseif(strcmp(name,'Wine.txt'))
    X = Wine(:,1:end-1)';
    Y = Wine(:,end);
    
elseif(strcmp(name,'Concentric_rectangles.mat'))
    Y = (Data.Y)';
    X = (Data.X);
    
elseif(strcmp(name,'Sonar.mat'))
    Y = Y';
    X = X;
    
elseif(strcmp(name,'New-thyroid.txt'))
    X = New_thyroid(:,1:end-1)';
    Y = New_thyroid(:,end);
    
elseif(strcmp(name,'Hayes-roth.txt'))
    X = Hayes_roth(:,1:end-1)';
    Y = Hayes_roth(:,end);
    
elseif(strcmp(name,'colonTumor.data'))
    X = colonTumor(:,1:end-1)';
    Y = colonTumor(:,end);
    
elseif(strcmp(name,'Autos.txt'))
    X = Autos(:,1:end-1)';
    Y = Autos(:,end);
    
elseif(strcmp(name,'SRBCT.mat'))
    X = data(:,2:end)';
    Y = data(:,1);
    Y(Y==0) = 4;
    
elseif(strcmp(name,'Glass.txt'))
    X = Glass(:,1:end-1)';
    Y = Glass(:,end);
    
elseif(strcmp(name,'Heart.txt'))
    X = Heart(:,1:end-1)';
    Y = Heart(:,end);
    
elseif(strcmp(name,'banknote_authentication.txt'))
    X = banknote_authentication(:,1:end-1)';
    Y = banknote_authentication(:,end);
    Y(find(Y==0)) = 2;
    
elseif(strcmp(name,'Climate.txt'))
    X = Climate(:,1:end-1)';
    Y = Climate(:,end);
    Y(find(Y==0)) = 2;
    
elseif(strcmp(name,'Connectionist_Bench.txt'))
    X = Connectionist_Bench(:,1:end-1)';
    Y = Connectionist_Bench(:,end);
    Y(find(Y==0)) = 11;
    
elseif(strcmp(name,'Fertility.txt'))
    X = Fertility(:,1:end-1)';
    Y = Fertility(:,end);
    
elseif(strcmp(name,'USPS.mat'))
    [X,Y] = chooseUSPS();
    
elseif(strcmp(name,'colonTumor.data'))
    X = colonTumor(:,1:end-1)';
    Y = colonTumor(:,end);
    
elseif(strcmp(name,'Segment.txt'))
    X = Segment(:,1:end-1)';
    Y = Segment(:,end);
    
elseif(strcmp(name,'Letter.txt'))
    X = Letter(:,1:end-1)';
    Y = Letter(:,end);
    
elseif(strcmp(name,'MLL.txt'))
    X = MLL(:,1:end-1)';
    Y = MLL(:,end);
    
elseif(strcmp(name,'RNA_Seq.txt'))
    X = RNA_Seq(:,1:end-1)';
    Y = RNA_Seq(:,end);
    
elseif(strcmp(name,'Prostate.txt'))
    X = Prostate(:,2:end)';
    Y = Prostate(:,1);
    
elseif(strcmp(name,'DLBCL.txt'))
    X = DLBCL(:,1:end-1)';
    Y = DLBCL(:,end);
    
elseif(strcmp(name,'Abalone.txt'))
    X = Abalone(:,1:end-1)';
    Y = Abalone(:,end);
    
elseif(strcmp(name,'Ionosphere.txt'))
    X = Ionosphere(:,1:end-1)';
    Y = Ionosphere(:,end);
    
elseif(strcmp(name,'Cleveland.txt'))
    X = Cleveland(:,1:end-1)';
    Y = Cleveland(:,end);

elseif(strcmp(name,'Yeast.txt'))
    X = Yeast(:,1:end-1)';
    Y = Yeast(:,end);
end


