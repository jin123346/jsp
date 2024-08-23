package com.jboard.util;

public class SQL {
	public static final String SELECT_TERMS= "select * from terms";
	
	
//	user
	public static final String INSERT_USER = "insert into `user` set "
															+ "uid=?, "
															+ "pass=SHA2(?,256), "
															+ "name=?, "
															+ "nick=?, "
															+ "email=?, "
															+ "hp=?, "
															+ "zip=?, "
															+ "addr1=?, "
															+ "addr2=?, "
															+ "regip=?, "
															+ "regDate=now()";

	public static final String SELECT_COUNT_USER= "SELECT COUNT(*) FROM `user` ";
	public static final String WHERE_UID = "where `uid`=?";
	public static final String WHERE_NICK = "where `nick`=?";
	public static final String WHERE_EMAIL = "where `email`=?";
	public static final String WHERE_HP = "where `hp`=?";
	
	
	public static final String SELECT_USER = "select * from `user` where `uid`=? and `pass`=SHA2(?,256)";
	
	
	
	
	//article
	public static final String SELECT_MAX_NO = "select Max(`no`) from `article`";
	
	public static final String SELECT_COUNT_TOTAL ="SELECT COUNT(*) FROM `article`";
	
	public static final String insert_article = "insert into `article` set "
																		+ "title=?, "
																		+ "contents=?, "
																		+ "file=?, "
																		+ "writer=?,"
																		+ "regip=?,"
																		+ "rdate=now()";
	
	public static final String SELECT_ARTICLE = "SELECT a.*, b.nick FROM article AS a "
												+ "JOIN `user` AS b ON a.writer=b.uid "
												+ "order by `no` desc "
												+ "limit ?,10";
	public static final String SELECT_ARTICLE_NO = "SELECT * FROM `article` AS a "
													+ "LEFT JOIN file AS b "
													+ "ON a.no = b.ano "
													+ "WHERE NO=?;";
	
	public static final String UPDATE_ARTICLE_HIT = "update `article` set hit= hit+1 where no = ?";
	
	
	//file
	
	public static final String INSERT_FILE = "insert into `file` set "
																		+ "ano= ? ,"
																		+ "oName= ? ,"
																		+ "sName=?, "
																		+ "rdate=now()";

	public static final String SELECT_FILES ="SELECT a.* FROM file AS a "
											+ "JOIN article AS b  ON a.ano= b.no "
											+ "WHERE b.no = ?";
	
	
	public static final String SELECT_FILE ="SELECT * FROM file WHERE fno = ?";
	public static final String UPLOAD_FILE_DOWNLOAD_COUNT="update file set `download` = `download`+1 where fno=?";
	
	
	
	public static final String DELETE_COMMENT_PARENT = "delete from `comment` where parent=?";
	public static final String DELETE_FILE_ANO= "delete from `FILE` where ANO=?";
	public static final String DELETE_ARTICLE_NO= "delete from `ARTICLE` where NO=?";
	
	//comment
	
	public static final String INSERT_COMMENT = "INSERT INTO `comment` SET `parent`=?, `content`=?, `writer` =?, `regip`=?, rdate=NOW()";
	public static final String INSERT_COMMENT_SELECT = "INSERT INTO `comment` SET `parent`=?, `content`=?, `writer` =?, `regip`=?, rdate=NOW()";
	public static final String SELECT_COMMENTS = "SELECT c.* , u.NICK FROM comment AS c JOIN `user` AS u ON  u.uid=c.writer where parent=? order by c.no";
	public static final String SELECT_COMMENTS_NO= "SELECT * FROM comment where no= ?";

	
	public static final String UPDATE_COMMENT= "UPDATE `comment` SET content = ?, rdate = now()  where `no` = ?";
	public static final String DELETE_COMMENT= "delete from `comment` where `no` =?";
}
