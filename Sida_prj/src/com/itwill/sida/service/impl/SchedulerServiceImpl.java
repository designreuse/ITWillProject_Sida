package com.itwill.sida.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.itwill.sida.dao.SchedulerDao;
import com.itwill.sida.dto.Scheduler;
import com.itwill.sida.service.SchedulerService;

@Component
public class SchedulerServiceImpl implements SchedulerService {
	
	public SchedulerDao schedulerDao;
	
	public void setSchedulerDao(SchedulerDao schedulerDao) {
		this.schedulerDao = schedulerDao;
	}

	@Override
	public List<Scheduler> selectAllSchedule() {
		
		List<Scheduler> scList = schedulerDao.selectAllSchedule();
		return scList;
	}

	@Override
	public List<Scheduler> selectById(String s_m_email) {
		List<Scheduler> scheduleList = schedulerDao.selectById(s_m_email);
		return scheduleList;
	}

	@Override
	public void deleteSchedule(int s_no) {
		schedulerDao.deleteSchedule(s_no);
	}

	@Override
	public void insertSchedule(Scheduler schedule) {
		schedulerDao.insertSchedule(schedule);
	}

	@Override
	public void updateSchedule(Scheduler schedule) {
		schedulerDao.updateSchedule(schedule);
	}

	@Override
	public Scheduler selectByNo(int s_no) {
		Scheduler schedule = schedulerDao.selectByNo(s_no);
		return schedule;
	}

	@Override
	public int countForAlarm(HashMap<String, String> sMap) {
		int count = schedulerDao.countForAlarm(sMap);
		return count;
	}

	@Override
	public List<Scheduler> selectforHeadNav(HashMap<String, String> sMap) {
		List<Scheduler> scheduleList = schedulerDao.selectforHeadNav(sMap);
		return scheduleList;
	}

	
	
}
