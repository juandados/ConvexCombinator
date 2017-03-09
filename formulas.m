% Metodo para encontrar F y f.
[datos,Nombres] = xlsread('Diseño de controlador.xlsx','Booleano');

clc
Numero_fs=2;
Numero_Etiquetas=3;
fs=datos(:,size(datos,2)-Numero_fs+1:size(datos,2));
Etiquetas=datos(:,1:Numero_Etiquetas);

for i=1:Numero_fs
    Fnd='U(';
    VarDeUnos=Etiquetas(find(fs(:,i)==1),:);
    for j=1:size(VarDeUnos,1)
        termino=[];
        for k=1:size(VarDeUnos,2)
            if VarDeUnos(j,k)==1
                Var=['V' num2str(size(VarDeUnos,2)+1-k) ','];
                termino=[termino, Var]; 
            elseif VarDeUnos(j,k)==0
                Var=['1-V' num2str(size(VarDeUnos,2)+1-k) ','];
                termino=[termino, Var]; 
            end
        end
        Fnd=[Fnd, 'Y(',termino,'),'];
    end
    Fnd=[Fnd ');'];
    str=['f' num2str(i) '=' strrep(Fnd, ',)', ')') '\n'];
    fprintf(str)
end 
    
for i=1:Numero_fs
    Fnc='Y(';
    VarDeUnos=Etiquetas(find(fs(:,i)==0),:);
    for j=1:size(VarDeUnos,1)
        termino=[];
        for k=1:size(VarDeUnos,2)
            if VarDeUnos(j,k)==1
                Var=['1-V' num2str(size(VarDeUnos,2)+1-k) ','];
                termino=[termino, Var]; 
            elseif VarDeUnos(j,k)==0
                Var=['V' num2str(size(VarDeUnos,2)+1-k) ','];
                termino=[termino, Var]; 
            end
        end
        Fnc=[Fnc, 'U(',termino,'),'];
    end
    Fnc=[Fnc ');'];
    str=['F' num2str(i) '=' strrep(Fnc, ',)', ')') '\n'];
    fprintf(str)
end 

