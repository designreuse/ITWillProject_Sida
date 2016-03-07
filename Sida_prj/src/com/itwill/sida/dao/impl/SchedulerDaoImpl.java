package com.itwill.sida.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itwill.sida.dao.SchedulerDao;
import com.itwill.sida.dto.Scheduler;

import mybatis.mapper.SchedulerMapper;

@Component
public class SchedulerDaoImpl implements SchedulerDao {
	
	public SchedulerMapper schedulerMapper;
	
	public void setSchedulerMapper(SchedulerMapper schedulerMapper) {
		this.schedulerMapper = schedulerMapper;
	}

	@Override
	public void insertSchedule(Scheduler schedule) {
		schedulerMapper.insertSchedule(schedule);
	}

	@Override
	public List<Scheduler> selectAllSchedule() {
		List<Scheduler> scheduleList = schedulerMapper.selectAllSchedule();
		return scheduleList;
	}

	@Override
	public List<Scheduler> selectById(String s_m_email) {
		List<Scheduler> schedule = schedulerMapper.selectById(s_m_email);
		return schedule;
	}

	@Override
	public void deleteSchedule(int s_no) {
		schedulerMapper.deleteSchedule(s_no);
	}

	@Override
	public void updateSchedule(Scheduler schedule) {
		schedulerMapper.updateSchedule(schedule);
	}

	@Override
	public Scheduler selectByNo(int s_no) {
		Scheduler schedule = schedulerMapper.selectByNo(s_no);
		return schedule;
	}

	@Override
	public int countForAlarm(HashMap<String, String> sMap) {
		int count = schedulerMapper.countForAlarm(sMap);
		return count;
	}

	@Override
	public List<Scheduler> selectforHeadNav(HashMap<String, String> sMap) {
		List<Scheduler> schedule = schedulerMapper.selectforHeadNav(sMap);
		return schedule;
	}

	

	
}
