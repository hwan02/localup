package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.Location;
import com.localup.persistence.MainDAO;
@Service
public class MainServiceImpl implements MainService{
	@Inject
	private MainDAO mainDAO;
	@Override
	public List<Location> listBoard(Location loc) {
		return mainDAO.listBoard(loc);
	}

}
