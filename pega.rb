#Modulo sem acento memo!
require 'watir-webdriver'

login = "a"
senha = "b"
button_login = "btn-login"
selct = "task-menu-sections-select"
class_link_video = "task-menu-nav-item-link-VIDEO"
id_video = "video-player-frame_html5_api"
div_play_video = "vjs-big-play-button"

arquivo = File.new("links.txt", "a+")

cursos = ["https://cursos.alura.com.br/course/excel/task/10995",
          "https://cursos.alura.com.br/course/excel-2/task/13658",
          "https://cursos.alura.com.br/course/excel-3/task/13518"]


@b = Watir::Browser.new :chrome
sleep 2
Watir.default_timeout = 90
sleep 2
@b.window.maximize

@b.goto "https://cursos.alura.com.br/loginForm"
sleep 3
@b.text_field(id: 'login-email').set login #preencher
@b.text_field(id: 'password').set senha#preencher
@b.button(class: "#{button_login}").click
sleep 3
begin
  cursos.each do |curso|
    arquivo.puts "Inicio Curso: #{@b.title}"

    @b.goto curso
    sleep 2

    modulos = @b.select_list(class: "#{selct}").length
    num = 1

    while modulos >= num
      arquivo.puts "Inicio Modulo: #{@b.select_list(class: "#{selct}").select_value("#{num}")}"
      sleep 2
      @b.select_list(class: "#{selct}").select_value("#{num}")

      links = []
      @b.links(class: "#{class_link_video}").each do |link|
        links << link.href
      end

      links.each do |link|
        @b.goto link
        sleep 2

        link_video = @b.video(id: "#{id_video}").src
        arquivo.puts link_video

        @b.div(class: "#{div_play_video}").click
        sleep 10
      end

      arquivo.puts "Fim Modulo: #{@b.select_list(class: "#{selct}").select_value("#{num}")}"
      arquivo.puts "|----------------|"
      num+= 1
    end

    arquivo.puts "Fim Curso: #{@b.title}"
    arquivo.puts "|-------------------------------------------------------|"
  end
rescue
  arquivo.puts "|---------------------------------|"
  arquivo.puts "|------Erro - Modulo: #{num}------|"
  arquivo.puts "|---------------------------------|"
end
