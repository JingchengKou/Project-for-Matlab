function[B]=bell(n)

if n<=0 || n~=fix(n)
    B=[];
    return;
end

B=zeros(n);
B(1,1)=1;
B(2,1)=1;
B(1,2)=2;
if n==1
    B=1;
    return
end
%% To build the bell triangle
for j=3:n
    B(j,1)=B(1,j-1);
    for jj=j-1:-1:1
       B(jj,j+1-jj)=B(jj,j-jj)+B(jj+1,j-jj);
    end
  
end
        

end