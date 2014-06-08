#!/usr/bin/ruby1.9

ENCODE_CHARS = [*?a..?z, *?A..?Z]

def encode(n)
	6.times.map{|i|
		n, mod = n.divmod(ENCODE_CHARS.size)
		ENCODE_CHARS[mod]
	}.join
end

# header begin
puts "verbatimtex
\%&latex
\\documentclass{minimal}
\\begin{document}
etex
prologues:=3;
outputtemplate:=\"\%j-\%c.eps\";

beginfig(1)
"
# header end
TILE_SPACE = 2.8
TILE_SIZE = 2.0
TILE_SHIFT = (TILE_SPACE-TILE_SIZE)/2
TEXT_SHIFT = TILE_SIZE * 0.2
BOND = 0.2
DOTS_SPACE = 0.5
HLINE_SPACE = 0.3
COMM_SPACE = 0.8
COMM_SPACE_MULTI = 0.5

x = 0.0
y = 0.0

File.open(ARGV[0], "r").each_line do |line|
	
	line = line.split(/\s+/)
	name = encode(line.object_id)
	
	case line.slice!(0)
	when "tile"
		
		puts "
		pair #{name}[];
		#{name}[0]:=(#{x+TILE_SHIFT}cm, #{y-TILE_SHIFT}cm);
		#{name}[1]:=(#{x+TILE_SHIFT+TILE_SIZE}cm, #{y-TILE_SHIFT}cm);
		#{name}[2]:=(#{x+TILE_SHIFT+TILE_SIZE}cm, #{y-TILE_SHIFT-TILE_SIZE}cm);
		#{name}[3]:=(#{x+TILE_SHIFT}cm, #{y-TILE_SHIFT-TILE_SIZE}cm);
		#{name}[4]:=(#{x+TILE_SHIFT+TILE_SIZE/2}cm, #{y-TILE_SHIFT-TILE_SIZE/2}cm);
		"
		
		line.each_slice(3).with_index do |word, i|
			puts "\t\tfill #{name}[#{i}]--#{name}[#{(i+1)%4}]--#{name}[4]--cycle withcolor .#{word[0]} white;" unless word[0] == "w"
			
			case i
			when 0
				if word[1] == "2"   # north double bonds
					puts "pair #{name}n[];"
					puts "#{name}n[0]:=(#{x+TILE_SHIFT+TILE_SIZE/2-BOND}cm, #{y-TILE_SHIFT}cm);"
					puts "#{name}n[1]:=(#{x+TILE_SHIFT+TILE_SIZE/2-BOND}cm, #{y-TILE_SHIFT+BOND}cm);"
					puts "#{name}n[2]:=(#{x+TILE_SHIFT+TILE_SIZE/2+BOND}cm, #{y-TILE_SHIFT}cm);"
					puts "#{name}n[3]:=(#{x+TILE_SHIFT+TILE_SIZE/2+BOND}cm, #{y-TILE_SHIFT+BOND}cm);"
					puts "draw #{name}n[0]--#{name}n[1];"
					puts "draw #{name}n[2]--#{name}n[3];"
				end
				# north label
				puts "label(btex \$#{word[2]}\$ etex, (#{x+TILE_SHIFT+TILE_SIZE/2}cm, #{y-TILE_SHIFT-TEXT_SHIFT}cm));" unless word[2] == "empty"
			when 1
				if word[1] == "2"   # east double bonds
					puts "pair #{name}e[];"
					puts "#{name}e[0]:=(#{x+TILE_SHIFT+TILE_SIZE     }cm, #{y-TILE_SHIFT-TILE_SIZE/2+BOND}cm);"
					puts "#{name}e[1]:=(#{x+TILE_SHIFT+TILE_SIZE+BOND}cm, #{y-TILE_SHIFT-TILE_SIZE/2+BOND}cm);"
					puts "#{name}e[2]:=(#{x+TILE_SHIFT+TILE_SIZE     }cm, #{y-TILE_SHIFT-TILE_SIZE/2-BOND}cm);"
					puts "#{name}e[3]:=(#{x+TILE_SHIFT+TILE_SIZE+BOND}cm, #{y-TILE_SHIFT-TILE_SIZE/2-BOND}cm);"
					puts "draw #{name}e[0]--#{name}e[1];"
					puts "draw #{name}e[2]--#{name}e[3];"
				end
				# east label
				puts "label(btex \$#{word[2]}\$ etex, (#{x+TILE_SHIFT+TILE_SIZE-TEXT_SHIFT}cm, #{y-TILE_SHIFT-TILE_SIZE/2}cm));" unless word[2] == "empty"
			when 2
				if word[1] == "2"   # south double bonds
					puts "pair #{name}s[];"
					puts "#{name}s[0]:=(#{x+TILE_SHIFT+TILE_SIZE/2-BOND}cm, #{y-TILE_SHIFT-TILE_SIZE}cm);"
					puts "#{name}s[1]:=(#{x+TILE_SHIFT+TILE_SIZE/2-BOND}cm, #{y-TILE_SHIFT-TILE_SIZE-BOND}cm);"
					puts "#{name}s[2]:=(#{x+TILE_SHIFT+TILE_SIZE/2+BOND}cm, #{y-TILE_SHIFT-TILE_SIZE}cm);"
					puts "#{name}s[3]:=(#{x+TILE_SHIFT+TILE_SIZE/2+BOND}cm, #{y-TILE_SHIFT-TILE_SIZE-BOND}cm);"
					puts "draw #{name}s[0]--#{name}s[1];"
					puts "draw #{name}s[2]--#{name}s[3];"
				end
				# south label
				puts "label(btex \$#{word[2]}\$ etex, (#{x+TILE_SHIFT+TILE_SIZE/2}cm, #{y-TILE_SHIFT-TILE_SIZE+TEXT_SHIFT}cm));" unless word[2] == "empty"
			when 3
				if word[1] == "2"   # west double bonds
					puts "pair #{name}w[];"
					puts "#{name}w[0]:=(#{x+TILE_SHIFT     }cm, #{y-TILE_SHIFT-TILE_SIZE/2-BOND}cm);"
					puts "#{name}w[1]:=(#{x+TILE_SHIFT-BOND}cm, #{y-TILE_SHIFT-TILE_SIZE/2-BOND}cm);"
					puts "#{name}w[2]:=(#{x+TILE_SHIFT     }cm, #{y-TILE_SHIFT-TILE_SIZE/2+BOND}cm);"
					puts "#{name}w[3]:=(#{x+TILE_SHIFT-BOND}cm, #{y-TILE_SHIFT-TILE_SIZE/2+BOND}cm);"
					puts "draw #{name}w[0]--#{name}w[1];"
					puts "draw #{name}w[2]--#{name}w[3];"
				end
				# north label
				puts "label(btex \$#{word[2]}\$ etex, (#{x+TILE_SHIFT+TEXT_SHIFT}cm, #{y-TILE_SHIFT-TILE_SIZE/2}cm));" unless word[2] == "empty"
			else
				$stderr.puts "Too many sides of tile!"
			end
		end
		
		#{name}[]:=(#{x}cm, #{y}cm);
		# ==================================================================
		puts "
		draw #{name}[0]--#{name}[1]--#{name}[2]--#{name}[3]--cycle;
		draw #{name}[0]--#{name}[2];
		draw #{name}[1]--#{name}[3];"
		# ==================================================================
		
		x += TILE_SPACE
	when "dashedtile"
		puts "
		pair #{name}[];
		#{name}[0]:=(#{x+TILE_SHIFT}cm, #{y-TILE_SHIFT}cm);
		#{name}[1]:=(#{x+TILE_SHIFT+TILE_SIZE}cm, #{y-TILE_SHIFT}cm);
		#{name}[2]:=(#{x+TILE_SHIFT+TILE_SIZE}cm, #{y-TILE_SHIFT-TILE_SIZE}cm);
		#{name}[3]:=(#{x+TILE_SHIFT}cm, #{y-TILE_SHIFT-TILE_SIZE}cm);
		#{name}[4]:=(#{x+TILE_SHIFT+TILE_SIZE/2}cm, #{y-TILE_SHIFT-TILE_SIZE/2}cm);
		"
		puts "
		draw #{name}[0]--#{name}[1]--#{name}[2]--#{name}[3]--cycle dashed evenly;"
		puts "label(btex \$#{line[0]}\$ etex, (#{x+TILE_SHIFT+TILE_SIZE/2}cm, #{y-TILE_SHIFT-TEXT_SHIFT}cm));"
		x += TILE_SPACE
	when "comment"
		x = 0
		printf "\t\tlabel.rt(btex "
		line.each do |word| printf("%s ", word) end
		puts " etex, (0cm, #{y-COMM_SPACE/2}cm));"
		y -= COMM_SPACE
	when "multicomment"
		x = 0
		printf "\t\tlabel.rt(btex "
		line.each do |word| printf("%s ", word) end
		puts " etex, (0cm, #{y-COMM_SPACE/2}cm));"
		y -= COMM_SPACE_MULTI
	when "dots"
		puts "\t\tlabel(btex \$\\ldots\$ etex, (#{x+DOTS_SPACE/2}cm, #{y-TILE_SPACE/2}cm));"
		x += DOTS_SPACE
	when "down"
		y -= TILE_SPACE
		x -= TILE_SPACE
	when "toleft"
		x -= 2*TILE_SPACE
	when "emptytile"
		x += TILE_SPACE
	when "endl"
		y -= TILE_SPACE
		x = 0.0
	when "hline"
		y -= TILE_SPACE
		puts "
		pair #{name}hl[];
		#{name}hl[0] := (0cm, #{y-HLINE_SPACE/2}cm);
		#{name}hl[1] := (#{x}cm, #{y-HLINE_SPACE/2}cm);
		draw #{name}hl[0]--#{name}hl[1] dashed evenly;
		"
		y -= HLINE_SPACE
		x = 0.0
	when "hspace"
		y -= TILE_SPACE + HLINE_SPACE
		x = 0.0
	else
		$stderr.puts "Unknown type"
	end
	
end

# footer
puts "
endfig;

end;"
