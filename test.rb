require 'watir'


prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '/home/gabriel/Downloads/Aulas/Ionic'
  }
}

prefs[:download][:default_directory] "LOCAL ONDA VAI SALVAR OS ARQUIVOS"

@b = Watir::Browser.new :chrome, options: {prefs: prefs}
@b.goto "https://cursos.alura.com.br/careers"
sleep 20


# Metodo para criar pasta
def criar_pasta(path)
  unless File.directory?(path)
    FileUtils.mkdir_p(path)
  end
end

# Metodo para fazer login


def login(user, pass)
  @b.goto "https://cursos.alura.com.br/loginForm"
  sleep 3
  @b.text_field(id: 'login-email').set user #preencher
  @b.text_field(id: 'password').set pass#preencher
  @b.button(class: "#{button_login}").click
  sleep 3
end

# Metodo para pegar dados inicaisx do curso
def criar_pastas_curso(link_curso)

end

# Entrar no link inicial do curso
link-inicial-curso = "https://cursos.alura.com.br/course/ionic3-parte1"
@b.goto link-inicial-curso

# Criar uma pasta com o nome do Curso, para salvar os links
pasta_curso = path+@b.title
create_file(pasta_curso)
