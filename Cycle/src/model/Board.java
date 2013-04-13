package model;

import java.text.DateFormat;
import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
//import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Text;

@PersistenceCapable(identityType = IdentityType.DATASTORE)

//게시판 모델
public class Board {
	// 번호
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.SEQUENCE)
	private Long seq;

	// 게시판 이름
	@Persistent
	private String boardName;
	
	// 게시물 제목
	@Persistent
	private String subject;
	
	
	// 게시물 내용
	@Persistent(defaultFetchGroup="true")
	private String content;
	
	// 글쓴이
	@Persistent
	private String user;
	//private UserBean user;	
	
	//올린 날짜
	@Persistent
	private Date posttime;
	private DateFormat tf = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT );
	private DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT );
	
	// 날짜 String
	@Persistent
	private String postdateStr ;	
	
	@Persistent
	private String posttimeStr ;
	
	// 조회수
	@Persistent
	private Integer viewcount;
	
	public Board(String boardName, String subject, String content, String user) {
		this.setBoardName(boardName);
		this.setSubject(subject);
		this.setContent(new String(content));
		this.setUser(user);
	}
	
	public void setSeq(String seq) {
		this.seq = Long.parseLong(seq);
	}
	
	public String getSeq() {
		String seqStr=Long.toString(this.seq);
		return seqStr;
	}
	
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}	

	public String getBoardName() {
		return boardName;
	}	
	
	public void setSubject(String subject) {
		this.subject = subject;
	}	

	public String getSubject() {
		return subject;
	}	
	
	public void setContent(String content) {
		this.content = content;
	}
	//수정해보자
	public String getContent() {
		return content;
	}	

	public void setUser(String user) {
		this.user = user;
	}
	
	public String getUser() {
		return user;
	}

	public void setPosttime(Date posttime) {
		this.posttime = posttime;
		this.posttimeStr = tf.format(posttime);
		this.postdateStr = df.format(posttime);		
	}
	
	public Date getPosttime() {
		return posttime;
	}

	public void setPosttimeStr(String posttimeStr) {
		this.posttimeStr = posttimeStr;
	}
	
	public String getPosttimeStr() {
		return posttimeStr;
	}	

	public void setPostdateStr(String postdateStr) {
		this.postdateStr = postdateStr;
	}
	
	public String getPostdateStr() {
		return postdateStr;
	}	
	
	public void setViewcount(Integer viewcount) {
		this.viewcount = viewcount;
	}
	
	public Integer getViewcount() {
		return viewcount;
	}	
}