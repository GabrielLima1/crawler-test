require 'watir'
require 'fileutils'

login = "a"
senha = "b"
@button_login = "btn-login"
@selct = "task-menu-sections-select"
@class_link_video = "task-menu-nav-item-link-VIDEO"
@id_video = "video-player-frame_html5_api"
@div_play_video = "vjs-big-play-button"
@link_carreiras = "https://cursos.alura.com.br/careers"
@class_link_carreiras = "lightCard-link"

arquivo = File.new("links.txt", "a+")
# prefs[:download][:default_directory] "LOCAL ONDA VAI SALVAR OS ARQUIVOS"
prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '/home/gabriel/Downloads/Aulas/Ionic'
  }
}



# Metodo para criar pasta
def criar_pasta(path)
  unless File.directory?(path)
    FileUtils.mkdir_p(path)
  end
end

# Metodo para fazer login
def login_site(user, pass)
  @b.goto "https://cursos.alura.com.br/loginForm"
  sleep 3
  @b.text_field(id: 'login-email').set user #preencher
  @b.text_field(id: 'password').set pass#preencher
  @b.button(class: "#{@button_login}").click
  sleep 3
end
def pega_carreira
  @b.links(class: @class_link_carreiras).each do |link_carreira|
    arquivo.puts link_carreira.text
    arquivo.puts link_carreira.href
    arquivo.puts "\n"
  end
end


@b = Watir::Browser.new :chrome, options: {prefs: prefs}
sleep 2
Watir.default_timeout = 90
sleep 2
@b.window.maximize
sleep 2

login_site(login, senha)

@b.goto link_carreiras
pega_carreira

# Entrar no link inicial do curso
# link-inicial-curso = "https://cursos.alura.com.br/course/ionic3-parte1"
# @b.goto link-inicial-curso
#
# # Criar uma pasta com o nome do Curso, para salvar os links
# pasta_curso = path+@b.title
# create_file(pasta_curso)
