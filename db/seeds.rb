puts 'Gerando ideas...'

5.times do |i|
  Idea.create(
    name: ["terminal", "cobol", "jcl"].sample ,
    description: "ideia usada em mainframes"
    )
end

puts 'ideas gerados com sucesso!'