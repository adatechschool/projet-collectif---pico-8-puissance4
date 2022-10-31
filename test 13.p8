pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- init 
--(appelee 1 fois au debut du jeu)

timing = 0.1

-- creations variables

local grid = {}
for l=1,7 do
 grid[l] = {}
 for c=1,7 do
  grid[l][c] = 0
 end
end

local cs = 128/7

--local der_case

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
w1_sprite= 132

local w2={}
x = 60
y = 85
w2_sprite= 148

local p1={}
p1.c = 7
p1.l = 1
p1_sprite=73
p1_playing = true

local p2 = {}
p2.c = 1
p2.l = 1
p2_sprite = 89
p2_playing = false -- (pourrait etre true, ca sera gere plus tard)

-- gestion alternance menu-jeu

function _init()
music(4,0)
scene="menu"
--init_animated_win()
end






-->8
-- update
--(appelee 30 fois/sec) 

function _update()
	if scene=="menu" then
	       update_menu()
	elseif scene=="game" then
	 update_game()
	end
w1_sprite+=1*(timing*4)
	if w1_sprite > 137 then
	w1_sprite = 132
	end
w2_sprite+=1
	if w2_sprite > 153 then
	w2_sprite = 148
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
       scene="game"
    end
end

function update_game()
	if btnp(5) then
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
 	if grid[7][p1.c] == 0 and p1_playing==true then
  			 grid[7][ p1.c] = 1
  			 p1_playing=false
   			p2_playing=true
   			sfx(-1)
   			sfx (6,0)
   			
  elseif grid[6][p1.c] == 0 and p1_playing==true then
     grid[6][ p1.c] = 1
  			 p1_playing=false
   			p2_playing=true
   			sfx(-1)
   			sfx (6,0)
  elseif grid[5][p1.c] == 0 and p1_playing==true then
     grid[5][ p1.c] = 1
  			 p1_playing=false
   			p2_playing=true
   			sfx(-1)
   			sfx (6,0)
  elseif grid[4][p1.c] == 0 and p1_playing==true then
     grid[4][ p1.c] = 1
  			 p1_playing=false
   			p2_playing=true
   			sfx(-1)
   			sfx (6,0)
 elseif grid[3][p1.c] == 0 and p1_playing==true then
     grid[3][ p1.c] = 1
  			 p1_playing=false
   			p2_playing=true
   			sfx(-1)
   			sfx (6,0)
  elseif grid[2][p1.c] == 0 and p1_playing==true then
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
	if p1_sprite > 76 then
		p1_sprite = 73
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
 
if p2_sprite > 92 then
						p2_sprite =89
		end  
end



-->8
--draw

function _draw()
  if scene=="menu" then
       draw_menu()
   elseif scene=="game" then
       draw_game()
    end
winner_p1()
winner_p2()    
end

function draw_menu()
	cls()   
-- affichage logo et consigne :
	spr(1,40,30)
	spr(2,48,30)
	spr(3,56,30)
	spr(4,64,30)
	spr(5,72,30)
	print("press 'enter' to start\n and 'space' to pause",20,60,7)

-- affichage players et touches :
print ("bouger:\n poser:",4,102)
	spr(73,90,90)
	print ("⬅️➡️\n ⬇️",90,102,7)
	spr(89,40,90)
	print ("ae\n z",40,102,7) 
end
 
function draw_game() --affichage jardins et buildings
 cls()
 for l=2,7 do
  for c=1,7 do
  local x = (c-1)*cs
  local y = (l-1)*cs
  spr(97, x+2, y+2,2,2)
   if grid[l][c] == 1 then
   spr(206, x+2, y+2,2,2) -- jardins
   	elseif grid[l][c] == 2 then
   	spr(238, x+2, y+2,2,2) --- buildings
   end
  end
 end 
 animated_p1()
 animated_p2() 
end

function draw_animated_win()
spr(br_sprite,50,50)
spr(av_sprite,58,50)
spr(o_sprite,66,50)
print("press 'maj' to play again",10,100)
end

---- player 1

function reboot_p1()
for l=1,7 do
 grid[l] = {}
 for c=1,7 do
  grid[l][c] =1
 end
end
end

function animated_p1()
 local x = ( p1.c-1)*cs
 local y = ( p1.l-1)*cs
 spr (p1_sprite,x+6,y+6)
end

function animated_win_p1() 
 local x =58
 local y =65
 spr (w1_sprite,x,y) 
end

--- player 2

function reboot_p2()
for l=1,7 do
 grid[l] = {}
 for c=1,7 do
  grid[l][c] =2
 end
end
end

function animated_p2() 
 local x = ( p2.c-1)*cs
 local y = ( p2.l-1)*cs
 spr (p2_sprite,x+6,y+6) 
end

function animated_win_p2() 
 local x =58
 local y =65
 spr (w2_sprite,x,y) 
end





-->8
-- win 

-----player 1

function win_p1()
	cls()
	animated_win_p1()
	draw_animated_win()
	reboot_p1()
	if btnp(4,0) or btnp(4,1) then
 run()
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

-- player 2

function win_p2()
	cls()
	animated_win_p2()
	draw_animated_win()
	reboot_p2()
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


__gfx__
00000000888888888888888888888888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000877777777777777777777777777777777777777800000000000000000070000000000000000000000000000000500000000000000000000000000000
00700700875575757575575577577577575575577577757800700070777070700700777077000000005000505550505005005550550000000000000000000000
00077000875575757775775775757557575775577575757800700070707070700000707070000000005000505050505000005050500000000000000000000000
00077000875775557577577577577575575775777555777800070700707070700000707077000000000505005050505000005050550000000000000000000000
00700700875775557575575575757577575575577775757800007000707070700000770070000000000050005050505000005500500000000000000000000000
00000000877777777777777777777777777777777777777800007000707070700000707070000000000050005050505000005050500000000000000000000000
00000000888888888888888888888888888888888888888800007000777007000000707077000000000050005550050000005050550000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000500000000000000000000000000000000000
00000000000000000000000000000000000000000000000007770070007000700707007077077700055500500050005005050050550555000000000000000000
00000000000000000000000000000000000000000000000007070070007070770707707070070700050500500050505505055050500505000000000000000000
00000000000000000000000000000000000000000000000007770070007070707707077077070700055500500050505055050550550505000000000000000000
00000000000000000000000000000000000000000000000007070070007070700707007070077000050500500050505005050050500550000000000000000000
00000000000000000000000000000000000000000000000007070070707070700707007070070700050500505050505005050050500505000000000000000000
00000000000000000000000000000000000000000000000007070007070070700707007077070700050500050500505005050050550505000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077707770777070007007000000000000555055505550500050050000000000000000000000
00000000000000000000000000000000000000000000000000000070707070707070007007000000000000505050505050500050050000000000000000000000
00000000000000000000000000000000000000000000000000000077007770770007070007000000000000550055505500050500050000000000000000000000
00000000000000000000000000000000000000000000000000000070707070707000700007000000000000505050505050005000050000000000000000000000
00000000000000000000000000000000000000000000000000000070707070707000700000000000000000505050505050005000000000000000000000000000
00000000000000000000000000000000000000000000000000000077707070777000700007000000000000555050505550005000050000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555555555555555555555555555555555555555555555555555555555555700ddddd000ddddd0909dddd000ddddd0000000000000000000000000
00000000555555555555555555555555555555555555555555555555544444444444455700daaad000daaada09daaad00adaaada000000000000000000000000
0000000055555555555555555555555555555555555555555555555554444444444445559090a0009090a00a0900a0000a00a00a000000000000000000000000
000000008888888888888888888888885555555555555555555555555444444444444557a9aeaea0a9aeaea009aeaea000aeaea0000000000000000000000000
000000008777777777777777777777785555555555555555555555555444444444444557090eeea0090eee08800eeea0080eee08000000000000000000000000
000000008755577557555757755755785555555555555555555555555444444444444555090eeea0090eeee88eeeeea008eeeee8000000000000000000000000
000000008757577577577757757757785555555555555555555555555444444444444557000e0e00000e000000000e0000000000000000000000000000000000
00000000875555755757575775575578555555555555555555555555544444444444455700880880008800000000088099990000000000000000000000000000
00000000875775757757575775777578555555555555555555555555544444444444455500ddddd000ddddd000ddddd000ddddd0000000005557555500000000
00000000875775755755575575575578555555555555555555555555544444444444455700daaad00adaaada0adaaada0adaaada000000005555555500000000
0000000087777777777777777777777855555555555555555555555554444444444445570000a0000100a0010100a0010100a001000000005557555500000000
00000000888888888888888888888888555555555555555555555555544444444444455500117110001171100011711000117110000000005555555500000000
00000000555555555556555555555555555555555555555555555555544444444444455700117110000171050501710505017100000000005557555500000000
00000000555555555556555555555555555555555555555555555555555555555555555700a111a0000111150511111505111100000000005555555500000000
00000000555555555556555555555555555555555555555555555555555555555555555500010100000100000000000000000100000000005557555500000000
00000000555555555555555555555555555555555555555555555555777557775577755700550550005500000000000000000550000000005555555500000000
000000004444444444444444333333333bb335570000000000000000000000004444444433333333000000000000000000000000555555555557555500000000
00000000444444444444444433333333bb8b35570000000000000000000000004444f5443bbb3333000000000000000000000000555555555555555500000000
0000000044444444444444443333bb333bbb3555000000000000000000000000444fff543bbb3833000000000000000000000000555555555557555500000000
00000000444fff4444444444e3bbbbb33343355700000000000000000000000044f444f53bbb3333000000000000000000000000757575757575757500000000
00000000444f4ff44444444433bbb8b3334335570000000000000000000000004444444f33433383000000000000000000000000555555555557555500000000
0000000044f4444f4444444433b8bbb3334335550000000000000000000000004444444433433833000000000000000000000000555555555555555500000000
000000004f44444444444444333bb333333335570000000000000000000000004444444433333333000000000000000000000000555555555557555500000000
00000000444444444444444433334333333335570000000000000000000000004444444433383333000000000000000000000000555555555555555500000000
0000000044444444ff44444433e34333333335550000000000000000000000000000000056666665555555550000000000000000000000000000000000000000
0000000044444445fff55444333e33333e3335570000000000000000000000000000000055555556565656550000000000000000000000000000000000000000
000000004444445f444ff4443e333333333335570000000000000000000000000000000056666656555555550000000000000000000000000000000000000000
00000000444444f44444ff4433333e33333335550000000000000000000000000000000056565656565656550000000000000000000000000000000000000000
000000004444444444444f4433333333333335570000000000000000000000000000000056666656555555550000000000000000000000000000000000000000
0000000044444444444444f455555555555555570000000000000000000000000000000056565656566656550000000000000000000000000000000000000000
0000000044444444444444f455555555555555550000000000000000000000000000000056666656566656550000000000000000000000000000000000000000
00000000444444444444444477755777557775570000000000000000000000000000000056655655566655550000000000000000000000000000000000000000
0000000000000000000000000000000000ddddd000ddddd000ddddd000ddddd00ddddd000ddddd00000000000000000000000000000000000000000000000000
0000000000000000000000000000000000daaad000daaad000daaad000daaad00daaad000daaad00000000000000000000000000000000000000000000000000
000000000000000000000000000000000000a0000000a0000000a0000000a000000a0000000a0000000000000000000000000000000000000000000000000000
00000000000000000000000000000000aaaeaea0aaaeaea000aeaea000aeaea00aeaeaaa0aeaeaaa000000000000000000000000000000000000000000000000
00000000000000000000000000000000000eeea0080eeea000aeeea000aeeea00aeee0800aeee000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000eeea008eeeea000aeeea000aeeea00aeeee800aeee000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000e0e0000000e00000e0e00000e0e0000e0000000e0e000000000000000000000000000000000000000000000000000
00000000000000000000000000000000008808800000088000880880008808800880000008808800000000000000000000000000000000000000000000000000
0000000000000000000000000000000000ddddd000ddddd000ddddd00ddddd000ddddd000ddddd00000000000000000000000000000000000000000000000000
0000000000000000000000000000000000daaad000daaad000daaad00daaad000daaad000daaad00000000000000000000000000000000000000000000000000
000000000000000000000000000000000000a0000000a0000000a000000a0000000a0000000a0000000000000000000000000000000000000000000000000000
00000000000000000000000000000000a1117110a111711000117110011711000117111a0117111a000000000000000000000000000000000000000000000000
00000000000000000000000000000000050171100001711000117110011711000117100001171050000000000000000000000000000000000000000000000000
00000000000000000000000000000000051111a0000111a000a111a00a111a000a1110000a111150000000000000000000000000000000000000000000000000
00000000000000000000000000000000000001000001010000010100001010000010100000100000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000005500055055000550550055055000550550005500000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007770770055505570777070505550507077700750555005000000000000000000000000000000000000000000000000
00000000000000000000000000000000007070700050505070707070505050507070700750505005000000000000000000000000000000000000000000000000
00000000000000000000000000000000007700770055005500777070005550507070700750505005000000000000000000000000000000000000000000000000
00000000000000000000000000000000007070700050505070707070505050507070700050505000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007770700055505070707007505050050077700700555005000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbb3bbbbbbbbbbbbcccccccccccccccc
0000050000000000000000000000000000000ddddd00000000000ddddd90900000000ddddd000000bbbbbbbbbbbbbbbbbb333bbb444444bbcccccccccccccccc
0000050000000000000000000000000000000d444d90900000000d444d90900000000d444d909000bbbbebbbbbbbbbbbb33333bb434444bbccccbbccccccccec
0000666666600000000000000000000000000d444d90900000000d444d99900000000d444d909000bbbbbbb33bbbbbbb3333333b444a33bb33bbbbb33e333333
00006565656000000000000000000000000000040099900000000004000900000000000400999000bbbbbb3333bbbbbbb33333bb434433bb33bbb8b333334433
00006666666000000000000000000000000004e4e4090000000004e4e4090000000004e4e4090000bebbb333333bbbbbbb333bbb444a44bb33b8bbb333344443
00006565656000000000000000000000000004eee4090000000004eee4090000000004eee4090000bbbbb333333bb8bbbbb3bb8b434444bb333bb33333444444
55556666666000000000000000000000000004eee4090000000004eee4090000000004eee4090000bbbbbb3333bbbb8bbbbbb8bb44b434bb3b33433334b44444
66656565656000000000000000000000000004eee4490000000004eee4490000000944eee4490000bbbbbbb33bbbbbbbbbebbbeb444a44bbbbb34333344a4444
55556666666000000000000000000000000004eee0090000000004eee0090000000900eee0090000bbb3bbbbbbbbbbbbbbbbbbbb4b4434bbb8bb33334b444443
66656565656555550000000000000000000944eee0090000000944eee0090000009990eee0090000bb333bbbbbb8bbbbbbbbbbbb449444bbbb8b333444944443
55556666666566650000000000000000000900e0e0090000000900e0e0090000009990e0e0090000b33333bbbbbbbbebbbbbebbb494a44bbbbb33e44494a4433
66656565656555550000000000000000009990e0e0090000009990e0ee090000000000e0e00900003333333bbbbbbbbbbbbbbbbb449494bb3433334444944333
55556666666566650000000000000000009990a0a0090000009990a00a0000000000aae0a0090000b33333bbbbbbbebbbbb8bebb494944bb3433344449443333
66556565566566650000000000000000000000a0a0000000000000a00aa000000000a000a0000000bb333bbbbbbbbbbbbbbbbbbb444449bb3433333444443e33
6655666556656665000000000000000000000aa0aa00000000000aa00000000000000000aa000000bbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbb3333333334433333
00000000000000000000000000000000000000555000000000000055500000000000000000000000000000000000000066666555555556665551111111111111
00000000000000000000005550000000000005555500000000000555550000000000005550000000000005000000000066666555555556666655511111111111
0000000000000000000005555500000000040d444d04000000000d444d0000000000055555000000000005000000000066666566666656666666555111111111
000000000000000000000d444d00000000010d444d01000000000d444d00000000000d444d000000000066666660000066666566666656666566665611111111
000000000000000000000d444d0000000001000400010000000000040000000000000d444d000000000065656560000066666566666656666665666511111111
00000000000000000000000400000000000111171111000000000117110000000000000400000000000066666660000066666566666656666566656511111561
00000000000000000000011711000000000000171000000000000117110000000000011711111114000065656560000055555557755555556665666555111651
00000000000000000000101710100000000000171000000000000117110000000000101710000000555566666660000055555555555555556566656565551651
00000000000000000001001710010000000000171000000000000117115450000001001710000000666565656560000057575757757575756665666566655551
00000000000000000000101110100000000000111000000000000111105050000000101110000000555566666660000055555555555555556566656565666656
00000000000000000000041114000000000000111000000000000111155555000000041110000000666565656565555555555557755555556665666566656665
00000000000000000000001010055500000000101005550000000410155555000000001010055500555566666665666566666665666666666566656565666565
00000000000000000000001010050500000000101005050000000010155555000000001010050500666565656565555566666665666666666665666566656665
00000000000000000000010001555550000000101055555000000010155555000000010001555550555566666665666566666665666666666566666565666565
00000000000000000000001010555550000000101055555000000010100000000000001010555550665565655665666566666665666666666665556566656665
00000000000000000000055050555550000005505055555000000550550000000000055050555550665566655665666566666665666666666665556565666565
__gff__
0000000000000000000000000000010000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010101010100000000000000000000000101010101000000000000000000000002020000000000000000000000000000020200000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000010100000000000000000000000000000000000000000000000001010000000000000000000000000000010100000000
__map__
444142434646444546444546444445660d0e0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c1c000000000000000000000000f100f3f4f100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
445152534546444546444546445455661d1e1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
54555654555654555654555654454566660c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c00000000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6e6d6e6d6e6d6e6d6e6d6e6d6e6d6e66661c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0c0b0000000000000000000000001b1c001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e685e685e685e685e685e685e685e66660c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c1c0000000b000b0cf4f100000b0c0b0c0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6e6d6e6d6e6d6e6d6e6d6e6d6e6d6e66661c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0c0b000000000000000000001b1c1b001b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e685e685e685e685e685e685e685e66660c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c1c0c00000b0c0b0c0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6e6d6e6d6e6d6e6d6e6d6e6d6e6d6e66661c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0c0b0c00001c1b1c1b1c1b0000001b0000e30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e685e685e685e685e685e685e685e66660c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c00f30b0c1c0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6e6d6e6d6e6d6e6d6e6d6e6d6e6d6e66661c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c00000000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e685e685e685e685e685e685e685e66660c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c1c1b1c0c0b0c000c0b00000c000c0000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6e6d6e6d6e6d6e6d6e6d6e6d6e6d6e66661c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0c0b0c0b0c1c1b1c1b1c0c1c001c1b1c1b1c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e685e685e685e685e685e685e685e66660c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b1b1c00f4f1f2f30b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6e6d6e6d6e6d6e6d6e6d6e6d6e6d6e66661c1b1c00001b1c1c1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b0b0c0000000000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e685e685e685e685e685e685e685e666600000c0b0c0b0c0c0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b1b000c0b0c00000b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6e6d6e6d6e6d6e6d6e6d6e6d6e6d6e6666751b1c1b1c1b1c1c1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0c001b1c0000e2e3001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c00000b0c0b0c0b0c0c0c0b0c0b0c0b0c0b0c0b0cf4000b00001b1c1b1c1b00001c00f2f3f4f1f2f3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1c1c1b1c1b1c1b1c1b1c0000000000000000000b0c0b00000000000000000000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b0c0c0b0c0b0b0c0c0b0c0b0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c000000000000000c000c0b0c0b0c0b0c0b0c000000000b0c0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1b1c1c1b1c1b1b1c1c1b1c1b1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0000001c1b1c0000000000001b1c000000e30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0cf10b0c0b0c0000f4f10b0c0b0cf2f30b0c00000000f20000000000000000000000f2f300f100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1b1c1b1c000000000000000000001b001b00000000000000000000000000001c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000e10000000000000000000000000000000000e3000000000000e200000000000000000000000000000000e3000000000000000000e100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f4f1f2f3f4f1f20000f10000000000f3f4000000000000f3f4f1f2f3f4f1f2f300f1f200f4f100f300f10000000000000000f2f30000f20000f100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

