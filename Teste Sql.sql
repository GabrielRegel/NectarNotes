CREATE DATABASE MusicaDB;
USE MusicaDB;

CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Artistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    pais_origem VARCHAR(50)
);

CREATE TABLE Albuns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_artista INT,
    ano_lancamento YEAR,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id)
);

CREATE TABLE Musicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao TIME,
    id_album INT,
    id_artista INT,
    FOREIGN KEY (id_album) REFERENCES Albuns(id),
    FOREIGN KEY (id_artista) REFERENCES Artistas(id)
);

CREATE TABLE Playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_usuario INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

CREATE TABLE Playlist_Musicas (
    id_playlist INT,
    id_musica INT,
    PRIMARY KEY (id_playlist, id_musica),
    FOREIGN KEY (id_playlist) REFERENCES Playlists(id),
    FOREIGN KEY (id_musica) REFERENCES Musicas(id)
);

CREATE TABLE Comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_musica INT,
    id_usuario INT,
    comentario TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_musica) REFERENCES Musicas(id),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

CREATE TABLE Avaliacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_musica INT,
    id_usuario INT,
    avaliacao INT CHECK (avaliacao BETWEEN 1 AND 5),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_musica) REFERENCES Musicas(id),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);