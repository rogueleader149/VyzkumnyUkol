#!/usr/bin/ruby1.9

require "yaml"
require "set"

class Array
	def to_tile(color = "green", type = "ndef", conc = 1)
		return "{ #{self[0].to_s} #{self[1].to_s} #{self[3].to_s} #{self[2].to_s} }[#{conc}](#{color.to_s})   % type=#{type}" if self.size == 4
		return nil
	end
	def add(out, glues)
		self.map!{|a| a.to_s}
		out << self
		glues.merge(self)
	end
	def contain?(substr)
		self.inject(false){|cont, word| cont || word.include?(substr)}
	end
end

class Graph
	
	attr_reader :n
	attr_reader :k
	
	def initialize(arr, k=0)
		correct = arr.instance_of?(Array)
		@k = k
		if correct
			n = arr.size
			arr.each do |line|
				correct &&= line.instance_of?(Array) && line.size == n
			end
			@adj = correct ? arr : [[0]]
			@n = correct ? n : 1
			@k = correct ? k : 0
			if @k.odd?   # add imaginary vertex
				@adj.each do |line|
					line << 1
				end
				@adj << Array.new(@n+1, 1)
				@n += 1
				@k += 1
			end
		else
			@adj = [[0]]
			@n = 1
			@k = 0
		end
	end
	
	def each_edge
		@n.times do |u|
			@n.times do |v|
				if u < v and @adj[u][v] > 0
					yield u, v
				end
			end
		end
	end
end

k = ARGV[0].nil? ? 4 : ARGV[0].to_i
filename = ARGV[1].nil? ? "graph.yaml" : ARGV[1]
file = File.open(filename, "r")
g = Graph.new(YAML.load(file.read), k)

out = []
glues = Set.new


##################
# generate tiles #
##################

# bottom tiles
# ----------------------------------------------------------------------

(g.k/2 + 1).times do |i|
	["BB#{2*i}", "BB#{2*i+1}", :e, :e].add(out, glues)   # bottom connecting tiles
	if i>0
		g.each_edge do |u,v|
			["i#{u+1}c#{g.k-2*i+2}" ,"i#{v+1}c#{g.k-2*i+1}" , "BB#{2*i-1}", "BB#{2*i}"].add(out, glues)   # generating tiles, reverse color order
		end
	end
end


# bottom corner tiles
# ----------------------------------------------------------------------

[:e, :sh, :e, :BB0].add(out, glues)
[:as, :e, "BB#{g.k+1}", :e].add(out, glues)


# inner tiles
# ----------------------------------------------------------------------

g.each_edge do |u,v|   # u < v
	g.k.times do |j|
		j.times do |i|   # i < j
			# sort by color !!!
			["i#{u+1}c#{i+1}", "i#{v+1}c#{j+1}", "i#{u+1}c#{i+1}", "i#{v+1}c#{j+1}"].add(out, glues)
			["i#{u+1}c#{i+1}", "i#{v+1}c#{j+1}", "i#{v+1}c#{j+1}", "i#{u+1}c#{i+1}"].add(out, glues)
			# vertices in reverse order
			["i#{v+1}c#{i+1}", "i#{u+1}c#{j+1}", "i#{v+1}c#{i+1}", "i#{u+1}c#{j+1}"].add(out, glues)
			["i#{v+1}c#{i+1}", "i#{u+1}c#{j+1}", "i#{u+1}c#{j+1}", "i#{v+1}c#{i+1}"].add(out, glues)
		end
	end
end

(g.n).times do |v|   # border tiles
	(g.k-1).times do |i|   # for each color, excluded those for verification !!!
		[:BSH, "i#{v+1}c#{i+2}", :sh, "i#{v+1}c#{i+2}"].add(out, glues)
		["i#{v+1}c#{i+1}", :BAS, "i#{v+1}c#{i+1}", :as].add(out, glues)
	end
end


# border tiles
# ----------------------------------------------------------------------

[:e, :sh, :e, :BSH].add(out, glues)
[:as, :e, :BAS, :e].add(out, glues)


# verification tiles
# ----------------------------------------------------------------------

(g.k/2).times do |i|
	g.n.times do |v|
		if i == 0
			[:e, :D, :sh, "i#{v+1}c1"].add(out, glues)
			[:C, :e, "i#{v+1}c#{g.k}", :as].add(out, glues)
		else
			[:e, :D, :D, "i#{v+1}c#{i+1}"].add(out, glues)
			[:C, :e, "i#{v+1}c#{g.k-i}", :C].add(out, glues)
		end
	end
end


# DONE tile
# ----------------------------------------------------------------------

[:e, :e, :D, :C].add(out, glues)


######################
# write final output #
######################

puts "tile edges matches {{N E S W}*}"
puts "num tile types=#{out.size}"
puts "num binding types=#{glues.size}"

printf "binding type names= { "
glues.each do |g|
	printf("%s ", g.to_s)
end
puts "}"

puts "tile edges={"
out.each do |line|
	if line.include?("D") and line.include?("C")
		color = "magenta"
		type = "DONE"   # OK
	elsif line.include?("D") or line.include?("C")
		color = "blue"
		type = "verification"   # OK
	elsif (line.include?("sh") or line.include?("as")) and line.include?("e")
		color = "red"
		type = "border + border bottom"   # OK
	elsif line.include?("e")
		color = "yellow"
		type = "bottom connecting"
	elsif line.contain?("BB")
		color = "orange"
		type = "bottom generating"
	elsif line.include?("BSH") or line.include?("BAS")
		color = "pink"
		type = "inner border"
	else
		color = "green"
		type = "inner"
	end
	puts line.to_tile(color, type)
end
puts "}"

printf "binding strengths={ "
glues.each do |g|
	if g.start_with?("B")
		printf("%d ", 2)
	elsif g.start_with?("e")
		printf("%d ", 0)
	else
		printf("%d ", 1)
	end
end
puts "}"

puts 'seed=8,2,1
size=8
block=32'
