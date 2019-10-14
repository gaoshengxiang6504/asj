package com.po;

public class Nave {
  private String title;
  private String name;
  private String date;
  
public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

@Override
public String toString() {
	return "Nave [title=" + title + ", name=" + name + ", date=" + date + "]";
}
  
}
