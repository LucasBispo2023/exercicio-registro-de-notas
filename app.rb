require_relative 'exercicioBoletins'

include Boletins

opcaoMenu = 0
mostraMenu = true
nomeEmEdicao = ""
alunos = Array.new
alunoInserido = Hash.new

while (mostraMenu == true) do
    
    if (opcaoMenu == 0)
        Boletins::mostrarMenu
        puts "Digite uma opção valida:"
        opcaoMenu = gets.chomp.to_i

    else
        case opcaoMenu

        when 1 
            alunoNovo = Aluno.new
            alunoNovo.cadastro
            alunoInserido = { nome:"#{alunoNovo.nome}", notaP1:"#{alunoNovo.notaP1}", notaP2:"#{alunoNovo.notaP2}", media:"#{alunoNovo.media}"}
            alunos.push(alunoInserido)
            system 'clear'
            3.times {puts}
            puts "#{alunoInserido[:nome]} inserido no sistema com as notas #{alunoInserido[:notaP1]} e #{alunoInserido[:notaP2]}. A média dele(a) é #{alunoInserido[:media]}"
            3.times {puts}
            opcaoMenu = 0

        when 2
            puts "Qual o nome do aluno que você gostaria de alterar?"
            nomeEmEdicao = gets.chomp
            puts "Verificando..."
            5.times {puts}
            Boletins::procurarAluno(nomeEmEdicao.capitalize,alunos)
            5.times {puts}
            opcaoMenu = 0

        when 3
            system 'clear'
            puts alunos
            puts
            opcaoMenu = 0

        when 4
            system 'clear'
            puts "Obrigado por utilizar esse sistema"
            mostraMenu = false

        else
            system 'clear'
            puts "Por favor, digite um comando válido"
            5.times {puts}
            opcaoMenu = 0
        end

    end
end 