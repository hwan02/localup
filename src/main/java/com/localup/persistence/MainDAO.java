package com.localup.persistence;

import java.util.List;

import com.localup.domain.Location;

public interface MainDAO {
	public List<Location> listBoard(Location loc);
}
