package com.po;

public class Content {
  private Integer tid;
  private String name;
  private String content;
  private String date;
  
public Integer getTid() {
	return tid;
}

public void setTid(Integer tid) {
	this.tid = tid;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

@Override
public String toString() {
	return "Content [tid=" + tid + ", name=" + name + ", content=" + content
			+ ", date=" + date + "]";
}
  
}
