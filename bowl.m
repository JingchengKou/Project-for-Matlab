%%We start this problem with a tutorial on North America?s most popular bowling game. In it contestants attempt to knock down as many as possible of ten pins that are standing at one end of an alley by rolling balls at them from the other end. A bowling game consists of ten ?frames? for each player, and each player?s frame except for the tenth consists of either one or two attempts to knock down the pins. After each player?s frame is complete, all ten pins are set up again. The pins knocked down by one player have no effect on the other player. They could in fact compete on separate alleys.
%%Frames are of different types. A frame in which all ten pins are knocked down by the first ball is a ?strike?, and after a strike the second ball of the frame is omitted. A frame in which all ten pins are knocked down with two balls (the first ball having left some standing) is a ?spare?. A frame with fewer than ten pins down is an ?open?. A spare in the tenth frame earns the bowler one ?bonus? ball for that frame, which is simply an extra ball; a strike in the tenth earns two bonus balls, and if the first of these two extra balls knocks everything down, all ten pins are set up again for the second ball.
%%A player?s score is computed as follows. A strike counts 10 points plus the sum of the pins knocked down by the next two balls (which may include balls from the next two frames). A spare counts 10 points plus the pins knocked down by the next ball. An open counts the number of pins knocked down in that frame. A bonus ball counts the number of pins it knocked down. 

function[scores]=bowl(B)
scores=0;
X=B>10;  % To make sure every element in B is smaller than 10
Y=B<0;   % To make sure all the elements are positive
%% To maker sure the array is a valid sequence
if length(B)<12  
   scores=-1;
   return;
elseif sum(X)>0 || sum(Y)>0
    scores=-1;
    return;
end
n=0;  % n is the update number to help get the index of the element in the frame
for i=1:9
    if B(i+n)+B(i+n+1)==10
        scores=scores+10+B(i+n+2);
        n=n+1;
    elseif B(i+n)==10
        scores=scores+10+B(i+n+1)+B(i+n+2);
    elseif B(i+n)+B(i+n+1)<10
        scores=scores+B(i+n)+B(i+n+1);
        n=n+1;
    end

end

%% To get the points of the 10th frame
if length(B)<11+n || (B(10+n)+B(10+n+1)>10 && B(10+n)~=10)  %To make sure the 10th frame is a vaild element
    scores=-1;
    return;
elseif B(10+n)+B(10+n+1)==10
    if length(B)~=12+n
        scores=-1;
        return;
    end
    scores=scores+10+B(12+n);
elseif B(10+n)==10
    if length(B)~=12+n
        scores=-1;
        return;
    end
    scores=scores+10+B(11+n)+B(12+n);
elseif B(10+n)+B(10+n+1)<10
    if length(B)>11+n
        scores=-1;
        return;
    end
    scores=scores+B(10+n)+B(11+n);
end
end