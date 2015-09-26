package resorces;

import java.util.Calendar;

public class TimeManager {
	
	public static String prettyStringFromCalendar(Calendar c){
		int day = c.get(Calendar.DAY_OF_MONTH);
		int month= c.get(Calendar.MONTH);
		int yr = c.get(Calendar.YEAR);
		int hr = c.get(Calendar.HOUR);
		if(hr==0)
			hr=12;
		int min = c.get(Calendar.MINUTE);
		int second = c.get(Calendar.SECOND);
		int am_pm = c.get(Calendar.AM_PM);
		
		String s = ""+day+"."+month+"."+yr+", "+hr+":"+min+":"+second;
		
		if(am_pm==Calendar.AM)
			s += " AM";
		else
			s += " PM";
		return s;
	} 
	
	public static void main(String[] args) {
		Calendar admissionTime = Calendar.getInstance();
		System.out.print(prettyStringFromCalendar(admissionTime));
	}
}
