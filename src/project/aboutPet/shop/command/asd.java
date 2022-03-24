package project.aboutPet.shop.command;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

public class asd {

	public static void main(String[] args) {

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String n = sdf.format(d);
		
		System.out.println(n);
		
		java.sql.Date now = java.sql.Date.valueOf(n);
		
		System.out.println(now);

	
	}

}
