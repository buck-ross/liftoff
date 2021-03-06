CREATE TYPE permission_level AS ENUM(
	'Administrator',
	'Maintainer',
	'Contributor'
);

CREATE TABLE IF NOT EXISTS users (
	username varchar(255),
	email varchar(255),
	realname varchar(255),
	PRIMARY KEY(username),
	UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS groups (
	groupname varchar(255),
	grouptitle varchar(255),
	PRIMARY KEY(groupname)
);

CREATE TABLE IF NOT EXISTS group_membership (
	groupname varchar(255),
	username varchar(255),
	permission permission_level,
	PRIMARY KEY(groupname, username),
	FOREIGN KEY(groupname) REFERENCES groups(groupname) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE ON UPDATE CASCADE
);

