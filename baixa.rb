require 'watir-webdriver'

prefs = {
  download: {
    default_directory: '/home/gabriel/Downloads/Aulas/Ionic'
  }
}

b = Watir::Browser.new :chrome, options: {prefs: prefs}

arquivo = File.open("links.txt")
link_er = []

while !arquivo.eof?
  cod = arquivo.readline
  link_er << cod
end

link = []

link_er.each do |li|
  if li.include? "http"
    link << li
  end
end

@b = Watir::Browser.new :chrome
Watir.default_timeout = 90
sleep 3
@b.window.maximize

link.each do |lin|

  @b.goto lin

  sleep 10
end
