# Aula 02 - 11/03/2026


# objetos -----------------------------------------------------------------
# Object-orientede programming
A = 1
B <- "b"
435768 -> C

D = 322 + 9874

A + A * 2
# nomear os objetos com nomes pequenos
# não podem ter espaços entre as palavras (usar _ ou ".")
# tente não misturar letras maiúsculas com minúsculas
# não use caracteres especiais usados (reservados) pelo R ($, #, %, &, |, *, @)
# não comecer os nomes dos objetos com números ou underlines
national_team_with_more_world_cups = "Brasil"
top_wc = "Brasil"

# se um objeto temporário virar permanente, nomeie especificamente o objeto

class(TRUE) #logical
class("A") #character
class("1") #TUDO que estiver "" será character!
class(1.2) #numeric
class(10L) #números inteiros
temp = "1"
is.numeric(temp) # é numérico? Do objeto.


# vetores -----------------------------------------------------------------
# vetores: Object of the same kind are stored in a single-dimension object
d = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, "E", "E", "E", "F", "F", "F")
d
# eu não posso misturar dentro dos vetores dois tipos de classes de objeto,
# no exemplo acima, como misturei, ele colocou aspas para todos
# só consigo misturar quando aparece "NA":
e = c(1, 2, 3, NA, 5, NA, 6)
e
sum(e, na.rm = TRUE) #algumas funções tenho que tirar os NAs
length(d) #tamanho do vetor
unique(d) #quais são os valores únicos, ou seja, sem repetição
length(unique(d)) #quantidade de valores únicos do vetor

seq(1, 10)
seq_along(d) #coloca número para os elementos do meu vetor

solanaceas = c("tomato", "potato")
sola1 = rep(solanaceas, times = 50) # "times" repete 50 vzs cada palavra, mas invertendo: tomato, potato, tomato, potato...
sola2 = rep(solanaceas, each = 50) # "each" repete 50 vzs tomato e dps 50 vzs potato

sample(d, 3) #amostrar três valores do vetor d
sample(1:100, 3)

sort(sample(1:100, 50), decreasing = TRUE) # coloca os valores sorteados em ordem
# decreasing = TRUE -> ordem descrescente
# decreasing = FALSE -> ordem crescente

# tudo que eu coloco dentro das funções são os argumentos, ex o decreasing

# para pegar um objeto específico do vetor uso os colchetes []
d[1] #primeiro elemento do vetor d
d[2]
(e[1] * e[3])

# matrizes ----------------------------------------------------------------
# "ctrl" "shift" "r" : atalho para criar essas "gavetas"
# Matrizes: bidimensionais
# matrizes também nao aceitam elementos de classes diferentes

a = c(1, 2, 3, 4)
b = c(5, 6, 7, 8)
c = c(9, 10, 11, 12)
d = c(13, 14, 15, 16)
mat1 = cbind(a, b, c, d) # une por colunas
mat1

a = c(1, 2, 3, 4)
b = c(5, 6, 7, 8)
c = c(9, 10, 11, 12)
d = c(13, 14, 15, 16)
mat2 = rbind(a, b, c, d) #une por linhas (empilha)
mat2

# as funções cbind e rbindo a quanitidade de elementos dos vetores tem que ser igual

# a função matrix nao precisa ser igual

mat5 = matrix(
  c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20),
  nrow = 4,
  ncol = 5,
  byrow = T
)
mat5

# "alt" depois "-": atalho para fazer a setinha <-

# "ctrl" "shift" "a" -> função que alinha todos os termos: identação
# coloca espaço entre as vírgulas, etc
# tem que selecionar todo o script depois executar o "ctrl" "shift" "a"

mat5
rownames(mat5) #nulo porque nao tem nome
colnames(mat5)
rownames(mat5) = c("A","B","C","D") #nomeio as linhas
colnames(mat5) = letters[1:5] #nomeio as colunas com a função letters

# localizar um numero dentro da matriz uso [] também
# mas como é bidimensional, preciso colocar dois números
mat5[1,2] #primeira linha, segunda coluna
mat5[,2] #todos os elementos da coluna 2
mat5[1,] #todos os elementos da linha 1
mat5[c(1,2),c(3,4)] #fazer uma "submatriz"


# factors -----------------------------------------------------------------
# fator pode ser composto com vários tipos de classes, mas ele não "uniformiza"
# as classes, assim como os vetores faziam 
# mas não é possível fazer "contas"
a = factor(c(1,2,3,4,5,6));a
d = factor(c(1,1,1,2,2,2,3,3,3,4,4,4,"E","E","E","F","F","F"))
class(d)


# data frames -------------------------------------------------------------

# tabelas = posso misturar as classes dos objetos
x = 1:10
y = letters[1:10]
z = LETTERS[1:10]

ex = data.frame(name1 = x,
                name2 = y,
                name3 = z)
ex

#quando você carregar objetos no R, dados fenotipicos qualquer, geralmente ele
# vem em formato de data frame

getwd() # saber qual é o diretório do meu trabalho
setwd() # definir o diretório de trabalho

install.packages("readxl")

# read.csv -> vírgula como separador no excel
# read.csv2 -> ponto e vírgula como separador no excel

df = read.table("https://raw.githubusercontent.com/saulo-chaves/Vcov-RM-grandiflorum/main/Data/dataset.txt", header = TRUE)
head(df) #mostra as 6 primeiras linhas

install.packages("tidyverse")


# operadores lógicos ------------------------------------------------------
# ==
# |=
# >
# <
# >=
# <=
# %in% -> dentro do vetor years, eu tenho "Y01", "Y04"?
# & -> "empilhar" comandos: eu quero "Y01", "Y04" E "H152"
# | -> "empilhar" comandos: eu quero "Y01", "Y04" OU "H152"
# |> : pipe -> atribui ao data frame a função imediatamente a direita, sem preciar atribuir
# nome no objeto
# e eu consigo conectar funções


# filtros -----------------------------------------------------------------
filt_df = df[which(df$Years %in% c("Y01", "Y04") & df$Hybrids == "H152"),]
head(filt_df)
which(df$Years %in% c("Y01", "Y04") & df$Hybrids == "H152")
# wich -> ele vai me retornar as posições em que as condições são atendidas
# como está entre [] ele já me da o valor

require(tidyverse)
filt_df = df |> filter(Years %in% c("Y01", "Y04") & Hybrids == "H152")
head(filt_df)
# |> : pipe -> para esse data frame use a função filtrer
# ctrl shift n : %>% (aparece o pipe antigo)

# Consigo selecionar as colunas que eu quero e nao quero para criar uma nova matriz:
sel_df = df[,c("Hybrids", "nf", "pf")]
head(sel_df)
sel_df = df[,c(-1, -3, -5)]
head(sel_df)
# usando o tidyverse
sel_df = df |> select(Hybrids, nf, pf)
head(sel_df)
sel_df = df |> select(-Hybrids, -nf, -pf)
head(sel_df)

# integração de funções usando o tidyverse
df |> filter(Years %in% c("Y01", "Y04") & Hybrids == "H152") |> 
  select(Hybrids, Years, pf, nf)
# pipe -> atribui ao data frame a função imediatamente a direita, sem preciar atribuir
# nome no objeto
# e eu consigo conectar funções

# mudar a ordem das colunas para mudar no data.frame
df |> filter(Years %in% c("Y01", "Y04") & Hybrids == "H152") |> 
  select(Hybrids, Years, pf, nf) #usando select
head(df |> relocate(Hybrids, .before = Years)) # usando head (before antes)
head(df |> relocate(nf, pf, .after = Plots)) # after depois
# se eu usasse as funções basicas do R, teria que digitar TODOS os nomes das colunas : ( 

# Mudar o nome das colunas
# Opção 1: escrever o nome todas as colunas
require(tidyverse)
colnames(sel_df) = c("yr", "pl", "rep", "id")
head(sel_df)
# Opção 2: usar o tidyverse usadndo a função rename para mudar o nome 
sel_df = sel_df |> rename("Year" = "yr") # "nome novo" = "nome antigo"
head(sel_df)

# mudar a ordem do data fram -> função order
# usando o R básico:
df$Hybrids
sort(df$Hybrids) #coloca em ordem os próprios elementos do vetor
order(df$Hybrids) #ele me dá o local dos argumentos em ordem das linhas
# se eu quiser ordenar o data frame uso o ORDER
# df [linha, coluna]
order(df$pf,decreasing = TRUE) # a planta que tem maior produção esta no elemento 4538
df[order(df$pf, decreasing = TRUE),] # me da o elemento de maior produção

ord_df = df[order(df$Hybrids, df$Plot, decreasing = TRUE),]
head(ord_df,10)
# ordem usando o tidyverse:
ord_df = df |> arrange(Hybrids, pf) #ordena primeiro hibridos e depos produção
head(ord_df)
ord_df = df |> arrange(desc(ID)) #ordem decrescente
head(ord_df)

#função mutate adiciona uma coluna no data frame
# função básica no R:
df$ID2 = seq_along(df$Years) #informação que eu quero inserir tem que ter o mesmo tamanho do data frame
df
# usando o mutate:
df |> mutate(ID2=seq_along(Years), temp = nf + pf)
# a função mutate permite add mais de uma coluna e fazer operações com as colunas
aa = df |> mutate(ID2=seq_along(Years), temp = nf + pf,
             rep = as.factor(Replicates))
class(aa$rep)


# funções para união ------------------------------------------------------

# inner_join: creates a new dataset with only the elements that are common between two data frames
band_members
band_instruments
inner_join(band_members, band_instruments, by = "name")

# left_join: add columns of the second data frame (right) to the first data frame (left) based on the correspondence
band_members |> left_join(band_instruments, by = 'name')
# se não houver correspondência ele coloca com NA
band_instruments |> left_join(band_members, by = 'name')

#right_join: add columns of the first data frame (left) to the second data frame (right) based on the correspondence
band_members|> right_join(band_instruments, by = 'name')

#full_join: acts like inner_join, but adds NA in cells that do not match
band_members |> full_join(band_instruments, by = 'name')
# em vez de excluir a linha que nao tem a informação simultanea igual ao
# inner_join, coloca na

# The columns used to join both datasets should have the same name. If this is not the case, you have to specify it
# Considere essas duas colunas, mas apesar do nome diferente, sao a mesma coisa:
band_members |> full_join(band_instruments2, by = c('name' = 'artist'))


# construir funções -------------------------------------------------------

# o R funciona por meio das funções!
# function structure: name(argument 1, argument 2, ...){}

my_fun = function(x, y){
  temp = x + y * x/y
  return(temp)
}
my_fun(10, 12)

batata = function(x, y){ #nomes dos argumentos
  temp = x + y * x/y
  return(temp) #preciso colocar isso para me retornar o objeto/valor
} # {} corpo da função e indica que tudo aquilo vai ser rodado uma única vez
batata(10, 12)
batata(x=10, y=12)

# como eu uso uma condicional
my_fun2 = function(bolinha){ #posso colocar qualquer nome nos argumentos
  if(length(bolinha) > 10){
    names(bolinha) = LETTERS[1:length(bolinha)] # se o tamanho for maior que 10, coloque o nome como letra maiuscula
  }else{
    names(bolinha) = letters[1:length(bolinha)] # caso contrário, coloque como letra minuscula
  }
  return(bolinha)
}
my_fun2(seq(1,20,5)) # nomes dos vetores minúsculos
my_fun2(seq(1,100,5))

# Tools -> global options -> code -> display -> rainbow (para os parenteses terem cor, 
# conseguir diferenciar)


# listas ------------------------------------------------------------------


# using list:
my_fun3 = function(vec1, vec2 = rep(0, 10)){
  temp = vec1^2
  if(all(vec2!=0)){ # ! diferente de (vec2!=0 -> quais são os elementos diferentes de zero)
    # função if nao aceita altiput múltiplo (varios número), para isso uso "all" ou "any"
    # all(vec2!=0) -> todos os elementos do vetor 2 são diferentes de zero? -> resulta um termo só, consigo usar o if
    # any(vec2!=0) -> algum elemento do vetor 2 é diferente de zero?
    temp2 = vec2^2
    output = list("A" = temp, "B" = temp2) # se todos meus elementos do vetor 2 forem diferente de zero, vai gerar listas
  }else{
    output = temp # caso contrario sera só tempo
  }
  return(output)
}
my_fun3(vec1 = seq(1,20,5)) # ele ja entendeu que vec2 é um vetor cheio de zero, por conta do defaul da função
aux = my_fun3(vec1 = seq(1,20,5), vec2 = seq(20,50,10))
# se a lista for nomeada, consigo utiliza-la
aux$A
aux$B
aux[[1]] # se eu quero achar posição para listas, preciso usar dois colchetes [[]]


# apply family ------------------------------------------------------------

# apply: apply a function in a column (or a row) of a matrix

mat5
apply(mat5, 1, function(x){ # apply (matriz que eu quero a orientação, 
                            #        sentido da orientação: 1 linha / 2 coluna),
                            #        função que eu quero)
                            # cada x vai ser um vetor, trabalho com funções vetorizadas
                            # como orientei para a linha, cada linha da matriz será um x: x1, x2, etc
  if(any(x == 1)){ # se no vetor x tiver o número 1, mantenha os valores de x
    temp = x
  }else if(any(x == 2)){
    temp = x^2
  }else{
    temp = x^3
  }
  return(temp)
})
mat5
# na matriz que ele resulta vai ter transposta

# lapply: apply a function to elements in a list
lapply(aux, function(x){
  outer(x,x)
})

# sapply: same structure as lapply, but returns a “simpler” object
# nao gera uma lista, mas sim um vetor
sapply(aux, function(x){
  outer(x,x)
})

# tapply: splits a vector into groups based on factors and applies a function
tapply(df$pf, df$Hybrids, function(x) sum(x, na.rm = TRUE)) 
# tapply (vetor numerico, vetor de fatores)
# linca a posição dos vetores e depois coloca a função
# na.rm = TRUE -> remove os NAs
# se eu nao fizer o na.rm = TRUE, ele nao consegue somar ou fazer a média
tapply(df$pf, df[,c("Hybrids", "Years")], function(x) sum(is.na(x)))
# is.na = perguntando se esse vetor tem algum NA -> verdadeiro 1 / falso 0