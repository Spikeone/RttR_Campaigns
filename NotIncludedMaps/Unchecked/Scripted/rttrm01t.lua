rttr.Log("script started")

t1="Return to the Roots Campaign - I (20150823)"
m1="Welcome to the Return to the Campaign. This campaign was made by the\nReturn to the Roots team.\nPlease remember that LUA is still a work in progress feature! You can\nnot save your progress and have to finish a mission in one session!\n\nHave fun and report any Problems!\n"
m2="You:\nFinally I'm home after years of fighting, can see my strong son and\nhold my wife in my arms\n\nPeasant(Out of breath):\nMaster... I... I...\n\nYou:\nWhat is it?\n\nPeasant:\nOur village, some devils are raiding it.\n"
m3="You:\nFellow citizens, to arms!\n\nPeasants:\nWe have no weapons, only some broken scythes...\n\nYou:\nThat's not enough to fight hell, what should we do?\n"
m4="The dusk slowly settles, the hot burning fires estinguish...\nYour eyes skim over your once beloved village, nothing is left. But\nsuddenly you spot some corpse, of a beautiful women. As you slowly\naproach the poor soul lying there, it's head torn off, you burst\ninto tears as you remember the necklace visible.\nAfter some minutes, maybe hours sitting idle and gripped by the sight\na man slowly comes closer.\n He tells you, that they have taken most\nwomen to their camp, as they were leaving northwards. He then stops\nfor a moment and tells you halting, that they have also taken a boy\nwith them.\nYou jump up from your spot, roar into the sky, clench your fist and\nwhisper 'Too long I waited, but thats over, they will pay, they will\npay a lot for their faults'\n"
m5="You:\nMy son, he was with them, they passed a strange gate.\n\nMilitia:\nMaybe we should spare the live of those innocent people then.\nThere are some women and children as well, I don't think, that they\nhave been raiding your village as well.\n\nYou:\nYou may be right, you may be wrong...\n\n"
m6="You reach the gate and use it without hesitating.\nPlease write down the following values!\nKarma:\nPositive: "
m62="\nNeutral: "
m63="\nNegative: "
e1="You found some tracks, they lead to the north east. You should follow\nthem to get your revenge.\n"
e2="You found some tracks, they lead to the east. You should follow\nthem to get your revenge.\n"
e3="You found some tracks, they lead to the south east. You should follow\nthem to get your revenge.\n"

g1="Thats my old friend, I guess he can trade me some beer for gold. I\nneed to rise an army to fight those devils.\n"
g2="We found soem gold, maybe we can trade that for beer so we can\nrise an army.\n"
g3="Vendor:\nMy brother was always fishing but now his small village is lost and\nI have to help him.\n\nYou:\nWell I may help you as well, I could...\n\nVendor:\nNo thanks, you are the reason for this misery. You will pay twice\nthe price.\n\nYou:\nBut I have to find my son!\n\nVendor:\nEverybody pays a price, maybe you should pay more and innocent\npeople should pay less.\n"
g4="You bought some\nBeer. Amount: "
----------------------------------------------------------------------
n1="Your scouts discovered a strange nation. They seem friendly and not\nagressive in any way.\nAlso they are just fisihing.\n"
n2="Please stop fishing"
n3="Your scouts report, that the neutral village has grown a bit.\n"
n4="Gift for not fishing\nFish: "
n5="Your scouts report, that the neutral village has been abandoned by\nit's owner. They left withouth leaving anything behind.\n"

l1="Location"

nn=0
ns=0
nb=0

kb=0
kp=0
kn=0

p=0
g=0
el={0,0,0,0}
pr=1
lg=0
cg=0

--START | END | STEPS | 
ga={2500,2507,1,2508,2515,1,6000,6009,0}
--X | Y | ACTIVE | STEP | ID
gl={25,73,0,0,1, 28,55,0,4,1, 25,68,0,1,0, 22,67,0,2,0, 22,63,0,3,0, 25,56,0,4,0, 27,66,0,5,0, 25,61,0,6,0, 55,62,1,0,2}

ASO=rttr.AddStaticObject
AEO=rttr.AddEnvObject
MS=rttr.MissionStatement
PML=rttr.PostMessageWithLocation
GWC=rttr.GetWareCount
AW=rttr.AddWares
GBC=rttr.GetBuildingCount
PM=rttr.PostMessage
DB=rttr.DisableBuilding
EB=rttr.EnableBuilding
CR=rttr.ClearResources
AP=rttr.AddPeople

function onStart()
    DB(0)
    DB(1,9,16,21,27,28,34,36,38,39)
    
    CR(0)
    CR(1)

    ASO(25,73,4,2)
    ASO(28,55,2,2)

    ASO(25,68,0,2)
    ASO(22,67,0,2)
    ASO(22,63,0,2)
    ASO(25,56,0,2)
    ASO(27,66,0,2)
    ASO(25,61,0,2)

    AEO(26,37,8,2)
    AEO(44,33,8,2)
    AEO(64,32,8,2)

    ASO(26,16,6,0)

    ASO(95,92,560,0xFFFF,2)

    AW(1,22,24,23,44,24,68,19,4,20,8,31,16,30,16,3,6,4,2,5,2,2,6,6,4,7,4,8,6,9,8,13,4,14,2)
    AP(1,0,75,19,10,20,6,1,8,3,4,5,4,6,4,4,4,11,10,18,4,17,2,26,6,28,2,21,32)

    AW(0,22,12,23,22,24,34,19,2,20,4,31,8,30,8,3,3,4,1,5,1,2,8,6,2,7,2,8,6,9,6,13,2,14,0)
    AP(0,0,25,19,5,20,3,1,4,3,2,5,2,6,2,4,2,11,6,18,2,17,1,26,4,28,1,21,16)
end

function onGameFrame(gf)
    if((gf%4)==0) then
        for i=0, (#gl/5)-1 do
            if(gl[3+i*5]==1) then
                if(ga[1+gl[5+i*5]*3]+gl[4+i*5] > ga[2+gl[5+i*5]*3]) then
                    gl[4+i*5]=0
                end
                rttr.AddStaticObject(gl[1+i*5],gl[2+i*5],ga[1+gl[5+i*5]*3]+gl[4+i*5],0xFFFF)
                gl[4+i*5]=gl[4+i*5]+ga[3+gl[5+i*5]*3]
            end
        end
    end
	
    if((gf%100)~=0) then
    return
    end

    if(ns==0 and gf>15000) then
    ns=1
    MS(0,t1,n1)
    PML(0,55,62,l1)
    end

    if p==0 then
        p=1
        MS(0,t1,m1)

    elseif (p==1 and gf > 500) then
        p=2
        MS(0,t1,m2)
        gl[3]=1
        gl[8]=1
        gl[13]=1
        gl[18]=1
        gl[23]=1
        gl[28]=1
        gl[33]=1
        gl[38]=1
    elseif (p==2 and gf > 1000) then
        p=3
        MS(0,t1,m3)
    elseif (p==3 and gf > 1500) then
        p=4
        MS(0,t1,m4)
EB(0,1,2,4,10,11,12,13,18,19,20,22,24,25,26,29,31,32,33,35,37)
gl[3]=0
gl[8]=0
gl[13]=0
gl[18]=0
gl[23]=0
gl[28]=0
gl[33]=0
gl[38]=0
AEO(25,73,2525)
AEO(28,55,2525)

AEO(25,68,2524)
AEO(22,67,2524)
AEO(22,63,2524)
AEO(25,56,2524)
AEO(27,66,2524)
AEO(25,61,2524)

AEO(23,61,547)
AEO(25,69,547)
AEO(32,62,547)
AEO(29,56,547)
AEO(20,63,547)

AEO(25,60,548)
AEO(28,64,548)
AEO(34,68,548)
AEO(25,55,548)
AEO(27,52,548)
    elseif(p==6) then
    if(GBC(1,0)==0)then
    kb=kb+1
    else
    kp=kp+1
    end
    if(nb>=5) then
    kb=kb+1
    else
    kp=kp+1
    end
    p=7
    MS(0,t1,m6,kp,m62,kn,m63,kb)
    end

    if((gf%1000)~=0) then
    return
    end

    if(ns==1 and nf==1) then
        PM(0,n4,nn)
        AW(0,19,nn)
    end

    if((gf%5000)~=0) then
    return
    end

    if(g==1) then
        cg=GWC(0,29)
        AW(0,0,((cg-lg)*pr))
        --MS(0,t1,g1,((cg-lg)*pr))
        PM(0,g4,((cg-lg)*pr))
        lg=cg
    end
    if(ns==1 and nb < 5) then
        if(GBC(0,18)>0) then
            MS(0,t1,n2)
            nb=nb+1
            nf=0
        else
            nf=1
            if(gl[44] < ga[8]-ga[7]) then
                MS(0,t1,n3)
                nn=nn+1
                gl[44]=nn
            end
        end
    elseif (nb >= 5) then
        MS(0,t1,n5)
        PML(0,55,62,l1)
        PM(0,g3)
        pr=0.5
        ns=0
        gl[43]=0
        AEO(55,62,2524)
        if(nn>2) then
        AEO(52,61,2524)
        end
        if(nn>5) then
        AEO(53,57,2524)
        end
        if(nn>8) then
        AEO(55,54,2524)
        end
    end


end

function onExplored(pl, ex, ey)
if(pl~=0) then
return
end

if(ex==26 and ey==37 and el[1]==0) then
MS(0,t1,e1)
el[1]=1
PML(0,el,ey,l1)
elseif(ex==44 and ey==33 and el[2]==0) then
MS(0,t1,e2)
el[2]=1
PML(0,el,ey,l1)
elseif(ex==64 and ey==32 and el[3]==0) then
MS(0,t1,e3)
el[3]=1
PML(0,el,ey,l1)
elseif(ex==26 and ey==16 and el[4]==0) then
g=1
el[4]=1
MS(0,t1,g1)
PML(0,ex,ey,l1)
end
end

function onResourceFound(rp, rx, ry, rt, rq)
if(rp~=0) then
return
end

if(g~=1 and rt==1) then
MS(0,t1,g2)
end

if(p==4) then
p=5
MS(0,t1,m5)
end
end

function onOccupied(op, ox, oy)
if(op~=0) then
return
elseif(ox==95 and oy==92 and p==5) then
ASO(ox,oy,561,0xFFFF,2)
p=6
end
end