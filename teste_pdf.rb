require "prawn"
require "prawn/table"
@pessoa = Cliente.all
    @pessoa.each do |pessoa|
      caminho = "/home/usuario/Documentos/pdf/#{pessoa.nome}.pdf" #Caminho onde irá ficar o arquivo
      #caminho_img = "/home/desenvolvimento/Área de Trabalho/background.png" 
Prawn::Document.generate(caminho) do |pdf|
pdf.bounding_box([100, 500], :width => 300, :height => 200) do 
  text "Hello!"
  table([["Un, dos, tres", "uno pasito pra frente maria"], ["Un, dos, tres","uno pasito pra tras"]])
end
