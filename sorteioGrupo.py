import random
import pandas as pd
alunos=['Ayrton', 'Alex', 'Caio', 'Daniel', 'David', 'Delson', 'Francisco', 'Gabriel Conceição', 'Gabriel Soares', 'Gabriel Vínicius', 'Guilherme', 'Hebert', 'Marlon', 'Marta', 'Nayane', 'Paulo Victor', 'Pedro', 'Robson', 'Sérgio', 'Valdomiro']
def sorteio(alunos):
    quantidadePessoas= int(input("Digite quantas pessoas em cada grupo:\n >>"))
    tamanhoAlunos=len(alunos)
    tamanhoAlunosAtual=tamanhoAlunos
    grupo=1
    grupos=[]
    while grupo<=tamanhoAlunos/quantidadePessoas:
        gruposAuxiliar=[]
        alunoGrupo=0
        while alunoGrupo<quantidadePessoas:
            numeroSorteio=random.randint(0,tamanhoAlunosAtual-1)
            tamanhoAlunosAtual-=1
            gruposAuxiliar.append(alunos[numeroSorteio-1])
            alunos.pop(numeroSorteio-1)
            alunoGrupo+=1
        grupo+=1
        grupos.append(gruposAuxiliar)
    return grupos
def exibirGrupos(grupos):
    indice=1
    for grupo in grupos:
        print(f'Grupo {indice}')
        pessoas=0
        tamanhoGrupo=len(grupo)
        while pessoas < tamanhoGrupo:
            print(f'{grupo[pessoas]}')
            pessoas+=1
        indice+=1
        print('\n')
exibirGrupos(sorteio(alunos))          