require 'watir'
require 'fileutils'


@button_login = "btn-login"
@selct = "task-menu-sections-select"
@class_link_video = "task-menu-nav-item-link-VIDEO"
@id_video = "video-player-frame_html5_api"
@div_play_video = "vjs-big-play-button"
@link_carreiras = "https://cursos.alura.com.br/careers"
@class_link_carreiras = "lightCard-link"
@carreiras = []
@sleep_padrao = 2

arquivo = File.new("links.txt", "a+")
# prefs[:download][:default_directory] "LOCAL ONDA VAI SALVAR OS ARQUIVOS"
@prefs = { download: { prompt_for_download: false, default_directory: '/home/gabriel/Downloads/Aulas/Ionic'} }



# Metodo para criar pasta
def criar_pasta(path)
  unless File.directory?(path)
    FileUtils.mkdir_p(path)
  end
end

# Metodo para abrir o navegador com os parametros de Download
def inicia_navegador (@params)
  @b = Watir::Browser.new :chrome, options: {prefs: @params}
  sleep @sleep_padrao
  Watir.default_timeout = 90
  sleep @sleep_padrao
  @b.window.maximize
  sleep @sleep_padrao
end

# Metodo para fazer login
def login_site(user, pass)
  @b.goto "https://cursos.alura.com.br/loginForm"
  sleep @sleep_padrao
  2.times do
    if @b.url == "https://cursos.alura.com.br/loginForm"
      @b.text_field(id: 'login-email').set user #preencher
      @b.text_field(id: 'password').set pass#preencher
      @b.button(class: "#{@button_login}").click
      sleep @sleep_padrao
    else
      break
    end
  end
end

def pega_carreira
  @b.goto @link_carreiras
  sleep @sleep_padrao
  @b.links(class: @class_link_carreiras).each do |link_carreira|
    arquivo.puts "Carreira: #{link_carreira.text}"
    arquivo.puts "#{link_carreira.href}\n"
    @carreiras << link_carreira.href
  end
end

inicia_navegador(@prefs)

login_site(@login, @senha)

pega_carreira

@carreiras = "https://cursos.alura.com.br/career/desenvolvedor-android" #TESTE

def pega_curso
  @b.goto @carreiras

end
# Entrar no link inicial do curso
# link-inicial-curso = "https://cursos.alura.com.br/course/ionic3-parte1"
# @b.goto link-inicial-curso
#
# # Criar uma pasta com o nome do Curso, para salvar os links
# pasta_curso = path+@b.title
# create_file(pasta_curso)
