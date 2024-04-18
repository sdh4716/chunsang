package com.chunsang.pension.comm.service;
import java.util.*;

import javax.annotation.Resource;

public interface CommonService {
	
	//접속로그
	void insertSystemAccessLog(Map<String, Object> map) throws Exception;
}
