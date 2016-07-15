# class Prawn
# 	def pdf
# 		Prawn::Document.generate("explicit.pdf") do |pdf|
# 			pdf.text "Hello World"
# 			puts pdf
# 		end
# 	end
# end


# -*- coding: utf-8 -*-
require "prawn"
require "prawn/table"

class Certificate
  attr_accessor :aluno

  PDF_OPTIONS = {
    :page_size   => "A5",
    :page_layout => :landscape,
    #:background  => "cert_bg.resized.png",
  }

  def initialize(aluno = nil)

      @aluno = aluno
    end

  def pdf
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      pdf.fill_color "40464e"
      #definindo a cor do PDF
      pdf.text "Ruby Metaprogramming", :size => 40, :style => :bold, :align => :center
      #Titulo
      pdf.move_down 30
      pdf.text "Certificado", :size => 24, :align => :center, :style => :bold

      pdf.move_down 30
      pdf.text "Certificamos que <b>#{aluno}</b> participou...", :inline_format => true
      #Texto do certificado
      pdf.move_down 15
      pdf.text "Sao Paulo, #{Time.now.strftime("%d/%m/%Y")}."

      pdf.move_down 30
      # pdf.font Rails.root.join("fonts/custom.ttf")
      pdf.text "howto", :size => 24

      pdf.move_up 5
      pdf.font "Helvetica"
      pdf.text "http://howtocode.com.br", :size => 10
      pdf.table ([["D."]])
    end
  end
  
  def save
    pdf.render_file("#{aluno}.pdf")
  end
end

alunos = ["123 da Silva 4", "Adoniran Barbosa", "Pedro Paulo Pereira"]

alunos.each do |aluno|
    Certificate.new(aluno).save
end
