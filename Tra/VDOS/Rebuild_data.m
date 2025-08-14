function Rebuild_data(Nf,N)
Nf=20000 % number of correlation steps
N=2700  % number of atoms


try
    dump = fopen('vdos_5layer_1.lammpstrj','r'); 
catch
    error('Dumpfile not found!');
end
fid = fopen('vdos_5layer_1.txt','w'); 
 
for i = 1 : Nf+1 
    
   

    A = textscan(dump,'%f %f %f %f %f','headerlines',9);
    data = zeros(N,5); 
    
    for j = 1 : 5
        data(:,j) = A{1,j}; 
    end
    
    
    data = sortrows(data,1)';  
    fprintf(fid,'%d %d %f %f %f\n',data); 
end