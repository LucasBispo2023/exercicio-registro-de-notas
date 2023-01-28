module Boletins

    class Aluno
        attr_accessor :nome, :notaP1, :notaP2, :media

        def cadastro()
            aux = nil? 
            aux2 = nil?
            puts "Digite o nome do aluno(a):"
            self.nome = gets.chomp.capitalize

            puts "Digite a nota da primeira prova do aluno(a):"
            aux = gets.chomp.to_f
            unless (aux < 0 || aux > 10)
                self.notaP1 = aux
            else   
                puts "Valor inválido."
                aux2 = 0
            end

            if (aux2 == nil?)
                puts "Digite a nota da segunda prova do aluno(a):"
                aux2 = gets.chomp.to_f
                unless (aux2 < 0 || aux2 > 10)
                    self.notaP2 = aux2
                else   
                    puts "Valor inválido."
                    cadastro()
                end
                self.media = (notaP1 + notaP2)/2

            else
                cadastro()
            end

        end
    end
    
    def mostrarMenu()
        puts "1 - Cadastrar aluno(a)"
        puts "2 - Editar nota do(a) aluno(a)"
        puts "3 - Imprimir lista de alunos"
        puts "4 - Sair do programa"
    end 

    def procurarAluno(nome, lista)
        vetorAux = Array.new
        if (lista.find{|aluno| aluno[:nome] == nome})
            vetorAux = lista.find{|aluno| aluno[:nome] == nome}
            puts vetorAux.to_h
            editarAluno (vetorAux.to_h)
            puts vetorAux
        else
            puts "Aluno não encontrado"
        end
    end

    def editarAluno(hash)
        opcaoEdicao = 0
        novoNome =""
        notaNova = 0
        puts "Você deseja alterar qual informação?"
        puts "1 - nome do aluno"
        puts "2 - nota da P1"
        puts "3 - nota da P2"
        puts hash
        opcaoEdicao = gets.chomp.to_i

        case opcaoEdicao
        when 1
            puts "Por favor, qual o nome do aluno?"
            novoNome = gets.chomp.to_s
            hash[:nome] = novoNome
            system 'clear'
            puts "Alteração realizada com sucesso"
            5.times{puts}
            opcaoEdicao = 0
            
        when 2
            puts "Por favor, qual a nota da P1?"
            notaNova = gets.chomp.to_f
            puts notaNova.class
            unless (notaNova < 0 || notaNova > 10)
                hash[:notaP1] = notaNova
                hash[:media] = (hash[:notaP2].to_f + notaNova)/2
                system 'clear'
                puts "Alteração realizada com sucesso"
                5.times{puts}
            else
                system 'clear'
                puts "Voce Inseriu uma nota inválida, por favor corrija."
                5.times{puts}
                editarAluno(hash={})
            end

        when 3
            puts "Por favor, qual a nota da P2?"
            notaNova = gets.chomp.to_f
            unless (notaNova < 0 || notaNova > 10)
                hash[:notaP2] = notaNova
                hash[:media] = (hash[:notaP1].to_f + notaNova)/2
                system 'clear'
                puts "Alteração realizada com sucesso."
                5.times{puts}
            else
                system 'clear'
                puts "Voce Inseriu uma nota inválida, por favor corrija."
                5.times{puts}
                editarAluno(hash={})
            end

        else
            system 'clear'
            puts "Comando inválido."
            5.times{puts}
        end

    end

end
