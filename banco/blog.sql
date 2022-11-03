create table perfil (
	id int primary key auto_increment,
    descricao varchar(25)
);

create table usuario (
	id int primary key auto_increment,
    nome varchar(45),
    email varchar(45),
    senha varchar(5),
    perfil_id int,
    constraint fk_usuario_perfil foreign key (perfil_id) references perfil (id)
);
drop table usuario;

insert into perfil (descricao) values ("moderador");
insert into perfil (descricao) values ("usuario");
insert into usuario (nome, email, senha, perfil_id) values ("Adriana", "adriana@email", "12345", 1);

select * from usuario where email = "adriana@email";

create table post (
	id int primary key auto_increment,
    titulo varchar(45),
    conteudo varchar(1000),
    autor_id int,
    constraint fk_post_autor foreign key (autor_id) references usuario(id)
);

drop table post;

insert into post (titulo, conteudo, autor_id)
	values ("Título",
			"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut sodales urna. Curabitur a pharetra felis. 
            Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque dignissim, velit sed pellentesque viverra, 
            diam diam ullamcorper neque, vel congue lacus libero eu felis. Mauris tellus nunc, aliquet in lacus at, rhoncus 
            tristique justo. Fusce ac orci ut turpis venenatis placerat. Vestibulum bibendum nisi eros, tempor aliquam justo 
            molestie vitae. Morbi hendrerit, ante at eleifend aliquet, nisl tortor porttitor lacus, at accumsan massa justo in 
            tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies luctus dolor vel tincidunt. In nec
            sagittis nulla, nec finibus mauris. Vivamus eu odio ac erat efficitur feugiat. Morbi ultricies venenatis urna non convallis.",
            1);
            
insert into post (titulo, conteudo, autor_id)
	values ("Outro título",
			"Vivamus sit amet dolor felis. Maecenas lobortis enim eu sodales ullamcorper. Duis eleifend sagittis est ac lobortis. Nam auctor aliquet varius. Sed est erat, tristique eget mi eu, commodo vulputate urna. Praesent id accumsan nisi. Etiam accumsan convallis dolor, id vehicula nisl pellentesque id. Quisque feugiat magna interdum lacus commodo, eu bibendum nisl eleifend. In in tristique urna. Pellentesque feugiat turpis quis leo porttitor malesuada. Pellentesque non suscipit nulla, ut lobortis quam. Nullam et ultrices felis.",
            1);
            
create table comentario (
	id int primary key auto_increment,
    conteudo varchar(200),
    post_id int,
    autorizado boolean,
    constraint fk_comentario_post foreign key (post_id) references post(id)
);
drop table comentario;

select * from comentario;


