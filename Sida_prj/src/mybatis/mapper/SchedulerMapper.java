package mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.itwill.sida.dto.Scheduler;

public interface SchedulerMapper {

	public List<Scheduler> selectAllSchedule();
	public List<Scheduler> selectById(String s_m_email);
	public Scheduler selectByNo(int s_no);
	public void deleteSchedule(int s_no);
	public void insertSchedule(Scheduler schedule);
	public void updateSchedule(Scheduler schedule);
	public int countForAlarm(HashMap<String, String> sMap);
	public List<Scheduler> selectforHeadNav(HashMap<String, String> sMap);
}
