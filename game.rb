system "clear"
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
  [W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W]]
MapSettings = {"WinMessage"=>"\e[34m\e[1mYou won!\e[0m"}
x = 1
y = 1

define_singleton_method("showmap") {
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
1 is frontwards
2 is backwards
3 is up
4 is down """

while true
  print "Move: "
  move = gets.chomp
  system("clear")
  
  case move
  when "1"
    win unless map[y][x+1]!=G
    if map[y][x+1]!=W
      map[y][x]=T
      map[y][x+1]=P
      x+=1
    end
  when "2"
    win unless map[y][x-1]!=G
    if map[y][x-1]!=W
      map[y][x]=T
      map[y][x-1]=P
      x-=1
    end
  when "3"
    win unless map[y-1][x]!=G
    if map[y-1][x]!=W
      map[y][x]=T
      map[y-1][x]=P
      y-=1
    end
  when "4"
    win unless map[y+1][x]!=G
    if map[y+1][x]!=W
      map[y][x]=T
      map[y+1][x]=P
      y+=1
    end
  end
  showmap
end
