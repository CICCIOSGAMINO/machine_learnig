#############################################################
#  simple perceptron example test - perceptron(X,y,w_init)  #
#############################################################

clear all;

X1=[rand(1,10);rand(1,10);ones(1,10)];         % class '+1'
X2=[rand(1,10);1 + rand(1,10);ones(1,10)];     % class '-1'
X=[X1,X2];

% output class [-1,+1];
Y=[-ones(1,10),ones(1,10)];

% init weigth vector
w=[0 0 0]';

% call perceptron
wtag=perceptron(X,Y,w);
% predict
ytag=wtag'*X;


#################### plot section ########################

% plot prediction over origianl data
figure;hold on
plot(X1(1,:),X1(2,:),'b.')
plot(X2(1,:),X2(2,:),'r.')

% get out the points (+1), (-1)
Xplus = size([X(1,ytag<0) X(2,ytag<0)],2);
Xminus = size([X(1,ytag>0) X(2,ytag>0)],2);

plot(X(1,ytag<0),X(2,ytag<0),'bo')
plot(X(1,ytag>0),X(2,ytag>0),'ro')
legend('class -1','class +1','pred -1','pred +1')

#####################  show the Result  ###################

disp ("The Number of (+) Points :"), disp (Xplus)
disp ("The Number of (-) Points :"), disp (Xminus)
