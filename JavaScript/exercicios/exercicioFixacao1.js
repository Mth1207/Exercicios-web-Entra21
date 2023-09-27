var lista = []

function adicionar() {
    var entrada = document.getElementById("lista").value.trim()
    if (entrada ===""){
        alert("Você precisa digitar um número para adicionar!")
    }
    else if (isFinite(entrada)) {
        lista.push(parseInt(entrada))
        console.log(lista)
        limpar()
        mostrar()
    } else {
        alert("Digite um número válido para adicionar!")
    }
}

function mostrarResultado(resultado) {
    var resultadoDiv = document.getElementById("resultado")
    resultadoDiv.textContent = resultado
}

function ordenarLista(tipo) {
    if (tipo === "crescente") {
        lista.sort(function (a, b) {
            return a - b
        })
    } else if (tipo === "decrescente") {
        lista.sort(function (a, b) {
            return b - a
        })
    }

    mostrarResultado(lista.join(', '))
}

function mostrar() {
    var selecao = document.getElementsByName("tipo")
    var tipoSelecionado = ""

    for (let i = 0; i < selecao.length; i++) {
        if (selecao[i].checked) {
            tipoSelecionado = selecao[i].value
            break
        }
    }

    if (tipoSelecionado === "semOrdem") {
        mostrarResultado(lista.join(', '))
    } else {
        ordenarLista(tipoSelecionado)
    }
}

function limpar() {
    document.getElementById("lista").value = ""
}

function consultar() {
    var entrada = parseInt(document.getElementById("lista").value)
    var posicoes = []

    for (let i = 0; i < lista.length; i++) {
        if (lista[i] === entrada) {
            posicoes.push(i)
        }
    }

    if (posicoes.length > 0) {
        alert("O item " + entrada + " está na posição: " + posicoes)
    } else {
        alert("Item não encontrado na lista!")
    }
}

function remover() {
    var entrada = parseInt(document.getElementById("lista").value);
    var index = lista.indexOf(entrada);

    if (index !== -1) {
        lista.splice(index, 1);
        console.log(lista);
    } else {
        alert("Item não encontrado na lista");
    }

    mostrar()
}

function substituir() {
    var entrada = parseInt(document.getElementById("lista").value);
    var novoValor = parseInt(prompt("Informe o novo valor:"));

    var index = lista.indexOf(entrada);

    if (index !== -1) {
        lista[index] = novoValor;
        console.log(lista);
    } else {
        alert("Item não encontrado na lista");
    }

    mostrar()
}