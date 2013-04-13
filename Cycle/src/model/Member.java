package model;

import java.util.Date;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.jdo.annotations.Unique;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.DATASTORE)
public class Member {
	@PrimaryKey
	@Persistent (valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	
	@Persistent
	@Unique
	private Integer seq;
	
	@Persistent
	@Unique
	private String id;
	
	@Persistent
	private String password;	
	
	@Persistent
	private String name;

	@Persistent
	private String email;
	
	@Persistent
	private String address;
	
	@Persistent
	private String phone;
	
	@Persistent
	private String mobile;
	
	@Persistent
	private Date inDate;

	@Persistent
	private String authority="user";
	
	public Member(String id, String password) {
		this.setId(id);
		this.setPassword(password);
	}
	
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	public Integer getSeq() {
		return seq;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}	
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}	
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getMobile() {
		return mobile;
	}	
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	
	public Date getInDate() {
		return inDate;
	}
	
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public String getAuthority() {
		return authority;
	}	
}