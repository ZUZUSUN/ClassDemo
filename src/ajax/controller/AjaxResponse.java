package ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import ajax.model.ClassVO;
import ajax.model.UserVO;

public class AjaxResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxResponse() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		String gradeId = req.getParameter("gradeId");
		String classId = req.getParameter("classId");
		
		// �B�z�T���ʺA����ư϶�
		if ("getSelect".equals(action)) {
			JSONArray array = new JSONArray();
			// �d�ߦ~�šB�Z�Ź����P�Ǹ�ư϶�
			if (!"".equals(gradeId) && !"".equals(classId)) {
				/* ���@�϶�����service�h��Ʈw�̦~�šB�Z�Ŭd�ߨ��o */
				List<UserVO> list = null;
				if("AA101".equals(classId)){
					list = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�ժ���");
					user1.setNameId("1001");
					user1.setClassId("AA101");
					list.add(user1);
	
					UserVO user2 = new UserVO();
					user2.setName("������");
					user2.setNameId("1002");
					user2.setClassId("AA101");
					list.add(user2);
					
					UserVO user3 = new UserVO();
					user3.setName("������");
					user3.setNameId("1003");
					user3.setClassId("AA101");
					list.add(user3);
				}
				if("AA102".equals(classId)){
					list = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�զV�鸪");
					user1.setNameId("1004");
					user1.setClassId("AA102");
					list.add(user1);
	
					UserVO user2 = new UserVO();
					user2.setName("���V�鸪");
					user2.setNameId("1005");
					user2.setClassId("AA102");
					list.add(user2);
				}
				if("AB101".equals(classId)){
					list = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�i���p");
					user1.setNameId("1006");
					user1.setClassId("AB101");
					list.add(user1);
	
					UserVO user2 = new UserVO();
					user2.setName("��l�p");
					user2.setNameId("1007");
					user2.setClassId("AB101");
					list.add(user2);
				}
				if("AB102".equals(classId)){
					list = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�ԩ�");
					user1.setNameId("1008");
					user1.setClassId("AB102");
					list.add(user1);
	
					UserVO user2 = new UserVO();
					user2.setName("���");
					user2.setNameId("1009");
					user2.setClassId("AB102");
					list.add(user2);
				}
				if("AB103".equals(classId)){
					list = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("����");
					user1.setNameId("1010");
					user1.setClassId("AB103");
					list.add(user1);
				}
				if("AC101".equals(classId)){
					list = new ArrayList<UserVO>();
					UserVO user1 = new UserVO();
					user1.setName("�֥d�C1��");
					user1.setNameId("1011");
					user1.setClassId("AC101");
					list.add(user1);
					
					UserVO user2 = new UserVO();
					user2.setName("�֥d�C2��");
					user2.setNameId("1012");
					user2.setClassId("AC101");
					list.add(user2);
				}
				/*---------------------------------------------*/
				for (UserVO usb : list) {
					JSONObject obj = new JSONObject();
					
					try {
						obj.put("name", usb.getName());
						obj.put("nameId", usb.getNameId());
						obj.put("classId", usb.getClassId());
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					array.put(obj);
				}
			} else {
				/* ���@�϶�����service�h��Ʈw�̦~�šB�Z�Ŭd�ߨ��o */
				List<ClassVO> classList = null;
				if("grade1".equals(gradeId)){
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AA101");
					cls1.setClassName("�����Z");
					cls1.setGradeId("grade1");
					classList.add(cls1);
	
					ClassVO cls2 = new ClassVO();
					cls2.setClassId("AA102");
					cls2.setClassName("�V�鸪�Z");
					cls2.setGradeId("grade1");
					classList.add(cls2);
				}
				if("grade2".equals(gradeId)){
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AB101");
					cls1.setClassName("�p�p�Z");
					cls1.setGradeId("grade2");
					classList.add(cls1);
	
					ClassVO cls2 = new ClassVO();
					cls2.setClassId("AB102");
					cls2.setClassName("�L�L�Z");
					cls2.setGradeId("grade2");
					classList.add(cls2);
					
					ClassVO cls3 = new ClassVO();
					cls3.setClassId("AB103");
					cls3.setClassName("�N�N�Z");
					cls3.setGradeId("grade2");
					classList.add(cls3);
				}
				if("grade3".equals(gradeId)){
					classList = new ArrayList<ClassVO>();
					ClassVO cls1 = new ClassVO();
					cls1.setClassId("AC101");
					cls1.setClassName("�֥d�C�Z");
					cls1.setGradeId("grade3");
					classList.add(cls1);
				}
				/*---------------------------------------------*/
				for (ClassVO csb : classList) {
					JSONObject obj = new JSONObject();
					
					try {
						obj.put("classId", csb.getClassId());
						obj.put("gradeId", csb.getGradeId());

						obj.put("className", csb.getClassName());
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					array.put(obj);
				}
			}
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
