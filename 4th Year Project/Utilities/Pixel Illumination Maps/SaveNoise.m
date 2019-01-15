clear variables;
for i=1:1:100
    k=GenerateMap(1280,720,i,"center");
    name=strcat('Test_',num2str(i),'%_TIF.tif');
    imwrite(k, name,'tif');
end
