foldername = 'genres\genres\blues';
 files      = dir(foldername);
 length(files)
 A=zeros(10);                                              %Matrix for ZCR
 a=1;                                                       %Index of ZCR matrix a,b are used
part= (length(files)-2)
 for k=1:(part+2)
    
    if ~files(k).isdir                                    % ignore directories[To ignore . ,.. directories.That's why,102 files ]
         filename = fullfile(foldername,files(k).name);   % build the file name
         fid = fopen(filename);                           % open the file
         x=audioread(filename);
         filename                                         %To print the file names 
         y=ZCR(x)                                         %finding Zero Crossing Rate(ZCR)
         
         subplot(10,10,k-2);
         plot(x);
         title(k-3)
         b=mod(k-2,10);
         A(a,b+1)=y;
         
         if  b==0
             a=a+1;
         end
         
         if fid>0
             % do stuff with file contents
             % close the file
             fclose(fid);
         end
    end
 end
 
length(files);

col=A(:,1);                                 %Extracting 1st colum of the obtained matrix
A(:,1)=[];                                   %Deleting the first column

ZCR_Matrix=[A,col]                          %concencating the 1st column and new matrix