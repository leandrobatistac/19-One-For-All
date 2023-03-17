CREATE TABLE IF NOT EXISTS favorites (
	user_id INT NOT NULL,
	music_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY (user_id, music_id),
	CONSTRAINT FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT FOREIGN KEY (music_id) REFERENCES musics(music_id)
);

INSERT INTO favorites(user_id, music_id)
	VALUES
	(1, 3),
    (1, 6),
    (1, 10),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 7),
    (4, 4),
    (5, 10),
    (5, 2),
    (8, 4),
    (9, 7),
    (10, 3);