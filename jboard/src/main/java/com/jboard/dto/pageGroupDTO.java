package com.jboard.dto;

public class pageGroupDTO {
	private int start;
	private int end;
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "pageGoupDTO [start=" + start + ", end=" + end + "]";
	}
	public pageGroupDTO(int start, int end) {
		this.start = start;
		this.end = end;
	}
	
	public pageGroupDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
}
