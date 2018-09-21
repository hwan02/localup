package com.localup.domain;

public class Location {
	private String south;
	private String north;
	private String west;
	private String east;
	public String getSouth() {
		return south;
	}
	public void setSouth(String south) {
		this.south = south;
	}
	public String getNorth() {
		return north;
	}
	public void setNorth(String north) {
		this.north = north;
	}
	public String getWest() {
		return west;
	}
	public void setWest(String west) {
		this.west = west;
	}
	public String getEast() {
		return east;
	}
	public void setEast(String east) {
		this.east = east;
	}
	@Override
	public String toString() {
		return "Location [south=" + south + ", north=" + north + ", west=" + west + ", east=" + east + "]";
	}
}
