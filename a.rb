require 'fileutils'

def create_file(path)
  unless File.directory?(path)
    FileUtils.mkdir_p(path)
  end
end

arquivo = "/home/gabriel/Downloads/Aulas/Test/"
