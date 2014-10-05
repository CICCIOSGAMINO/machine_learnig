clear all ;

# get the numbers of training point (this space f -> line we chosen)
N = input( 'Enter # of training points N : ' ) ;

# get N uniform random points on the interval [ -1 1 ] x [ -1 1 ]
x_axis = ( rand( N , 1 ) .- 0.5 ) .* 2 ;
y_axis = ( rand( N , 1 ) .- 0.5 ) .* 2 ;

# other two points for separating line (our f for this space X)
points_x = ( rand( 2 , 1 ) .- 0.5 ) .* 2 ;
points_y = ( rand( 2 , 1 ) .- 0.5 ) .* 2 ;

# fit a straight line to these two separating points
# Formulating a matrix for solving for least squares estimate
X = [ points_x ones( 2 , 1 ) ] ;
alpha = inv( X' * X ) * X' * points_y;

# construct a straight line
yEst = alpha(1) .* x_axis .+ alpha(2) ;

# allocate points on or above line +1
plus_one = ( y_axis >= yEst ) ;
# and below -1
minus_one = ( y_axis < yEst ) .* -1 ;

# classification labels
labels = plus_one .+ minus_one ;

# visualise the points

[ i_plus j ] = find( labels == 1 ) ;      % get index for +1
[ i_minus j ] = find( labels == -1 ) ;      % get index for -1

#########################  plot the result ################################
clf ;
hold on ;
plot( x_axis(i_plus) , y_axis(i_plus) , 'x' ) ; % plot +1 points as blue x
plot( x_axis(i_minus) , y_axis(i_minus) , "@11" ) ; % plot -1 points as red +

######################### built the matrix ################################

disp ("Positive Points : "), disp (size(x_axis(i_plus),1))
disp ("Negative Points : "), disp (size(x_axis(i_minus),1))

######################### data for perceptor ###############################

w = [-10 ; 20 ; 0];
Y = labels';
X = [[x_axis y_axis labels]'];


######################### call the perceptron ##############################
[wtag, c]=perceptron(X,Y,w);
% predict
ytag=wtag'*X;

disp ("Vectror w :"), disp (wtag)



#################### plot section ########################

% plot prediction over origianl data
figure;hold on
plot(x_axis(1,:),x_axis(2,:),'b.')
plot(y_axis(1,:),y_axis(2,:),'r.')

% get out the points (+1), (-1)
Xminus = size([X(2,ytag<0)],2);
Xplus = size([X(2,ytag>0)],2);

plot(X(1,ytag<0),X(2,ytag<0),'bo')
plot(X(1,ytag>0),X(2,ytag>0),'ro')
legend('class -1','class +1','pred -1','pred +1')

#####################  show the Result  ###################

disp ("The Number of (+) Points :"), disp (Xplus)
disp ("The Number of (-) Points :"), disp (Xminus)

##################### iteratio number #####################

disp ("Iteration : "), disp (c)
