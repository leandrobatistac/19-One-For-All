DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans (
    plan_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(55) NOT NULL,
    plan_price DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_user VARCHAR(55) NOT NULL,
    last_name_user VARCHAR(55) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    signature_date DATETIME NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) engine = InnoDB;

CREATE TABLE artists (
    artist_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(55) NOT NULL
) engine = InnoDB;

CREATE TABLE albums (
    album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    album_release YEAR NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE musics (
    music_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    music_name VARCHAR(100) NOT NULL,
    music_duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE followed_artists (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE history (
    music_id INT NOT NULL,
    user_id INT NOT NULL,
	  date_play TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (music_id) REFERENCES musics(music_id),
	  CONSTRAINT PRIMARY KEY(user_id, music_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan_name, plan_price)
    VALUES
        ('gratuito', 0),
        ('familiar', 7.99),
		    ('universitario', 5.99),
		    ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (name_user, last_name_user, age, plan_id, signature_date)
    VALUES
        ('Barbara', 'Liskov', 82, 1, '2019-10-20'),
        ('Robert', 'Cecil Martin', 58, 1, '2017-01-06'),
        ('Ada', 'Lovelace', 37, 2, '2017-12-30'),
        ('Martin', 'Fowler', 46, 2, '2017-01-17'),
        ('Sandi', 'Metz', 58, 2, '2018-04-29'),
        ('Paulo', 'Freire', 19, 3, '2018-02-14'),
        ('Bell', 'Hooks',  26, 3, '2018-01-05'),
        ('Christopher', 'Alexander', 85, 4, '2019-06-05'),
        ('Judith', 'Butler', 45, 4, '2020-05-13'),
        ('Jorge', 'Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.artists (artist_name)
    VALUES
        ('Beyoncé'),
        ('Queen'),
		    ('Elis Regina'),
        ('Baco Exu do Blues'),
        ('Blind Guardian'),
		    ('Nina Simone');

INSERT INTO SpotifyClone.albums (album_name, album_release, artist_id)
    VALUES
        ('Renaissance', 2022, 1),
        ('Jazz', 1978, 2),
        ('Hot Space', 1982, 2),
        ('Falso Brilhante', 1988, 3),
        ('Vento de Maio', 2001, 3),
        ('QVVJFA?', 2003, 4),
        ('Somewhere Far Beyond', 2007, 5),
        ('I Put A Spell On You', 2010, 6);

INSERT INTO SpotifyClone.musics (music_name, music_duration, album_id)
    VALUES
        ('BREAK MY SOUL', 279, 1),
        ("VIRGO'S GROOVE", 369, 1),
        ('ALIEN SUPERSTAR', 116, 1),
        ("Don't Stop Me Now", 203, 2),
        ('Under Pressure', 152, 3),
        ('Como Nossos Pais', 105, 4),
        ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
        ('Samba em Paris', 267, 6),
        ("The Bard's Song", 244, 7),
        ('Feeling Good', 100, 8);


INSERT INTO SpotifyClone.followed_artists (user_id, artist_id)
    VALUES
        (1, 1),
        (1, 2),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (4, 4),
        (5, 5),
        (5, 6),
        (6, 1),
        (6, 6),
        (7, 6),
        (9, 3),
        (10, 2);

INSERT INTO SpotifyClone.history (user_id, music_id, date_play)
    VALUES
        (1, 8, '2022-02-28 10:45:55'),
        (1, 2, '2020-05-02 05:30:35'),
        (1, 10, '2020-03-06 11:22:33'),
        (2, 10, '2022-08-05 08:05:17'),
        (2, 7, '2020-01-02 07:40:33'),
        (3, 10, '2020-11-13 16:55:13'),
        (3, 2, '2020-12-05 18:38:30'),
        (4, 8, '2021-08-15 17:10:10'),
        (5, 8, '2022-01-09 01:44:33'),
        (5, 5, '2020-08-06 15:23:43'),
        (6, 7, '2017-01-24 00:31:17'),
        (6, 1, '2017-10-12 12:35:20'),
        (7, 4, '2011-12-15 22:30:49'),
        (8, 4, '2012-03-17 14:56:41'),
        (9, 9, '2022-02-24 21:14:22'),
        (10, 3, '2015-12-13 08:30:22');