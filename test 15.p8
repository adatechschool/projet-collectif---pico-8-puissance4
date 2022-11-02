pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- init game 1+2
--(appelee 1 fois au debut du jeu)

-- gestion alternance menu-jeu

function _init()
music(4,0)
scene="menu"
end

timing = 0.1

-- variables communes

local cs = 128/8

local br={}
x =50
y =50
br_sprite=164

local av={}
x =58
y =50
av_sprite=166

local o={}
x =66
y =50
o_sprite=168

local w1={}
x = 60
y = 85
w1_sprite= 139

local w2={}
x = 60
y = 85
w2_sprite= 155

--creation variables game 1

local grid = {}
for l=1,8 do
 grid[l] = {}
 for c=1,8 do
  grid[l][c] = 0
 end
end

local p1={}
p1.c = 7
p1.l = 1
p1_sprite=130
p1_playing = true

local p2 = {}
p2.c = 1
p2.l = 1
p2_sprite = 146
p2_playing = false -- (pourrait etre true, ca sera gere plus tard)

-- creation variables game 2

local gridm = {}
for lm=1,8 do
 gridm[lm] = {}
 for cm=1,8 do
  gridm[lm][cm] = 0
 end
end

local p1m={}
p1m.cm = 7
p1m.lm = 7
p1m_sprite=130
p1m_playing = true

local p2m = {}
p2m.cm = 1
p2m.lm = 7
p2m_sprite = 146
p2m_playing = false





-->8
-- update
--(appelee 30 fois/sec) 

function _update()
	if scene=="menu" then
	 update_menu()
	elseif scene=="game1" then
	 update_game1()
	elseif scene=="game2" then
	 update_game2()
	end
	w1_sprite+=1*(timing*4)
		if w1_sprite > 142 then
			w1_sprite = 139
		end
	w2_sprite+=1*(timing*4)
		if w2_sprite > 158 then
			w2_sprite = 155
		end	
	br_sprite+=1
		if br_sprite > 165 then
			br_sprite = 164
		end
	av_sprite+=1
		if av_sprite > 167 then
			av_sprite = 166
		end
	o_sprite+=1
		if o_sprite > 169 then
			o_sprite = 168
		end
end

function update_menu()
   if btnp(5) then
    scene="game1"
    elseif btnp(4) then 
     scene="game2"
    end
end


-->8
-- update game 1

function update_game1()
	if btnp(5,1) then
       scene="menu"
 end           
	update_p1()
	update_p2()
end	


function update_p1()
 if btnp(0,0) then
  if p1.c > 1 then
   			p1.c -=1
 	end
 end
 if btnp(1,0) then
 if p1.c < 7 then
    	p1.c +=1
 	end
 end
 if btnp(3,0) then
 	if grid[7][p1.c] == 0
 	 and p1_playing==true then
  		grid[7][ p1.c] = 1
  		p1_playing=false
   	p2_playing=true
   	sfx(-1)
   	sfx (6,0)
		 elseif grid[6][p1.c] == 0
		  and p1_playing==true then
	    grid[6][ p1.c] = 1
	  		p1_playing=false
	   	p2_playing=true
	   	sfx(-1)
	   	sfx (6,0)
	  elseif grid[5][p1.c] == 0
	   and p1_playing==true then
	    grid[5][ p1.c] = 1
	  		p1_playing=false
	   	p2_playing=true
	   	sfx(-1)
	   	sfx (6,0)
	  elseif grid[4][p1.c] == 0
	   and p1_playing==true then
	    grid[4][ p1.c] = 1
	  	 p1_playing=false
	   	p2_playing=true
	   	sfx(-1)
	   	sfx (6,0)
		 elseif grid[3][p1.c] == 0
		  and p1_playing==true then
		   grid[3][ p1.c] = 1
		   p1_playing=false
		   p2_playing=true
		   sfx(-1)
		   sfx (6,0)
	  elseif grid[2][p1.c] == 0
	   and p1_playing==true then
	    grid[2][ p1.c] = 1
	  		p1_playing=false
	   	p2_playing=true
	   	sfx(-1)
	   	sfx (6,0)  
		end
	end
 if p1_playing==true then
 	p1_sprite+=1*(timing*4)
	 else if p1_playing==false then
 		p1_sprite+=1*timing
		end 
 end
	if p1_sprite > 135 then
		p1_sprite = 130
	end
end

function update_p2()
 if btnp(0,1) then
   if p2.c > 1 then
   			p2.c -=1
  end
 end
	if btnp(1,1) then
 if p2.c < 7 then
    		p2.c +=1
  end
end
 if btnp(3,1) then
 	if grid[7][p2.c] == 0 and p2_playing==true then
  			 grid[7][p2.c] = 2
  			 p2_playing=false
   			p1_playing=true
   			sfx(-1)
   			sfx (2,0)
elseif grid[6][p2.c] == 0 and p2_playing==true then
     grid[6][p2.c] = 2
  			 p2_playing=false
   			p1_playing=true
   			sfx(-1)
   			sfx (2,0)
  elseif grid[5][p2.c] == 0 and p2_playing==true then
     grid[5][p2.c] = 2
  			p2_playing=false
   			p1_playing=true
   			sfx(-1)
   			sfx (2,0)
  elseif grid[4][p2.c] == 0 and p2_playing==true then
     grid[4][p2.c]= 2
  			 p2_playing=false
   			p1_playing=true
   			sfx(-1)
   			sfx (2,0)
 elseif grid[3][p2.c] == 0 and p2_playing==true then
     grid[3][p2.c] = 2
  			 p2_playing=false
   			p1_playing=true
   			sfx(-1)
   			sfx (2,0)
  elseif grid[2][p2.c] == 0 and p2_playing==true then
     grid[2][p2.c] = 2
  			p2_playing=false
   			p1_playing=true
   			sfx(-1)
   			sfx (2,0)
  end
 end
   
 if p2_playing==true then
 	p2_sprite+=1*(timing*4) 
 else if p2_playing==false then
 	p2_sprite+=1*timing
 end
 end
 
if p2_sprite > 151 then
						p2_sprite =146
		end  
end

function winner_p1()
	for l=2,7 do
		if grid[l][7]==1
			and grid[l][6]==1  
			and grid[l][5]==1
			and grid[l][4]==1 then
				win_p1()
		elseif grid[l][6]==1  
			and grid[l][5]==1
			and grid[l][4]==1
			and grid[l][3]==1 then
				win_p1()
		elseif grid[l][5]==1
			and grid[l][4]==1
			and grid[l][3]==1
			and grid[l][2]==1 then
				win_p1()
		elseif grid[l][4]==1
			and grid[l][3]==1
			and grid[l][2]==1
			and grid[l][1]==1  then
				win_p1()
		end 
	end
	for c=1,7 do
		if  grid[2][c]==1  
			and grid[3][c]==1
			and grid[4][c]==1 
			and grid[5][c]==1 then
				win_p1()
		elseif grid[3][c]==1
			and grid[4][c]==1 
			and grid[5][c]==1
			and grid[6][c]==1 then
				win_p1()
		elseif			grid[4][c]==1
			and grid[5][c]==1  
			and grid[6][c]==1
			and grid[7][c]==1 then
				win_p1()
		end
	end
	if grid[7][p1.c]==1
  and grid[6][p1.c+1]==1
  and grid[5][p1.c+2]==1
  and grid[4][p1.c+3]==1	then
   win_p1()
 elseif grid[6][p1.c]==1
  and grid[5][p1.c+1]==1
  and grid[4][p1.c+2]==1
  and grid[3][p1.c+3]==1	then
   win_p1() 
 elseif grid[5][p1.c]==1
  and grid[4][p1.c+1]==1
  and grid[3][p1.c+2]==1
  and grid[2][p1.c+3]==1	then
   win_p1() 	
 elseif grid[7][p1.c]==1
  and grid[6][p1.c-1]==1
  and grid[5][p1.c-2]==1
  and grid[4][p1.c-3]==1	then
   win_p1()
 elseif grid[6][p1.c]==1
  and grid[5][p1.c-1]==1
  and grid[4][p1.c-2]==1
  and grid[3][p1.c-3]==1	then
   win_p1() 
 elseif grid[5][p1.c]==1
  and grid[4][p1.c-1]==1
  and grid[3][p1.c-2]==1
  and grid[2][p1.c-3]==1	then
 		win_p1() 
 elseif grid[2][p1.c]==1
  and grid[3][p1.c-1]==1
  and grid[4][p1.c-2]==1
  and grid[5][p1.c-3]==1	then
   win_p1()
 elseif grid[3][p1.c]==1
  and grid[4][p1.c-1]==1
  and grid[5][p1.c-2]==1
  and grid[6][p1.c-3]==1	then
   win_p1() 
 elseif grid[4][p1.c]==1
  and grid[5][p1.c-1]==1
  and grid[6][p1.c-2]==1
  and grid[7][p1.c-3]==1	then
   win_p1()
 elseif grid[2][p1.c]==1
  and grid[3][p1.c+1]==1
  and grid[4][p1.c+2]==1
  and grid[5][p1.c+3]==1	then
   win_p1()
 elseif grid[3][p1.c]==1
  and grid[4][p1.c+1]==1
  and grid[5][p1.c+2]==1
  and grid[6][p1.c+3]==1	then
   win_p1()
 elseif grid[4][p1.c]==1
  and grid[5][p1.c+1]==1
  and grid[6][p1.c+2]==1
  and grid[7][p1.c+3]==1	then
   win_p1()
 elseif grid[3][p1.c]==1
  and grid[2][p1.c-1]==1
  and grid[4][p1.c+1]==1
  and grid[5][p1.c+2]==1	then
   win_p1()
 elseif grid[4][p1.c]==1
  and grid[3][p1.c-1]==1
  and grid[5][p1.c+1]==1
  and grid[6][p1.c+2]==1	then
   win_p1()
 elseif grid[5][p1.c]==1
  and grid[4][p1.c-1]==1
  and grid[6][p1.c+1]==1
  and grid[7][p1.c+2]==1	then
   win_p1()
 elseif grid[4][p1.c]==1
  and grid[3][p1.c-1]==1
  and grid[2][p1.c-2]==1
  and grid[5][p1.c+1]==1	then
   win_p1() 
	elseif grid[5][p1.c]==1
  and grid[4][p1.c-1]==1
  and grid[3][p1.c-2]==1
  and grid[6][p1.c+1]==1	then
   win_p1()
	elseif grid[6][p1.c]==1
  and grid[5][p1.c-1]==1
  and grid[4][p1.c-2]==1
  and grid[7][p1.c+1]==1	then
   win_p1()
 elseif grid[4][p1.c]==1
  and grid[5][p1.c-1]==1
  and grid[3][p1.c+1]==1
  and grid[2][p1.c+2]==1	then
   win_p1()
 elseif grid[5][p1.c]==1
  and grid[6][p1.c-1]==1
  and grid[4][p1.c+1]==1
  and grid[3][p1.c+2]==1	then
   win_p1()  
	elseif grid[6][p1.c]==1
  and grid[7][p1.c-1]==1
  and grid[5][p1.c+1]==1
  and grid[4][p1.c+2]==1	then
   win_p1()
	elseif grid[5][p1.c]==1
  and grid[6][p1.c-1]==1
  and grid[7][p1.c+2]==1
  and grid[4][p1.c+1]==1	then
   win_p1()
	elseif grid[4][p1.c]==1
  and grid[5][p1.c-1]==1
  and grid[6][p1.c+2]==1
  and grid[3][p1.c+1]==1	then
   win_p1()
	elseif grid[3][p1.c]==1
  and grid[4][p1.c-1]==1
  and grid[5][p1.c+2]==1
  and grid[2][p1.c+1]==1	then
   win_p1()   						 		 		 		
	end
end


function winner_p2()
	for l=2,7 do
		if grid[l][7]==2
			and grid[l][6]==2  
			and grid[l][5]==2
			and grid[l][4]==2 then
				win_p2()
		elseif grid[l][6]==2  
			and grid[l][5]==2
			and grid[l][4]==2
			and grid[l][3]==2 then
				win_p2()
		elseif grid[l][5]==2
			and grid[l][4]==2
			and grid[l][3]==2
			and grid[l][2]==2 then
				win_p2()
		elseif grid[l][4]==2
			and grid[l][3]==2
			and grid[l][2]==2
			and grid[l][1]==2  then
				win_p2()
		end 
	end
	for c=1,7 do
		if  grid[2][c]==2  
			and grid[3][c]==2
			and grid[4][c]==2 
			and grid[5][c]==2 then
				win_p2()
		elseif grid[3][c]==2
			and grid[4][c]==2 
			and grid[5][c]==2
			and grid[6][c]==2 then
				win_p2()
		elseif grid[4][c]==2
			and grid[5][c]==2  
			and grid[6][c]==2
			and grid[7][c]==2 then
				win_p2()
		end
	end
	if grid[7][p2.c]==2
		and grid[6][p2.c+1]==2
		and grid[5][p2.c+2]==2
		and grid[4][p2.c+3]==2	then
			win_p2()
	elseif grid[6][p2.c]==2
		and grid[5][p2.c+1]==2
		and grid[4][p2.c+2]==2
		and grid[3][p2.c+3]==2	then
			win_p2()
	elseif grid[5][p2.c]==2
		and grid[4][p2.c+1]==2
		and grid[3][p2.c+2]==2
		and grid[2][p2.c+3]==2	then
			win_p2() 	
	elseif grid[7][p2.c]==2
		and grid[6][p2.c-1]==2
		and grid[5][p2.c-2]==2
		and grid[4][p2.c-3]==2	then
			win_p2()
	elseif grid[6][p2.c]==2
		and grid[5][p2.c-1]==2
		and grid[4][p2.c-2]==2
		and grid[3][p2.c-3]==2	then
			win_p2() 
	elseif grid[5][p2.c]==2
		and grid[4][p2.c-1]==2
		and grid[3][p2.c-2]==2
		and grid[2][p2.c-3]==2	then
			win_p2() 
	elseif grid[2][p2.c]==2
		and grid[3][p2.c-1]==2
		and grid[4][p2.c-2]==2
		and grid[5][p2.c-3]==2	then
			win_p2()
	elseif grid[3][p2.c]==2
		and grid[4][p2.c-1]==2
		and grid[5][p2.c-2]==2
		and grid[6][p2.c-3]==2	then
			win_p2() 
	elseif grid[4][p2.c]==2
		and grid[5][p2.c-1]==2
		and grid[6][p2.c-2]==2
		and grid[7][p2.c-3]==2	then
			win_p2()
	elseif grid[2][p2.c]==2
		and grid[3][p2.c+1]==2
		and grid[4][p2.c+2]==2
		and grid[5][p2.c+3]==2	then
			win_p2()
	elseif grid[3][p2.c]==2
		and grid[4][p2.c+1]==2
		and grid[5][p2.c+2]==2
		and grid[6][p2.c+3]==2	then
			win_p2() 
	elseif grid[4][p2.c]==2
		and grid[5][p2.c+1]==2
		and grid[6][p2.c+2]==2
		and grid[7][p2.c+3]==2	then
			win_p2()
	elseif grid[3][p2.c]==2
		and grid[2][p2.c-1]==2
		and grid[4][p2.c+1]==2
		and grid[5][p2.c+2]==2	then
			win_p2()
	elseif grid[4][p2.c]==2
		and grid[3][p2.c-1]==2
		and grid[5][p2.c+1]==2
		and grid[6][p2.c+2]==2	then
			win_p2()
	elseif grid[5][p2.c]==2
		and grid[4][p2.c-1]==2
		and grid[6][p2.c+1]==2
		and grid[7][p2.c+2]==2	then
			win_p2()
	elseif grid[4][p2.c]==2
		and grid[3][p2.c-1]==2
		and grid[2][p2.c-2]==2
		and grid[5][p2.c+1]==2	then
			win_p2() 
	elseif grid[5][p2.c]==2
		and grid[4][p2.c-1]==2
		and grid[3][p2.c-2]==2
		and grid[6][p2.c+1]==2	then
			win_p2()
	elseif grid[6][p2.c]==2
		and grid[5][p2.c-1]==2
		and grid[4][p2.c-2]==2
		and grid[7][p2.c+1]==2	then
			win_p2()
	elseif grid[4][p2.c]==2
		and grid[5][p2.c-1]==2
		and grid[3][p2.c+1]==2
		and grid[2][p2.c+2]==2	then
			win_p2()
	elseif grid[5][p2.c]==2
		and grid[6][p2.c-1]==2
		and grid[4][p2.c+1]==2
		and grid[3][p2.c+2]==2	then
			win_p2()  
	elseif grid[6][p2.c]==2
		and grid[7][p2.c-1]==2
		and grid[5][p2.c+1]==2
		and grid[4][p2.c+2]==2	then
			win_p2()
	elseif grid[5][p2.c]==2
		and grid[6][p2.c-1]==2
		and grid[7][p2.c+2]==2
		and grid[4][p2.c+1]==2	then
			win_p2()
	elseif grid[4][p2.c]==2
		and grid[5][p2.c-1]==2
		and grid[6][p2.c+2]==2
		and grid[3][p2.c+1]==2	then
			win_p2()
	elseif grid[3][p2.c]==2
		and grid[4][p2.c-1]==2
		and grid[5][p2.c+2]==2
		and grid[2][p2.c+1]==2	then
			win_p2()  						 		 		 		
	end
end


-->8
-- update game 2

function update_game2()
 if btnp(5,1) then
       scene="menu"
 end
	update_p1m()
	update_p2m()
end

function update_p1m()
 if btnp(0,0) then
  if p1m.cm > 1 then
   			p1m.cm -=1
 	end
 end
 if btnp(1,0) then
 if p1m.cm < 7 then
    	p1m.cm +=1   	
 	end
 end
 if btnp(2,0) then
 if  p1m.lm > 1 then
    		p1m.lm -=1
 	end
 end
 if btnp(3,0) then
 	if  p1m.lm < 7 then
    			p1m.lm +=1
  end
 end
 if btnp(4,0) then
  if gridm[p1m.lm][ p1m.cm] == 0
   and p1m_playing==true
   then
  			 gridm[p1m.lm][ p1m.cm] = 1
  			 p1m_playing=false
   			p2m_playing=true
   			sfx(-1)
   			sfx (6,0)
  end
 end
 if p1m_playing==true then
 	p1m_sprite+=1*(timing*4)
 else if p1m_playing==false then
 	p1m_sprite+=1*timing
 end
 end
	if p1m_sprite > 135 then
		p1m_sprite = 130
	end
end

function update_p2m()
 if btnp(0,1) then
  if p2m.cm > 1 then
   			p2m.cm -=1
  end
 end
	if btnp(1,1) then
  if p2m.cm < 7 then
    		p2m.cm +=1
  end
 end
 if btnp(2,1) then
  if  p2m.lm > 1 then
    			p2m.lm -=1
  end
 end
 if btnp(3,1) then
  if  p2m.lm < 7 then
    			p2m.lm +=1
  end
 end
	if btnp(4,1) then
  if gridm[p2m.lm][ p2m.cm] == 0
   and p2m_playing==true
   then 
   		gridm[p2m.lm][ p2m.cm] = 2
   		p1m_playing=true
   		p2m_playing=false
   		sfx(-1)
   		sfx (2,0)    
  end
 end 
 if p2m_playing==true then
 	p2m_sprite+=1*(timing*4) 
 	elseif p2m_playing==false then
 		p2m_sprite+=1*timing
 end 
	if p2m_sprite > 151 then
		p2m_sprite =146
	end  
end

function winner_p1m()
	for lm=1,7 do
		if gridm[lm][7]==1
			and gridm[lm][6]==1  
			and gridm[lm][5]==1
			and gridm[lm][4]==1 then
				win_p1()
		elseif gridm[lm][6]==1  
			and gridm[lm][5]==1
			and gridm[lm][4]==1
			and gridm[lm][3]==1 then
				win_p1()
		elseif gridm[lm][5]==1
			and gridm[lm][4]==1
			and gridm[lm][3]==1
			and gridm[lm][2]==1 then
				win_p1()
		elseif gridm[lm][4]==1
			and gridm[lm][3]==1
			and gridm[lm][2]==1
			and gridm[lm][1]==1  then
				win_p1()
		end 
	end
	for cm=1,7 do
		if  gridm[1][cm]==1  
			and gridm[2][cm]==1
			and gridm[3][cm]==1 
			and gridm[4][cm]==1 then
				win_p1()
		elseif  gridm[2][cm]==1  
			and gridm[3][cm]==1
			and gridm[4][cm]==1 
			and gridm[5][cm]==1 then
				win_p1()
		elseif gridm[3][cm]==1
			and gridm[4][cm]==1 
			and gridm[5][cm]==1
			and gridm[6][cm]==1 then
				win_p1()
		elseif			gridm[4][cm]==1
			and gridm[5][cm]==1  
			and gridm[6][cm]==1
			and gridm[7][cm]==1 then
				win_p1()
		end
	end
	if gridm[7][p1m.cm]==1
  and gridm[6][p1m.cm+1]==1
  and gridm[5][p1m.cm+2]==1
  and gridm[4][p1m.cm+3]==1	then
   win_p1()
 elseif gridm[6][p1m.cm]==1
  and gridm[5][p1m.cm+1]==1
  and gridm[4][p1m.cm+2]==1
  and gridm[3][p1m.cm+3]==1	then
   win_p1() 
 elseif gridm[5][p1m.cm]==1
  and gridm[4][p1m.cm+1]==1
  and gridm[3][p1m.cm+2]==1
  and gridm[2][p1m.cm+3]==1	then
   win_p1() 	
 elseif gridm[7][p1m.cm]==1
  and gridm[6][p1m.cm-1]==1
  and gridm[5][p1m.cm-2]==1
  and gridm[4][p1m.cm-3]==1	then
   win_p1()
 elseif gridm[6][p1m.cm]==1
  and gridm[5][p1m.cm-1]==1
  and gridm[4][p1m.cm-2]==1
  and gridm[3][p1m.cm-3]==1	then
   win_p1() 
 elseif gridm[5][p1m.cm]==1
  and gridm[4][p1m.cm-1]==1
  and gridm[3][p1m.cm-2]==1
  and gridm[2][p1m.cm-3]==1	then
 		win_p1() 
 elseif gridm[2][p1m.cm]==1
  and gridm[3][p1m.cm-1]==1
  and gridm[4][p1m.cm-2]==1
  and gridm[5][p1m.cm-3]==1	then
   win_p1()
 elseif gridm[3][p1m.cm]==1
  and gridm[4][p1m.cm-1]==1
  and gridm[5][p1m.cm-2]==1
  and gridm[6][p1m.cm-3]==1	then
   win_p1() 
 elseif gridm[4][p1m.cm]==1
  and gridm[5][p1m.cm-1]==1
  and gridm[6][p1m.cm-2]==1
  and gridm[7][p1m.cm-3]==1	then
   win_p1()
 elseif gridm[2][p1m.cm]==1
  and gridm[3][p1m.cm+1]==1
  and gridm[4][p1m.cm+2]==1
  and gridm[5][p1m.cm+3]==1	then
   win_p1()
 elseif gridm[3][p1m.cm]==1
  and gridm[4][p1m.cm+1]==1
  and gridm[5][p1m.cm+2]==1
  and gridm[6][p1m.cm+3]==1	then
   win_p1()
 elseif gridm[4][p1m.cm]==1
  and gridm[5][p1m.cm+1]==1
  and gridm[6][p1m.cm+2]==1
  and gridm[7][p1m.cm+3]==1	then
   win_p1()
 elseif gridm[3][p1m.cm]==1
  and gridm[2][p1m.cm-1]==1
  and gridm[4][p1m.cm+1]==1
  and gridm[5][p1m.cm+2]==1	then
   win_p1()
 elseif gridm[4][p1m.cm]==1
  and gridm[3][p1m.cm-1]==1
  and gridm[5][p1m.cm+1]==1
  and gridm[6][p1m.cm+2]==1	then
   win_p1()
 elseif gridm[5][p1m.cm]==1
  and gridm[4][p1m.cm-1]==1
  and gridm[6][p1m.cm+1]==1
  and gridm[7][p1m.cm+2]==1	then
   win_p1()
 elseif gridm[4][p1m.cm]==1
  and gridm[3][p1m.cm-1]==1
  and gridm[2][p1m.cm-2]==1
  and gridm[5][p1m.cm+1]==1	then
   win_p1() 
	elseif gridm[5][p1m.cm]==1
  and gridm[4][p1m.cm-1]==1
  and gridm[3][p1m.cm-2]==1
  and gridm[6][p1m.cm+1]==1	then
   win_p1()
	elseif gridm[6][p1m.cm]==1
  and gridm[5][p1m.cm-1]==1
  and gridm[4][p1m.cm-2]==1
  and gridm[7][p1m.cm+1]==1	then
   win_p1()
 elseif gridm[4][p1m.cm]==1
  and gridm[5][p1m.cm-1]==1
  and gridm[3][p1m.cm+1]==1
  and gridm[2][p1m.cm+2]==1	then
   win_p1()
 elseif gridm[5][p1m.cm]==1
  and gridm[6][p1m.cm-1]==1
  and gridm[4][p1m.cm+1]==1
  and gridm[3][p1m.cm+2]==1	then
   win_p1()  
	elseif gridm[6][p1m.cm]==1
  and gridm[7][p1m.cm-1]==1
  and gridm[5][p1m.cm+1]==1
  and gridm[4][p1m.cm+2]==1	then
   win_p1()
	elseif gridm[5][p1m.cm]==1
  and gridm[6][p1m.cm-1]==1
  and gridm[7][p1m.cm+2]==1
  and gridm[4][p1m.cm+1]==1	then
   win_p1()
	elseif gridm[4][p1m.cm]==1
  and gridm[5][p1m.cm-1]==1
  and gridm[6][p1m.cm+2]==1
  and gridm[3][p1m.cm+1]==1	then
   win_p1()
	elseif gridm[3][p1m.cm]==1
  and gridm[4][p1m.cm-1]==1
  and gridm[5][p1m.cm+2]==1
  and gridm[2][p1m.cm+1]==1	then
   win_p1()   						 		 		 		
	end
end


function winner_p2m()
	for lm=1,7 do
		if gridm[lm][7]==2
			and gridm[lm][6]==2  
			and gridm[lm][5]==2
			and gridm[lm][4]==2 then
				win_p2()
		elseif gridm[lm][6]==2  
			and gridm[lm][5]==2
			and gridm[lm][4]==2
			and gridm[lm][3]==2 then
				win_p2()
		elseif gridm[lm][5]==2
			and gridm[lm][4]==2
			and gridm[lm][3]==2
			and gridm[lm][2]==2 then
				win_p2()
		elseif gridm[lm][4]==2
			and gridm[lm][3]==2
			and gridm[lm][2]==2
			and gridm[lm][1]==2  then
				win_p2()
		end 
	end
	for cm=1,7 do
		if gridm[1][cm]==2  
			and gridm[2][cm]==2
			and gridm[3][cm]==2 
			and gridm[4][cm]==2 then
				win_p2()
		elseif gridm[2][cm]==2  
			and gridm[3][cm]==2
			and gridm[4][cm]==2 
			and gridm[5][cm]==2 then
				win_p2()
		elseif gridm[3][cm]==2
			and gridm[4][cm]==2 
			and gridm[5][cm]==2
			and gridm[6][cm]==2 then
				win_p2()
		elseif gridm[4][cm]==2
			and gridm[5][cm]==2  
			and gridm[6][cm]==2
			and gridm[7][cm]==2 then
				win_p2()
		end
	end
	if gridm[7][p2m.cm]==2
		and gridm[6][p2m.cm+1]==2
		and gridm[5][p2m.cm+2]==2
		and gridm[4][p2m.cm+3]==2	then
			win_p2()
	elseif gridm[6][p2m.cm]==2
		and gridm[5][p2m.cm+1]==2
		and gridm[4][p2m.cm+2]==2
		and gridm[3][p2m.cm+3]==2	then
			win_p2()
	elseif gridm[5][p2m.cm]==2
		and gridm[4][p2m.cm+1]==2
		and gridm[3][p2m.cm+2]==2
		and gridm[2][p2m.cm+3]==2	then
			win_p2() 	
	elseif gridm[7][p2m.cm]==2
		and gridm[6][p2m.cm-1]==2
		and gridm[5][p2m.cm-2]==2
		and gridm[4][p2m.cm-3]==2	then
			win_p2()
	elseif gridm[6][p2m.cm]==2
		and gridm[5][p2m.cm-1]==2
		and gridm[4][p2m.cm-2]==2
		and gridm[3][p2m.cm-3]==2	then
			win_p2() 
	elseif gridm[5][p2m.cm]==2
		and gridm[4][p2m.cm-1]==2
		and gridm[3][p2m.cm-2]==2
		and gridm[2][p2m.cm-3]==2	then
			win_p2() 
	elseif gridm[2][p2m.cm]==2
		and gridm[3][p2m.cm-1]==2
		and gridm[4][p2m.cm-2]==2
		and gridm[5][p2m.cm-3]==2	then
			win_p2()
	elseif gridm[3][p2m.cm]==2
		and gridm[4][p2m.cm-1]==2
		and gridm[5][p2m.cm-2]==2
		and gridm[6][p2m.cm-3]==2	then
			win_p2() 
	elseif gridm[4][p2m.cm]==2
		and gridm[5][p2m.cm-1]==2
		and gridm[6][p2m.cm-2]==2
		and gridm[7][p2m.cm-3]==2	then
			win_p2()
	elseif gridm[2][p2m.cm]==2
		and gridm[3][p2m.cm+1]==2
		and gridm[4][p2m.cm+2]==2
		and gridm[5][p2m.cm+3]==2	then
			win_p2()
	elseif gridm[3][p2m.cm]==2
		and gridm[4][p2m.cm+1]==2
		and gridm[5][p2m.cm+2]==2
		and gridm[6][p2m.cm+3]==2	then
			win_p2() 
	elseif gridm[4][p2m.cm]==2
		and gridm[5][p2m.cm+1]==2
		and gridm[6][p2m.cm+2]==2
		and gridm[7][p2m.cm+3]==2	then
			win_p2()
	elseif gridm[3][p2m.cm]==2
		and gridm[2][p2m.cm-1]==2
		and gridm[4][p2m.cm+1]==2
		and gridm[5][p2m.cm+2]==2	then
			win_p2()
	elseif gridm[4][p2m.cm]==2
		and gridm[3][p2m.cm-1]==2
		and gridm[5][p2m.cm+1]==2
		and gridm[6][p2m.cm+2]==2	then
			win_p2()
	elseif gridm[5][p2m.cm]==2
		and gridm[4][p2m.cm-1]==2
		and gridm[6][p2m.cm+1]==2
		and gridm[7][p2m.cm+2]==2	then
			win_p2()
	elseif gridm[4][p2m.cm]==2
		and gridm[3][p2m.cm-1]==2
		and gridm[2][p2m.cm-2]==2
		and gridm[5][p2m.cm+1]==2	then
			win_p2() 
	elseif gridm[5][p2m.cm]==2
		and gridm[4][p2m.cm-1]==2
		and gridm[3][p2m.cm-2]==2
		and gridm[6][p2m.cm+1]==2	then
			win_p2()
	elseif gridm[6][p2m.cm]==2
		and gridm[5][p2m.cm-1]==2
		and gridm[4][p2m.cm-2]==2
		and gridm[7][p2m.cm+1]==2	then
			win_p2()
	elseif gridm[4][p2m.cm]==2
		and gridm[5][p2m.cm-1]==2
		and gridm[3][p2m.cm+1]==2
		and gridm[2][p2m.cm+2]==2	then
			win_p2()
	elseif gridm[5][p2m.cm]==2
		and gridm[6][p2m.cm-1]==2
		and gridm[4][p2m.cm+1]==2
		and gridm[3][p2m.cm+2]==2	then
			win_p2()  
	elseif gridm[6][p2m.cm]==2
		and gridm[7][p2m.cm-1]==2
		and gridm[5][p2m.cm+1]==2
		and gridm[4][p2m.cm+2]==2	then
			win_p2()
	elseif gridm[5][p2m.cm]==2
		and gridm[6][p2m.cm-1]==2
		and gridm[7][p2m.cm+2]==2
		and gridm[4][p2m.cm+1]==2	then
			win_p2()
	elseif gridm[4][p2m.cm]==2
		and gridm[5][p2m.cm-1]==2
		and gridm[6][p2m.cm+2]==2
		and gridm[3][p2m.cm+1]==2	then
			win_p2()
	elseif gridm[3][p2m.cm]==2
		and gridm[4][p2m.cm-1]==2
		and gridm[5][p2m.cm+2]==2
		and gridm[2][p2m.cm+1]==2	then
			win_p2()  						 		 		 		
	end
end


-->8
--draw

function _draw()
  if scene=="menu" then
   draw_menu()
   elseif scene=="game1" then
    draw_game1()
    winner_p1()
				winner_p2()
   elseif scene=="game2" then
    draw_game2()
    winner_p1m()
				winner_p2m()
  end   
end

function draw_menu()
	cls()   
	spr(170,50,45,2,2) -- titre jeu
	print("press ❎ to start puissance 4\n\n press w to start morpion",10,70,7)
animated_win_p1()
animated_win_p2()
end	
 
function draw_animated_win()
spr(br_sprite,50,40)
spr(av_sprite,58,40)
spr(o_sprite,66,40)
	if scene=="game1" then
	print("press n to return to menu",15,100)
	elseif scene=="game2" then
	print("press ❎ to return to menu",15,100)
	end
end

function win_p1()
 if scene=="game1" then
		reboot_p1()
		cls()
		animated_win_p1()
		draw_animated_win()
			if btnp(4) then
		 run()
		 end
	elseif scene=="game2" then
		cls()
		draw_animated_win()
		animated_win_p1()	
		 if btnp(5) then
		 run()
		 end
 end  
end

function win_p2()
	cls()
	animated_win_p2()
	draw_animated_win()
	if scene=="game1" then
	reboot_p2()
		if btnp(4) then
		 run()
		end
	elseif scene=="game2" then
	 if btnp(5) then
	 run()
	 end
	end
end

function animated_win_p1() 
if scene == "menu" then
	local x =30
 local y =50
 spr (w1_sprite,x,y)
elseif scene == "game1" then
 local x =58
 local y =65
 spr (w1_sprite,x,y)
elseif scene == "game2" then
 local x =58
 local y =65
 spr (w1_sprite,x,y) 
end
end

function animated_win_p2() 
if scene == "menu" then
	local x =80
 local y =50
 spr (w2_sprite,x,y)
elseif scene == "game1" then
 local x =58
 local y =65
 spr (w2_sprite,x,y)
elseif scene == "game2" then
 local x =58
 local y =65
 spr (w2_sprite,x,y)
 end 
end

function reboot_p1()
for l=1,7 do
 grid[l] = {}
 for c=1,7 do
  grid[l][c] =1
 end
end
end

function reboot_p2()
for l=1,7 do
 grid[l] = {}
 for c=1,7 do
  grid[l][c] =2
 end
end
end
-->8
-- draw game 1

function draw_game1() --affichage jardins et buildings
 cls()
 for l=2,7 do
  for c=1,7 do
	  local x = (c-1)*cs
	  local y = (l-1)*cs
  	spr(128,x,y,2,2)
  	rect(x,y,(x+cs),(y+cs),0)
   if grid[l][c] == 1 then
	   spr(160, x, y,2,2) -- jardins
	   rect(x,y,(x+cs),(y+cs),5)	
  	elseif grid[l][c] == 2 then
   	spr(162, x, y,2,2) --- buildings
  		rect(x,y,(x+cs),(y+cs),5)	
   end
  end
 end 
 animated_p1()
 animated_p2()
print ("bouger:\n poser:",4,115,7)	
print ("⬅️➡️\n ⬇️",90,115,7)
print ("sf\n d",40,115,7) 
end

function animated_p1()
 local x = ( p1.c-1)*cs
 local y = ( p1.l-1)*cs
 spr (p1_sprite,x+6,y+6) -- +6 permet d'afficher au milieu de la case
end

function animated_p2() 
 local x = ( p2.c-1)*cs
 local y = ( p2.l-1)*cs
 spr (p2_sprite,x+6,y+6) 
end






-->8
-- draw game 2
    
function draw_game2()
 cls()
 for lm=1,7 do
  for cm=1,7 do
	  local x = (cm-1)*cs
	  local y = (lm-1)*cs
	  spr(128, x+2, y+2,2,2)
	  rect(x+1,y+1,(x+cs)+1,(y+cs)+1,5)
	  if gridm[lm][cm] == 1 then
	   spr(160, x+2, y+2,2,2)
	  	elseif gridm[lm][cm] == 2 then
	   	spr(162, x+2, y+2,2,2)
		  end
	 end
	end
	print ("bouger:\n poser:",4,115,7)	
	print ("⬅️⬇️⬆️➡️\n    n",70,115,7)
	print ("sedf\nmaj",40,115,7) 
 animated_p1m()
 animated_p2m()
end

function animated_p1m()
 local x = ( p1m.cm-1)*cs
 local y = ( p1m.lm-1)*cs
 spr (p1m_sprite,x+6,y+6)
end

function animated_p2m() 
 local x = ( p2m.cm-1)*cs
 local y = ( p2m.lm-1)*cs
 spr (p2m_sprite,x+6,y+6) 
end

__gfx__
00000000888888888888888888888888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000877777777777777777777777777777777777777800000000000000000070000000000000000000000000000000000000000000000000000000000000
00700700875575757575575577577577575575577577757800700070777070700700777077000000000000000000000000000000000000000000000000000000
00077000875575757775775775757557575775577575757800700070707070700000707070000000000000000000000000000000000000000000000000000000
00077000875775557577577577577575575775777555777800070700707070700000707077000000000000000000000000000000000000000000000000000000
00700700875775557575575575757577575575577775757800007000707070700000770070000000000000000000000000000000000000000000000000000000
00000000877777777777777777777777777777777777777800007000707070700000707070000000000000000000000000000000000000000000000000000000
00000000888888888888888888888888888888888888888800007000777007000000707077000000000000000000000000000000000000000000000000000000
00000000555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888888888888888888888888000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000
00000000877777777777777777777778000000000000000007770070007000700707007077077700000000000000000000000000000000000000000000000000
00000000875557755755575775575578000000000000000007070070007070770707707070070700000000000000000000000000000000000000000000000000
00000000875757757757775775775778000000000000000007770070007070707707077077070700000000000000000000000000000000000000000000000000
00000000875555755757575775575578000000000000000007070070007070700707007070077000000000000000000000000000000000000000000000000000
00000000875775757757575775777578000000000000000007070070707070700707007070070700000000000000000000000000000000000000000000000000
00000000875775755755575575575578000000000000000007070007070070700707007077070700000000000000000000000000000000000000000000000000
00000000877777777777777777777778000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888888888888888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555555556555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555555556555555555555000000000000000000000077707770777070007007000000000000000000000000000000000000000000000000000000
00000000555555555556555555555555000000000000000000000070707070707070007007000000000000000000000000000000000000000000000000000000
00000000555555555555555555555555000000000000000000000077007770770007070007000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070707070707000700007000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070707070707000700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077707070777000700007000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444433333333000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbb3bbbbbbbbbbbb333333333bb335570000000000000000
4444f5443bbb333300000ddddd00000000000ddddd90900000000ddddd000000bbbbbbbbbbbbbbbbbb333bbb444444bb33333333bb8b35570000000000000000
444fff543bbb383300000d444d90900000000d444d90900000000d444d909000bbbbebbbbbbbbbbbb33333bb434444bb3333bb333bbb35550000000000000000
44f444f53bbb333300000d444d90900000000d444d99900000000d444d909000bbbbbbb33bbbbbbb3333333b444a33bbe3bbbbb3334335570000000000000000
4444444f33433383000000040099900000000004000900000000000400999000bbbbbb3333bbbbbbb33333bb434433bb33bbb8b3334335570000000000000000
4444444433433833000004e4e4090000000004e4e4090000000004e4e4090000bebbb333333bbbbbbb333bbb444a44bb33b8bbb3334335550000000000000000
4444444433333333000004eee4090000000004eee4090000000004eee4090000bbbbb333333bb8bbbbb3bb8b434444bb333bb333333335570000000000000000
4444444433383333000004eee4090000000004eee4090000000004eee4090000bbbbbb3333bbbb8bbbbbb8bb44b434bb33334333333335570000000000000000
5555555556666665000004eee4490000000004eee4490000000944eee4490000bbbbbbb33bbbbbbbbbebbbeb444a44bb33e34333333335550000000000000000
5656565555555556000004eee0090000000004eee0090000000900eee0090000bbb3bbbbbbbbbbbbbbbbbbbb4b4434bb333e33333e3335570000000000000000
5555555556666656000944eee0090000000944eee0090000009990eee0090000bb333bbbbbb8bbbbbbbbbbbb449444bb3e333333333335570000000000000000
5656565556565656000900e0e0090000000900e0e0090000009990e0e0090000b33333bbbbbbbbebbbbbebbb494a44bb33333e33333335550000000000000000
5555555556666656009990e0e0090000009990e0ee090000000000e0e00900003333333bbbbbbbbbbbbbbbbb449494bb33333333333335570000000000000000
5666565556565656009990a0a0090000009990a00a0000000000aae0a0090000b33333bbbbbbbebbbbb8bebb494944bb55555555555555570000000000000000
5666565556666656000000a0a0000000000000a00aa000000000a000a0000000bb333bbbbbbbbbbbbbbbbbbb444449bb55555555555555550000000000000000
566655555665565500000aa0aa00000000000aa00000000000000000aa000000bbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbb77755777557775570000000000000000
00000000000000000000005550000000000000555000000000000000000000000000000000000000666665555555566600000000555755550000000000000000
00000055500000000000055555000000000005555500000000000055500000000000050000000000666665555555566600000000555555550000000000000000
000005555500000000040d444d04000000000d444d00000000000555550000000000050000000000666665666666566600000000555755550000000000000000
00000d444d00000000010d444d01000000000d444d00000000000d444d0000000000666666600000666665666666566600000000555555550000000000000000
00000d444d0000000001000400010000000000040000000000000d444d0000000000656565600000666665666666566600000000555755550000000000000000
00000004000000000001111711110000000001171100000000000004000000000000666666600000666665666666566600000000555555550000000000000000
00000117110000000000001710000000000001171100000000000117111111140000656565600000555555577555555500000000555755550000000000000000
00001017101000000000001710000000000001171100000000001017100000005555666666600000555555555555555500000000555555550000000000000000
00010017100100000000001710000000000001171154500000010017100000006665656565600000575757577575757555555555555755550000000000000000
00001011101000000000001110000000000001111050500000001011100000005555666666600000555555555555555555555555555555550000000000000000
00000411140000000000001110000000000001111555550000000411100000006665656565655555555555577555555555555555555755550000000000000000
00000010100555000000001010055500000004101555550000000010100555005555666666656665666666656666666675757575757575750000000000000000
00000010100505000000001010050500000000101555550000000010100505006665656565655555666666656666666655555555555755550000000000000000
00000100015555500000001010555550000000101555550000000100015555505555666666656665666666656666666655555555555555550000000000000000
00000010105555500000001010555550000000101000000000000010105555506655656556656665666666656666666655555555555755550000000000000000
00000550505555500000055050555550000005505500000000000550505555506655666556656665666666656666666655555555555555550000000000000000
444444444444444400ddddd000ddddd000ddddd000ddddd00ddddd000ddddd0000ddd00000ddddd0000ddd0000ddddd000ddddd0909dddd000ddddd000000000
444444444444444400daaad000daaad000daaad000daaad00daaad000daaad0000dda00000ddddd0000add0000daaad000daaada09daaad00adaaada00000000
44444444444444440000a0000000a0000000a0000000a000000a0000000a0000000a00000000a0000000a0009090a0009090a00a0900a0000a00a00a00000000
444fff4444444444aaaeaea0aaaeaea000aeaea000aeaea00aeaeaaa0aeaeaaa00eee00000aeeea0000eee00a9aeaea0a9aeaea009aeaea000aeaea000000000
444f4ff444444444000eeea0080eeea000aeeea000aeeea00aeee0800aeee0000aeeaa0000aeeea000aaeea0090eeea0090eee08800eeea0080eee0800000000
44f4444f44444444000eeea008eeeea000aeeea000aeeea00aeeee800aeee00000eee00000aeeea0000eee00090eeea0090eeee88eeeeea008eeeee800000000
4f44444444444444000e0e0000000e00000e0e00000e0e0000e0000000e0e00008e0e000000e0e00000e0e80000e0e00000e000000000e000000000000000000
44444444444444440088088000000880008808800088088008800000088088000800880000880880008800800088088000880000000008809999000000000000
44444444ff44444400ddddd000ddddd000ddddd00ddddd000ddddd000ddddd00000ddd0000ddddd0000ddd0000ddddd000ddddd000ddddd000ddddd000000000
44444445fff5544400daaad000daaad000daaad00daaad000daaad000daaad00000dda0000ddddd0000add0000daaad00adaaada0adaaada0adaaada00000000
4444445f444ff4440000a0000000a0000000a000000a0000000a0000000a00000000a0000000a0000000a0000000a0000100a0010100a0010100a00100000000
444444f44444ff44a1117110a111711000117110011711000117111a0117111a0001170000111110000711000011711000117110001171100011711000000000
4444444444444f4400017110050171100011711001171100011710000117105000a111a00011111000a111a00011711000017105050171050501710000000000
44444444444444f4000111a0051111a000a111a00a111a000a1110000a1111500001110000a111a00001110000a111a000011115051111150511110000000000
44444444444444f40001010000000100000101000010100000101000001000000051010000010100000101500001010000010000000000000000010000000000
44444444444444440055055000000550005505500550550005505500055000000050055000550550005500500055055000550000000000000000055000000000
cccccccccccccccc5551111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccccccccc6655511111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccbbccccccccec6666555111111111007770770055505570777070505550507077700750555005000000000000000000000000000000000000000000000000
33bbbbb33e3333336566665611111111007070700050505070707070505050507070700750505005888888888888888800000000000000000000000000000000
33bbb8b3333344336665666511111111007700770055005500777070005550507070700750505005888888888788888800000000000000000000000000000000
33b8bbb3333444436566656511111561007070700050505070707070505050507070700050505000888888887878888800000000000000000000000000000000
333bb333334444446665666555111651007770700055505070707007505050050077700700555005878788788888788800000000000000000000000000000000
3b33433334b444446566656565551651000000000000000000000000000000000000000000000000878787878888787800000000000000000000000000000000
bbb34333344a44446665666566655551000000000000000000000000000000000000000000000000887887878888777800000000000000000000000000000000
b8bb33334b4444436566656565666656000000000000000000000000000000000000000000000000878787878888887800000000000000000000000000000000
bb8b3334449444436665666566656665000000000000000000000000000000000000000000000000878788788888887800000000000000000000000000000000
bbb33e44494a44336566656565666565000000000000000000000000000000000000000000000000888888888888888800000000000000000000000000000000
34333344449443336665666566656665000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
34333444494433336566666565666565000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3433333444443e336665556566656665000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333344333336665556565666565000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00eeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00e888e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00e8a8e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00e888e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0beebee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bb0b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000010000010101000000000000000000000100000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010100000000000000000000000000000101000000000000
0202000000000000000000000000000002020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000100000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000
__map__
c0c1d0d1d2d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dad0d1d2d3d4d5d6d7d8d9dadb000000000000000000000000f100f3f4f100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d0d1e0e1e2e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eae0e1e2e3e4e5e6e7e8e9eaeb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e0e1f0f1f2f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9faf0f1f2f3f4f5f6f7f8f9fafb000000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cecfc0c1c2c3c4c5c6c7c8c9cacbcccdcecf1b1c1b1c1b1c1b1c1b1c1bc0c1c2c3c4c5c6c7c8c9cacb0b0000000000000000000000001b1c001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dedfd0d1d2d3d4d5d6d7d8d9dadbdcdddedf0b0c0b0c0b0c0b0c0b0c0bd0d1d2d3d4d5d6d7d8d9dadb0000000b000b0cf4f100000b0c0b0c0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
eeefe0e1e2e3e4e5e6e7e8e9eaebecedeeef1b1c1b1c1b1c1b1c1b1c1be0e1e2e3e4e5e6e7e8e9eaeb0b000000000000000000001b1c1b001b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fefff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff0b0c0b0c0b0c0b0c0b0c0bf0f1f2f3f4f5f6f7f8f9fafb0c1c0c00000b0c0b0c0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cecfc0c1c2c3c4c5c6c7c8c9cacbcccdcecf1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0c0b0c00001c1b1c1b1c1b0000001b0000e30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dedfd0d1d2d3d4d5d6d7d8d9dadbdcdddedf0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c00f30b0c1c0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
eec0c1c2c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacbcccdcecf1c1b1c1b1c1b1c1b1c1b1c1b1c00000000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fed0d1d2d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadbdcdddedf0c0b0c0b0c0b0c1c1b1c0c0b0c000c0b00000c000c0000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cee0e1e2e3e4e5e6e7e8e9eaebecc0c1c2c3c4c5c6c7c8c9cacbcccdcecfedeeef1c1b1c1b1c1b1c0c0b0c0b0c1c1b1c1b1c0c1c001c1b1c1b1c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
def0f1f2f3f4f5f6f7f8f9fafbfcd0d1d2d3d4d5d6d7d8d9dadbdcdddedffdfeff0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b1b1c00f4f1f2f30b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6ec0c1c2c3c4c5c6c7c8c9cacbcce0e1e2e3e4e5e6e7e8e9eaebecedeeefcccdcecf1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b0b0c0000000000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5ed0d1d2d3d4d5d6d7d8d9dadbdcf0f1f2f3f4f5f6f7f8f9fafbfcfdfeffdcdddedf0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b1b000c0b0c00000b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacb1c1b1c1b1c1b1c0c001b1c0000e2e3001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadb1b1c1b1c1b00001c00f2f3f4f1f2f3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eaeb00000b0c0b00000000000000000000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9fafb0c0b0c0b0c0b0c0b0c000000000b0c0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacb1c0000001c1b1c0000000000001b1c000000e30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadb00f20000000000000000000000f2f300f100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eaeb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9fafb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacb000000000000e3000000000000000000e100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadbf10000000000000000f2f30000f20000f100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eaeb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9fafb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7d8d9dadb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eaebecedeeefe0e1e2e3e4e5e6e7e8e9eaeb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9fafbfcfdfefff0f1f2f3f4f5f6f7f8f9fafb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7c8c9cacb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
001e07001d0621c000040620c0001c0620c0001d0621c000040620c0001c0620c0001d0621c000040620c0001c0620c0001d0621c000040620c0001c0620c0001d0621c000040620c0001c0620c0000406204000
011e0800045420c5421c5420c5421d5421c542045420c5421d5421c542045420c5421c5420c542045420c5421c5420c5421d5421c542045420c5421c5420c5421d5421c542045420c5421c5420c5420454204542
01280000182200c220182201122000200002000020000200242002420024200242000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200
011e000027010261202522023320224202152022620227202204022120202201e32017430135301a6401d74023040251402624028340314502d5502b6502575024050270502a250293502445026550296602b760
011e00001d0001c052040000c0521c0000c0521d0001c052040000c0521c0000c0521d0001c052040000c0521c0000c0521d0001c052040000c0521c0000c0521d0001c052040000c0521c0000c0520400004052
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000241600c160241603016030100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
__music__
00 02414344
03 06444344
00 42414344
00 43420244
03 01424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41425044

