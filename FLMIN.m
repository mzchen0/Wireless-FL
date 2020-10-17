clear all


numberofneuron=50;

%I=([ 0.05   0.08   0.11  0.14 ]-0.04)*0.000001;
%I=([0.05 0.06 0.08 0.09  0.11 0.12  0.14 0.15]-0.04)*0.000001;


 drequirement=0.5;   %% delay requirement
 erequirement=0.003; %% energy requirement
datanumber=[100 200 300 400 500 400 300 200 100 200 300 400 500 600 100 200 300 400 500 100]; %% number of training datasamples for each device. 
%% Forx example, the first user has 100 training data samples while the second user has 200 training data samples.
averagenumber=3; %% Number of implementation of FL

iteration=130;  %% Number of iterations for each FL implementation

proposed=1;    %% Choose the algorithm you want to run. Here, note that, when we choose proposed algorithm, then we have proposed=1, the others must be 0.
baseline1=0;
baseline2=0;
baseline3=0;

%Id=([0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13 0.14 0.15]-0.04)*0.000003;


%%%%%%%%%%%%%%%%%%%%% MINST data processing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% training data
[trainingdata, traingnd] = mnist_parse('train-images-idx3-ubyte', 'train-labels-idx1-ubyte');
trainingdata = double(reshape(trainingdata, size(trainingdata,1)*size(trainingdata,2), []).');
trainingdata=double(trainingdata);

traingnd = double(traingnd);
traingnd(traingnd==0)=10;
traingnd=dummyvar(traingnd); 



%% test data

[testdata, testgnd] = mnist_parse('t10k-images-idx3-ubyte', 't10k-labels-idx1-ubyte');
testdata = double(reshape(testdata, size(testdata,1)*size(testdata,2), []).');
testgnd = double(testgnd);
testgnd(testgnd==0)=10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%I=([0.05 0.1 0.14]-0.04)*0.000001;
Id=0.06*0.000003;  % Interference over downlink 



P=0.01;     % Here, we use maximum power. One can also optimize it according to the delay and energy requirements
  




%%%% Set Neural network of user 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 net1 = patternnet(numberofneuron);                   % each linear network for each user
  
 % net1.trainFcn = 'traingd';
    net1.divideFcn = '';
 net1.inputs{1}.processFcns={};
 net1.outputs{2}.processFcns={};
net1.trainParam.epochs = 1;
net1.trainParam.showWindow = 0;
input1=[];
output1=[];
account1=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set Neural network of user 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 net2 = patternnet(numberofneuron); 
  
  %net2.trainFcn = 'traingd';
    net2.divideFcn = '';
      net2.inputs{1}.processFcns={};
 net2.outputs{2}.processFcns={};
net2.trainParam.epochs = 1;
net2.trainParam.showWindow = 0;
input2=[];
output2=[];
account2=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%% Set Neural network of user 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 net3 = patternnet(numberofneuron); 
  
  %net3.trainFcn = 'traingd';
    net3.divideFcn = '';
      net3.inputs{1}.processFcns={};
 net3.outputs{2}.processFcns={};
net3.trainParam.epochs = 1;
net3.trainParam.showWindow = 0;
input3=[];
output3=[];
account3=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%% Set neural network of user 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 net4 = patternnet(numberofneuron); 
  
 % net4.trainFcn = 'traingd';
    net4.divideFcn = '';
      net4.inputs{1}.processFcns={};
 net4.outputs{2}.processFcns={};
net4.trainParam.epochs = 1;
net4.trainParam.showWindow = 0;
input4=[];
output4=[];
account4=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net5 = patternnet(numberofneuron);
 
  %net5.trainFcn = 'traingd';
    net5.divideFcn = ''; 
  net5.inputs{1}.processFcns={};
 net5.outputs{2}.processFcns={};
net5.trainParam.epochs = 1;
net5.trainParam.showWindow = 0;
input5=[];
output5=[];
account5=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%% Set neural network of user 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net6 = patternnet(numberofneuron);
   net6.divideFcn = '';
  %net6.trainFcn = 'traingd';
      net6.inputs{1}.processFcns={};
 net6.outputs{2}.processFcns={};
net6.trainParam.epochs = 1;
net6.trainParam.showWindow = 0;
input6=[];
output6=[];
account6=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%% Set neural network of user 7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net7 = patternnet(numberofneuron);
   net7.divideFcn = '';
  %net7.trainFcn = 'traingd';
      net7.inputs{1}.processFcns={};
 net7.outputs{2}.processFcns={};
net7.trainParam.epochs = 1;
net7.trainParam.showWindow = 0;
input7=[];
output7=[];
account7=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%% Set neural network of user 8 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net8 = patternnet(numberofneuron);
   net8.divideFcn = '';
  %net8.trainFcn = 'traingd';
      net8.inputs{1}.processFcns={};
 net8.outputs{2}.processFcns={};
net8.trainParam.epochs = 1;
net8.trainParam.showWindow = 0;
input8=[];
output8=[];
account8=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 9 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net9 = patternnet(numberofneuron);
   net9.divideFcn = '';
%  net9.trainFcn = 'traingd';
      net9.inputs{1}.processFcns={};
 net9.outputs{2}.processFcns={};
net9.trainParam.epochs = 1;
net9.trainParam.showWindow = 0;
input9=[];
output9=[];
account9=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 10 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net10 = patternnet(numberofneuron);
   net10.divideFcn = '';
  %net10.trainFcn = 'traingd';
      net10.inputs{1}.processFcns={};
 net10.outputs{2}.processFcns={};
net10.trainParam.epochs = 1;
net10.trainParam.showWindow = 0;
input10=[];
output10=[];
account10=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%% Set neural network of user 11 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net11 = patternnet(numberofneuron);
  net11.divideFcn = '';
  %net11.trainFcn = 'traingd';
      net11.inputs{1}.processFcns={};
 net11.outputs{2}.processFcns={};
net11.trainParam.epochs = 1;
net11.trainParam.showWindow = 0;
input11=[];
output11=[];
account11=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 12 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net12 = patternnet(numberofneuron);
 net12.divideFcn = '';
  %net12.trainFcn = 'traingd';
      net12.inputs{1}.processFcns={};
 net12.outputs{2}.processFcns={};
net12.trainParam.epochs = 1;
net12.trainParam.showWindow = 0;
input12=[];
output12=[];
account12=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 13 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net13 = patternnet(numberofneuron);
  net13.divideFcn = '';
  %net13.trainFcn = 'traingd';
      net13.inputs{1}.processFcns={};
 net13.outputs{2}.processFcns={};
net13.trainParam.epochs = 1;
net13.trainParam.showWindow = 0;
input13=[];
output13=[];
account13=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 14 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net14 = patternnet(numberofneuron);
  net14.divideFcn = '';
  %net14.trainFcn = 'traingd';
      net14.inputs{1}.processFcns={};
 net14.outputs{2}.processFcns={};
net14.trainParam.epochs = 1;
net14.trainParam.showWindow = 0;
input14=[];
output14=[];
account14=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 15 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net15 = patternnet(numberofneuron);
  net15.divideFcn = '';
  %net15.trainFcn = 'traingd';
      net15.inputs{1}.processFcns={};
 net15.outputs{2}.processFcns={};
net15.trainParam.epochs = 1;
net15.trainParam.showWindow = 0;
input15=[];
output15=[];
account15=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%% Set neural network of user 16 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net16 = patternnet(numberofneuron);
  net16.divideFcn = '';
      net16.inputs{1}.processFcns={};
 net16.outputs{2}.processFcns={};
net16.trainParam.epochs = 1;
net16.trainParam.showWindow = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 17 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net17 = patternnet(numberofneuron);
  net17.divideFcn = '';
      net17.inputs{1}.processFcns={};
 net17.outputs{2}.processFcns={};
net17.trainParam.epochs = 1;
net17.trainParam.showWindow = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Set neural network of user 18 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net18 = patternnet(numberofneuron);
  net18.divideFcn = '';
      net18.inputs{1}.processFcns={};
 net18.outputs{2}.processFcns={};
net18.trainParam.epochs = 1;
net18.trainParam.showWindow = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%










usernumber=9;  % Total number of users that implement FL
 
kk=0;

for userno=6:3:9  % number of RBs or the number of selected users. 

    I=[];
    
     kk=kk+1;
    
     if userno==3
        I=([0.05  0.1 0.14 ]-0.04)*0.000001; % Interference over each RB
     elseif userno==6    
         I=([ 0.05 0.07  0.09  0.11  0.13  0.15]-0.04)*0.000001; % Interference over each RB
     elseif userno==9
         I=([0.03 0.06 0.07 0.08  0.1 0.11 0.12 0.14 0.15]-0.04)*0.000001; % Interference over each RB
     elseif userno==12
          I=([0.03 0.05 0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13 0.14 0.15]-0.04)*0.000001; % Interference over each RB         
     end
 

    RBnumber=length(I);
    
    
    

for average=1:1:averagenumber


d=rand(usernumber,1)*500; % The distance between the users and the BS
q=1-exp(-1.08*(I+10^(-14))/P./d.^(-2)); % Packet error rate of each user over each RB

SINR=P*1*(d(1:usernumber,1).^(-2))./I;  % SINR of each user over each RB
rateu=log2(1+SINR);      % Uplink data rate of each user over each RB

SINRd=(d(1:usernumber,1).^(-2))./Id;  % downlink SINR of each user
rated=20*log2(1+SINRd);               % downlink data rate of each user

Z=39760*16/1024/1024;     % Data size of each FL model, we assume that each element occupies 16 bits 
 delayu=Z./rateu;         % Uplink delay of each user over each RB 
 delayd=Z./rated;         % Downlink delay of each user
 totaldelay=delayu+delayd; %Sum downlink delay of each user
 totalenergy=10^(-27)*40*10^18*Z+P*delayu; %Sum energy consumption of each user
 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Proposed algorithm %%%%%%%%%%%%%%%%%%%%%%%%

if proposed==1

W=zeros(usernumber,RBnumber); % edge matrix for Hungarian algorithm 
   shang=[];
   xia1=[];
   xia2=[];
   
%%%% Set value for each adge according to our equation (24)

for i=1:1:usernumber
    for j=1:1:RBnumber
        
        if totaldelay(i,j)<drequirement && totalenergy(i,j)<erequirement
        
           
             W(i,j)=datanumber(1,i)*(q(i,j)-1);
        end
                 
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Use Hungarian algorithm to find the optimal RB allocation %%%%%%%%%%%
[assignment,result] = munkres(W);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%% Calculate final packet error rate of each user %%%%%%%%%%%
finalq=ones(1,usernumber);

for i=1:1:usernumber
    if assignment(1,i)>0 
       finalq(1,i)=q(i,assignment(1,i));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%% baseline 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if baseline1==1
    
%%%%%%%%%%%%%%%%%% optimal user selection %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W=zeros(usernumber,RBnumber);
   shang=[];
   xia1=[];
   xia2=[];
for i=1:1:usernumber
    for j=1:1:RBnumber
        
        if totaldelay(i,j)<drequirement && totalenergy(i,j)<erequirement
        
           
             W(i,j)=datanumber(1,i)*(q(i,j)-1);
        end
                 
    end
end

[assignment,result] = munkres(W);
qassignment=zeros(1,usernumber);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%% random RB allocation %%%%%%%%%%%%%%%%%%%%%%%%%
if RBnumber<usernumber
    qassignment(1,find(assignment>0))=randperm(RBnumber,RBnumber);
else
   qassignment(1,find(assignment>0))=randperm(RBnumber,usernumber);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%% Calculate final packet error rate of each user %%%%%%%%%%%
finalq=ones(1,usernumber);
finaldelay=zeros(1,usernumber);
for i=1:1:usernumber
    if assignment(1,i)>0 && totaldelay(i,qassignment(1,i))<drequirement && totalenergy(i,qassignment(1,i))<erequirement
       finalq(1,i)=q(i,qassignment(1,i));
      % finaldelay(1,i)=totaldelay(i,qassignment(1,i));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% baseline 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if baseline2==1
    
%%%%%%%%%%%%%%%%%%% random RB allocation and user selection %%%%%%%%%%%%%%
qassignment=zeros(1,usernumber);
assignment=zeros(1,usernumber);
if RBnumber<usernumber
    assignment(1,randperm(usernumber,RBnumber))=1;
    qassignment(1,find(assignment>0))=randperm(RBnumber,RBnumber);
 
else
    assignment(1,:)=1;
   qassignment(1,find(assignment>0))=randperm(RBnumber,usernumber);
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%% Calculate final packet error rate of each user %%%%%%%%%%%
finalq=ones(1,usernumber);
for i=1:1:usernumber
    if assignment(1,i)>0 && totaldelay(i,qassignment(1,i))<drequirement && totalenergy(i,qassignment(1,i))<erequirement
       finalq(1,i)=q(i,qassignment(1,i));
    end
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% baseline 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if baseline3==1
 
%%%%%%%%% minimize packet error rate without considering FL performance     
W=zeros(usernumber,RBnumber);
   shang=[];
   xia1=[];
   xia2=[];
for i=1:1:usernumber
    for j=1:1:RBnumber
        
        if totaldelay(i,j)<drequirement && totalenergy(i,j)<erequirement
        
           
             W(i,j)=q(i,j);
        end
                 
    end
end

[assignment,result] = munkres(W);
qassignment=zeros(1,usernumber);

if RBnumber<usernumber
    qassignment(1,find(assignment>0))=randperm(RBnumber,RBnumber);
else
   qassignment(1,find(assignment>0))=randperm(RBnumber,usernumber);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Calculate final packet error rate of each user %%%%%%%%%%%
finalq=ones(1,usernumber);
for i=1:1:usernumber
    if assignment(1,i)>0 && totaldelay(i,qassignment(1,i))<drequirement && totalenergy(i,qassignment(1,i))<erequirement
       finalq(1,i)=q(i,qassignment(1,i));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


w=[];                   %hidden layer weights
lw=[];                  %output layer weights
b=[];                   %hidden layer bias
ob=[];                  %output layer bias
wglobal=[];             % global hidden layer weights
lwglobal=[];            %global output layer weights
bglobal=[];            %global hidden layer bias
obglobal=[];            %global outlayer layer bias


bb=zeros(iteration,usernumber);
error=zeros(iteration,1);
iterationtime=zeros(iteration,1);


%%%%%%%%% initialize the neural network of each user %%%%%%%%%%%%%%%%%%%
for user=1:1:usernumber
    
    Winstrclear=strcat('net',int2str(user));
     eval(['netvaluable','=',Winstrclear,';']);    
    
     netvaluable=init(netvaluable);
     
     eval([Winstrclear,'=','netvaluable',';']);    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if length(find(finalq<1))>0
    
for i=1:1:iteration


for user=1:1:usernumber
  
    
%%%%%%%%%%%%%%%%% train each neural network %%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    if  (i==1&&finalq(1,user)~=1) || rand(1)>finalq(1,user) % Since each user a packet error rate, we randomly choose a value...
                               % If this value is larger than the packet error rate, then this user will join this FL iteration.
        bb(i,user)=1; %% bb=1 implies that user $user$ will join the FL training process at iteration i
    
        x1=trainingdata(sum(datanumber(1,1:user-1))+1:sum(datanumber(1,1:user)),:); %Set input data
        y1=traingnd(sum(datanumber(1,1:user-1))+1:sum(datanumber(1,1:user)),:);     %Set output data
    
    clear netvaluable;
    Winstr1=strcat('net',int2str(user)); 
     eval(['netvaluable','=',Winstr1,';']);
    
if i > 1
% Change each user' local FL model to global FL model
    netvaluable.IW{1,1}=wglobal; 
    netvaluable.LW{2,1}=lwglobal;
     netvaluable.b{1,1}=bglobal;
     netvaluable.b{2,1}=obglobal; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%               
end


[netvaluable,tr] =  train(netvaluable,x1',y1');  %% tarain local FL model of each user

%%%%%%%%% initialize the gloabal FL model %%%%%%%%%%%%%%%%%%%

if i==1
       wglobal=zeros(size(netvaluable.IW{1,1}));
    lwglobal=zeros(size(netvaluable.LW{2,1}));
    bglobal=zeros(size(netvaluable.b{1,1}));
    obglobal=zeros(size(netvaluable.b{2,1}));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%% record the local FL model of each user %%%%%%%%%%%%%%%%%%%
w(:,:,user)=netvaluable.IW{1,1};

lw(:,:,user)=netvaluable.LW{2,1};

b(:,:,user)=netvaluable.b{1,1};
ob(:,:,user)=netvaluable.b{2,1};

eval([Winstr1,'=','netvaluable',';']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end


end


%%%%%%%%%%%%%%%%%%%%%%%%%% calculate the global FL model %%%%%%%%%%%%%%%%%
finalb=find(bb(i,:)>0); %% calculate the number of users join the FL iteration i

if length(finalb)>0
   wglobal1=zeros(size(w(:,:,1))); %initialize these matirces used for global FL model update
   lwglobal1=zeros(size(lw(:,:,1)));
    bglobal1=zeros(size(b(:,:,1)));
    obglobal1=zeros(size(ob(:,:,1)));
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%calculate the sum of local FL models %%%%%%%%%%%%%%%%%%%%%%%%%%   
    for jj=1:1:length(finalb)
      
  wglobal1=wglobal1+w(:,:,finalb(jj))*datanumber(1,finalb(jj));  
  lwglobal1=lwglobal1+lw(:,:,finalb(jj))*datanumber(1,finalb(jj)); 
  bglobal1=bglobal1+b(:,:,finalb(jj))*datanumber(1,finalb(jj));
  obglobal1=obglobal1+ob(:,:,finalb(jj))*datanumber(1,finalb(jj));
    end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%% divide the total number of data samples %%%%%% 
  wglobal=wglobal1/sum(datanumber(1,finalb)) ;  
  lwglobal=lwglobal1/sum(datanumber(1,finalb)); 
  bglobal=bglobal1/sum(datanumber(1,finalb));
  obglobal=obglobal1/sum(datanumber(1,finalb)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end



%%%%%%%%%%%% calculate the prediction errors at iteration i %%%%%%%%%%%%%%%
if length(finalb)>0
Winstr1=strcat('net',int2str(finalb(1)));
 eval(['netvaluable10','=',Winstr1,';']);

%%%%%%%%%%%%%%% change the weights of one user's neural network to global FL model weights  
 netvaluable10.IW{1,1}=wglobal;
    netvaluable10.LW{2,1}=lwglobal;
     netvaluable10.b{1,1}=bglobal;
     netvaluable10.b{2,1}=obglobal; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
     
%%%%%%%%%%%% calculate the errors %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
 [nn,mm]=max(netvaluable10(testdata(1:10000,:)'));
   oo=mm'-testgnd(1:10000,:);
    
    error(i,1)=length(find(oo~=0))/10000;
%%% Here, we need to note that, this is identification errors instead of identification accuracy
%%% identification accuracy=1-error;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
     error(i,1)= error(i-1,1);
end


end
end

    averageerror(average,kk)=error(iteration);
end

finalerror(kk,1)=sum(averageerror(:,kk))/averagenumber;
end