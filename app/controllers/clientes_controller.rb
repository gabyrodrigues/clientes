class ClientesController < ApplicationController
	require 'csv'
  require "prawn"
  require "prawn/table"
	
	def self.index

	end

	def buscar
		arquivo = params[:clientes][:nome_arquivo].tempfile
		upload = CSV.table(arquivo, :col_sep => ';', :encoding => 'UTF-8')

		upload.each do |row|
			cliente = Cliente.create(
				nome: row.fetch(:nome),
				telefone: row.fetch(:telefone),
				endereco: row.fetch(:endereco),
				cep: row.fetch(:cep),
				valor: row.fetch(:valor),
				vencimento: row.fetch(:vencimento)
				)
		end
  end	
  def criar_pdf

    @pessoa = Cliente.all
    @pessoa.each do |pessoa|
      caminho = "/home/desenvolvimento/Área de Trabalho/Testes/#{pessoa.nome}.pdf" #Caminho onde irá ficar o arquivo
     
      #caminho_img = "/home/desenvolvimento/Área de Trabalho/background.png"
      Prawn::Document.generate(caminho) do |pdf|
        pdf.bounding_box([5, 700], :width => 300, :height => 200) do   
         	#pdf.text "Nome: #{pessoa.nome}"
          #pdf.text "CEP: #{pessoa.cep}"
          #pdf.text "CPF#{pessoa.cpf}"
          #pdf.table([["#{pessoa.nome}", "uno pasito pra frente maria"], ["Un, dos, tres","uno pasito pra tras"]])
        	pdf.table([["Nome:"], ["#{pessoa.nome}"], ["Telefone:"], ["#{pessoa.telefone}"], ["Endereço:", "CEP:"], ["#{pessoa.endereco}", "#{pessoa.cep}"], ["Valor:", "Vencimento:"], ["#{pessoa.valor}", "#{pessoa.vencimento}"]])
        end       
      end
   	end
	end
end 

