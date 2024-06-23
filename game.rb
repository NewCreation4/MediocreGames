require "io/console"

P = "\e[34m\e[1m&\e[0m"
T = "\e[90m#\e[0m"
W = "\e[94m\e[2m!\e[0m"
G = "\e[32m$\e[0m"

map = [
  [W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W],
  [W,P,W,T,T,T,W,T,W,T,W,T,T,T,T,T,T,T,W],
  [W,T,T,T,W,T,T,T,T,T,T,T,T,W,W,W,W,T,W],
  [W,T,W,T,T,T,T,T,W,W,W,W,W,W,T,T,T,T,W],
  [W,W,W,W,W,W,W,W,W,W,T,T,W,T,T,T,W,W,W],
  [W,G,T,T,T,T,T,T,T,T,T,T,T,T,W,T,T,T,W],
  [W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W]
]
MapSettings={
  "WinMessage" => "You won!"
}
x=1
y=1

define_singleton_method("showmap") {
  system "clear"
  map.each do |line|
    line.each do |tile|
      print "#{tile} "
    end
    print "\n"
  end
}
define_singleton_method("win") {
  puts MapSettings["WinMessage"]; exit
}; showmap
puts """
w = up
s = down
a = left
d = right
l = exit
"""

while true
  input = STDIN.getch
  case input
  when "w"
    win unless map[y-1][x]!=G
    if map[y-1][x]==T
      y-=1
      map[y+1][x]=T
      map[y][x]=P
    end
  when "s"
    win unless map[y+1][x]!=G
    if map[y+1][x]==T
      y+=1
      map[y-1][x]=T
      map[y][x]=P
    end
  when "a"
    win unless map[y][x-1]!=G
    if map[y][x-1]==T
      x-=1
      map[y][x+1]=T
      map[y][x]=P
    end
  when "d"
    win unless map[y][x+1]!=G
    if map[y][x+1]==T
      x+=1
      map[y][x-1]=T
      map[y][x]=P
    end
  when "l"
    exit
  end
  showmap
  puts "X: #{x} Y: #{y}"
end
