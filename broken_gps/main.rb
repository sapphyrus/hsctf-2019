require "bundler/inline"

gemfile do
	source "https://rubygems.org"
	gem "vector2d"
end

moves = {
	"north" => Vector2d(0, -1),
	"northeast" => Vector2d(1, -1),
	"east" => Vector2d(1, 0),
	"southeast" => Vector2d(1, 1),
	"south" => Vector2d(0, 1),
	"southwest" => Vector2d(-1, 1),
	"west" => Vector2d(-1, 0),
	"northwest" => Vector2d(-1, -1)
}
files = Dir["input/*.txt"]

files_pos = {}
files.each do |filename|
	pos = Vector2d(0, 0)

	lines = File.read(filename).each_line.to_a
	max = lines[0].to_i
	lines[1..max].each do |line|
		pos += moves[line.chomp]
	end

	files_pos[File.basename(filename).to_i] = pos
end

print("hsctf{")
files_pos.sort.each do |i, pos|
	print (((pos.length*2).round % 26)+97).chr
end
puts "}"
