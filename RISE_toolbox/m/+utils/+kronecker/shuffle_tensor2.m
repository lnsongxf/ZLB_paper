function B=shuffle_tensor2(A,matsizes,newOrder)

rows=matsizes(end:-1:1,1);

cols=matsizes(end:-1:1,2);

[ra,ca]=size(A);

ira=reshape(1:ra,rows(:).');

ica=reshape(1:ca,cols(:).');

nmat=numel(rows);

order_=fliplr(1:nmat);

newOrder_=fliplr(newOrder(:).');

reorder=nan(1,nmat);

for ii=1:nmat
    
    reorder(ii)=find(order_==newOrder_(ii));
    
end

newira=permute(ira,reorder);

newica=permute(ica,reorder);

lm=speye(ra);

rm=speye(ca);

posl(newira(:))=1:ra;

posr(newica(:))=1:ca;

B=lm(:,posl)*A*rm(posr,:);


end