let posts = document.querySelectorAll("article .conteudo")
let conteudo = []
console.log(posts)

for(let i=0; i < posts.length; i++){
    conteudo.push(posts[i].innerHTML) 
    console.log(posts[i])
    posts[i].innerHTML = posts[i].innerHTML.substring(0,15) + '...'
}


function leiaMais(button) {
    let id = button.id
    posts[id].innerHTML = conteudo[id]
}