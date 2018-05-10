require 'watir'


prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '/home/gabriel/Downloads/Aulas/Ionic'
  }
}
# Metodo para criar pasta
def create_file(path)
  unless File.directory?(path)
    FileUtils.mkdir_p(path)
  end
end
path = "/home/gabriel/Downloads/Aulas/#{@b.title}/"
create_file(path)
# prefs[:download][:default_directory] "LOCAL ONDA VAI SALVAR OS ARQUIVOS"

b = Watir::Browser.new :chrome, options: {prefs: prefs}
b.goto "https://player.vimeo.com/play/915017221?s=251659690_1526015181_97688588be576ddeebeed17fee8f20dd&loc=external&context=Vimeo%5CController%5CApi%5CResources%5CVideoController.&download=1&filename=723-ionic3parte1-video1.1-Introducao174.mp4"
sleep 20

# Entrar no link inicial do curso
link-inicial-curso = "https://cursos.alura.com.br/course/ionic3-parte1"
@b.goto link-inicial-curso

# Criar uma pasta com o nome do Curso, para salvar os links
arquivo = File.new("/home/gabriel/Downloads/Aulas/#{@b.title}/links.txt", "a+")
